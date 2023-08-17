<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Shop extends Model
{
    use HasFactory;
    protected $fillable = [
        'name', 'description', 'shop_id','price','cover_img'
    ];

    public function user(){

        return $this->belongsTo(User::class);
    }

    public function products(){

        return $this->hasMany(Product::class);
    }
    public function posts(){

        return $this->hasMany(Post::class);
    }

    public function order(){
        return $this->belongsToMany(Order::class);
    }
    public function followers(){

        return $this->belongsToMany(User::class, 'subscriptions');
    }

}
