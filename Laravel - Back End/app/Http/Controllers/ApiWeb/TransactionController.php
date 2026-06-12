<?php

namespace App\Http\Controllers\ApiWeb;

use App\Helpers\ResponseFormatter;
use App\Http\Controllers\Controller;
use App\Models\Provider;
use App\Models\Transaction;
use App\Services\TransactionApiService;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class TransactionController extends Controller
{
    /**
     * @OA\Get(
     *   tags={"ApiWeb|Transaction"},
     *   path="/api-web/transaction",
     *   summary="Transaction list",
     *   @OA\Parameter(
     *     name="search",
     *     in="query",
     *     @OA\Schema(type="string")
     *   ),
     *   @OA\Parameter(
     *     name="provider",
     *     in="query",
     *     @OA\Schema(type="string")
     *   ),
     *   @OA\Parameter(
     *     name="status",
     *     in="query",
     *     @OA\Schema(type="string")
     *   ),
     *   @OA\Parameter(
     *     name="limit",
     *     in="query",
     *     @OA\Schema(type="integer", example="10")
     *   ),
     *   @OA\Parameter(
     *     name="sortBy",
     *     in="query",
     *     @OA\Schema(type="string")
     *   ),
     *   @OA\Parameter(
     *     name="sortOrder",
     *     in="query",
     *     @OA\Schema(type="string", enum={"asc","desc"})
     *   ),
     *   @OA\Parameter(
     *     name="page",
     *     in="query",
     *     @OA\Schema(type="integer", example="1")
     *   ),
     *   @OA\Response(response="default", ref="#/components/responses/globalResponse")
     * )
     */
    public function index(Request $request)
    {
        $request->validate([
            'page' => 'nullable|numeric',
            'limit' => 'nullable|numeric|min:0|max:100',
        ]);

        $query = Transaction::query();

        if ($request->filled('search')) {
            $query->where('trx_id', 'ILIKE', '%'.$request->search.'%');
        }

        if ($request->filled('provider')) {
            $query->where('provider', $request->provider);
        }

        if ($request->filled('status')) {
            $query->where('status', $request->status);
        }

        $sortableColumns = ['trx_id', 'provider', 'product', 'status', 'amount', 'created_at'];
        $sortBy = Str::snake((string) $request->sort_by);
        $sortBy = in_array($sortBy, $sortableColumns) ? $sortBy : 'created_at';
        $sortOrder = strtolower((string) $request->sort_order) === 'asc' ? 'asc' : 'desc';

        $query->orderBy($sortBy, $sortOrder);

        $transactions = $query->paginate(
            $request->limit ?: 10,
            ['*'],
            'page',
            $request->page ?: 1,
        );

        return ResponseFormatter::success($transactions, 'Data berhasil ditampilkan');
    }

    /**
     * @OA\Get(
     *   tags={"ApiWeb|Transaction"},
     *   path="/api-web/transaction/summary",
     *   summary="Transaction dashboard summary",
     *   @OA\Response(response="default", ref="#/components/responses/globalResponse")
     * )
     */
    public function summary()
    {
        $total = Transaction::count();
        $success = Transaction::where('status', 'SUCCESS')->count();
        $failed = Transaction::where('status', 'FAILED')->count();
        $totalAmount = Transaction::sum('amount');

        $perProvider = Transaction::select('provider', DB::raw('count(*) as total'))
            ->groupBy('provider')
            ->orderByDesc('total')
            ->get();

        return ResponseFormatter::success([
            'total' => $total,
            'success' => $success,
            'failed' => $failed,
            'total_amount' => $totalAmount,
            'per_provider' => $perProvider,
        ], 'Data berhasil ditampilkan');
    }

    /**
     * @OA\Get(
     *   tags={"ApiWeb|Transaction"},
     *   path="/api-web/transaction/filters",
     *   summary="Transaction filter options (providers & statuses)",
     *   @OA\Response(response="default", ref="#/components/responses/globalResponse")
     * )
     */
    public function filters()
    {
        $providers = Provider::orderBy('provider')->pluck('provider');

        $statuses = Transaction::select('status')
            ->distinct()
            ->orderBy('status')
            ->pluck('status');

        return ResponseFormatter::success([
            'providers' => $providers,
            'statuses' => $statuses,
        ], 'Data berhasil ditampilkan');
    }

    /**
     * @OA\Post(
     *   tags={"ApiWeb|Transaction"},
     *   path="/api-web/transaction/sync",
     *   summary="Sync transaction data from external API",
     *   @OA\Response(response="default", ref="#/components/responses/globalResponse")
     * )
     */
    public function sync(TransactionApiService $transactionApiService)
    {
        $result = $transactionApiService->getTransactionsToday();

        if (! $result['success']) {
            return ResponseFormatter::error($result['code'], $result['message']);
        }

        $rows = $result['data']['data'] ?? [];

        $providerResult = $transactionApiService->getProviders();
        $providers = $providerResult['success'] ? ($providerResult['data']['data'] ?? []) : [];

        DB::transaction(function () use ($rows, $providers) {
            foreach ($rows as $row) {
                Transaction::updateOrCreate(
                    ['trx_id' => $row['trx_id']],
                    [
                        'provider' => $row['provider'],
                        'product' => $row['product'],
                        'status' => $row['status'],
                        'amount' => $row['amount'],
                        'created_at' => $row['created_at'],
                    ],
                );
            }

            foreach ($providers as $provider) {
                Provider::updateOrCreate(
                    ['provider' => $provider['provider']],
                    ['fee_percent' => $provider['fee_percent']],
                );
            }
        });

        return ResponseFormatter::success(
            ['synced' => count($rows)],
            'Sinkronisasi data berhasil',
        );
    }
}
