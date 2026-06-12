<?php

namespace App\Repositories;

use App\Interfaces\TransactionInterface;
use App\Models\Provider;
use App\Models\Transaction;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class TransactionRepository extends BaseRepository implements TransactionInterface
{
    public function __construct(Transaction $model)
    {
        $this->model = $model;
    }

    public function getAll(
        $select = [],
        $withRelations = [],
        $join = [],
        $filter = [],
        $where = null,
        $search = null,
        $sortOption = [],
        $paginateOption = [],
        $reformat = null,
    ) {
        $model = $this->model->query();

        $model->select('transactions.*');

        if (! empty($withRelations)) {
            $model->with($withRelations);
        }

        if (is_callable($where)) {
            $model->where($where);
        }

        $model->when($search, function ($query, $search) {
            $query->where('trx_id', 'ILIKE', "%{$search}%");
        });

        if ($this->filled($filter, 'providerId')) {
            $provider = Provider::find($filter['providerId']);

            if ($provider) {
                $model->where('provider', $provider->provider);
            } else {
                $model->whereRaw('1 = 0');
            }
        }

        if ($this->filled($filter, 'status')) {
            $model->where('status', $filter['status']);
        }

        $sortableColumns = [
            'trx_id',
            'provider',
            'product',
            'status',
            'amount',
            'created_at',
        ];
        $sortBy = Str::snake($this->input($sortOption, 'orderCol', 'created_at'));
        $sortBy = in_array($sortBy, $sortableColumns) ? $sortBy : 'created_at';
        $sortOrder = strtolower($this->input($sortOption, 'orderDir')) === 'asc'
            ? 'asc'
            : 'desc';

        $model->orderBy($sortBy, $sortOrder);

        $length = $this->input($paginateOption, 'length', 10);
        if (strtolower($this->input($paginateOption, 'method', 'paginate'))) {
            $model = $model->paginate(
                $length,
                ['*'],
                'page',
                $this->input($paginateOption, 'page'),
            );
        } else {
            $model = $model->limit($length)->get();
        }

        if (is_callable($reformat)) {
            $model = $reformat($model);
        }

        return $model;
    }

    public function summary()
    {
        return [
            'total' => $this->model->count(),
            'success' => $this->model->where('status', 'SUCCESS')->count(),
            'failed' => $this->model->where('status', 'FAILED')->count(),
            'total_amount' => $this->model->sum('amount'),
            'per_provider' => $this->model
                ->select('provider', DB::raw('count(*) as total'))
                ->groupBy('provider')
                ->orderByDesc('total')
                ->get(),
        ];
    }

    public function statuses()
    {
        return $this->model
            ->select('status')
            ->whereNotNull('status')
            ->distinct()
            ->orderBy('status')
            ->pluck('status');
    }

    public function syncRows(array $rows)
    {
        foreach ($rows as $row) {
            $this->model->updateOrCreate(
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
    }
}
