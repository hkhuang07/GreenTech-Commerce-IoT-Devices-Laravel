<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

class IoTDevice extends Model
{
    protected $fillable = [
        'product_id', 
        'device_id', 
        'location', 
        'is_active', 
        'last_seen'
    ];

    protected function casts(): array
    {
        return [
            'last_seen' => 'datetime',
            'is_active' => 'boolean',
        ];
    }
    
    public function product(): BelongsTo
    {
        return $this->belongsTo(Product::class);
    }

    public function metrics(): HasMany
    {
        return $this->hasMany(DeviceMetric::class);
    }

    public function alertThresholds(): HasMany
    {
        return $this->hasMany(AlertThreshold::class);
    }
}