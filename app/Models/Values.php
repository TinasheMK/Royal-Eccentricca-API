<?php

namespace App\Models;

use App\Models\Product;
use App\Models\Attribute;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Values extends Model
{
    use HasFactory;

    public function attribute(){
        return $this->belongsTo(Product::class);
    }
}
