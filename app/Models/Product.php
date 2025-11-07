<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasOne;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Product extends Model
{
    protected $fillable = [
        'category_id', 
        'manufacturer_id', 
        'name', 
        'slug', 
        'price', 
        'stock_quantity', 
        'description'
    ];
    
    public function category(): BelongsTo
    {
        return $this->belongsTo(Category::class);
    }

    public function manufacturer(): BelongsTo
    {
        return $this->belongsTo(Manufacturer::class);
    }

    public function details(): HasOne
    {
        return $this->hasOne(ProductDetail::class, 'product_id', 'id');
    }

    public function images(): HasMany
    {
        return $this->hasMany(ProductImage::class);
    }

    public function iotDevices(): HasMany
    {
        return $this->hasMany(IoTDevice::class);
    }
}