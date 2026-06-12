<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Provider extends Model
{
    protected $table = 'providers';

    protected $fillable = [
        'provider',
        'fee_percent',
    ];

    protected $casts = [
        'fee_percent' => 'decimal:2',
    ];
}
