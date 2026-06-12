<?php

namespace App\Interfaces;

interface TransactionInterface
{
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
    );

    public function summary();

    public function statuses();

    public function syncRows(array $rows);
}
