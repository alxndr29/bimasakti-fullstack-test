<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

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

    public function transactions(): HasMany
    {
        return $this->hasMany(Transaction::class, 'provider_id');
    }
}
