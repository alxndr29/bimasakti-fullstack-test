<?php

namespace App\Interfaces;

interface ProviderInterface
{
    public function findById($id, $withRelations = []);

    public function filterOptions();

    public function syncFromTransactions();

    public function upsertProviders(array $providers);
}
