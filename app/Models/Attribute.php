<?php

namespace App\Models;

use App\Models\Values;
use App\Models\Product;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Attribute extends Model
{
    use HasFactory;

    public function products(){
        return $this->belongsToMany(Product::class, 'product_attribute');
    }

    public function values(){
        return $this->hasMany(Values::class, 'values');
    }
}
