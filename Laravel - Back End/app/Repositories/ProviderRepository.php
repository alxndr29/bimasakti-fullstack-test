<?php

namespace App\Repositories;

use App\Interfaces\ProviderInterface;
use App\Models\Provider;

class ProviderRepository extends BaseRepository implements ProviderInterface
{
    public function __construct(Provider $model)
    {
        $this->model = $model;
    }

    public function filterOptions()
    {
        return $this->model
            ->select('id', 'provider')
            ->orderBy('provider')
            ->get();
    }

    public function syncFromTransactions()
    {
        return collect();
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
