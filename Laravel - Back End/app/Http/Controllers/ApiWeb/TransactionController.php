<?php

namespace App\Http\Controllers\ApiWeb;

use App\Helpers\ResponseFormatter;
use App\Http\Controllers\Controller;
use App\Interfaces\ProviderInterface;
use App\Interfaces\TransactionInterface;
use App\Services\TransactionApiService;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class TransactionController extends Controller
{
    public function __construct(
        private TransactionInterface $transactionRepository,
        private ProviderInterface $providerRepository,
    ) {}

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
     *     name="providerId",
     *     in="query",
     *     @OA\Schema(type="integer")
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

        $transactions = $this->transactionRepository->getAll(
            filter: [
                'providerId' => $request->input('provider_id', $request->input('providerId')),
                'status' => $request->status,
            ],
            search: $request->search,
            sortOption: [
                'orderCol' => $request->sort_by,
                'orderDir' => $request->sort_order,
            ],
            paginateOption: [
                'method' => 'paginate',
                'length' => $request->limit,
                'page' => $request->page,
            ],
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
        return ResponseFormatter::success(
            $this->transactionRepository->summary(),
            'Data berhasil ditampilkan',
        );
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
        return ResponseFormatter::success([
            'providers' => $this->providerRepository->filterOptions(),
            'statuses' => $this->transactionRepository->statuses(),
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
            $this->transactionRepository->syncRows($rows);
            $this->providerRepository->upsertProviders($providers);
        });

        return ResponseFormatter::success(
            ['synced' => count($rows)],
            'Sinkronisasi data berhasil',
        );
    }
}
