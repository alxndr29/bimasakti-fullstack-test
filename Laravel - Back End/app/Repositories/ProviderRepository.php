<?php

namespace App\Repositories;

use App\Interfaces\ProviderInterface;
use App\Models\Provider;
use App\Models\Transaction;

class ProviderRepository extends BaseRepository implements ProviderInterface
{
    public function __construct(Provider $model)
    {
        $this->model = $model;
    }

    public function filterOptions()
    {
        $this->syncFromTransactions();

        return $this->model
            ->select('id', 'provider')
            ->orderBy('provider')
            ->get();
    }

    public function syncFromTransactions()
    {
        return Transaction::select('provider')
            ->whereNotNull('provider')
            ->distinct()
            ->pluck('provider')
            ->map(function (string $provider) {
                return $this->model->firstOrCreate(
                    ['provider' => $provider],
                    ['fee_percent' => 0],
                );
            });
    }

    public function upsertProviders(array $providers)
    {
        foreach ($providers as $provider) {
            $this->model->updateOrCreate(
                ['provider' => $provider['provider']],
                ['fee_percent' => $provider['fee_percent'] ?? 0],
            );
        }
    }
}
