<?php

namespace App\Models;

use App\Models\User;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Product extends Model
{


    use HasFactory;


    protected $fillable = [
        'name', 'description','price', 'images'
    ];
    public function shop(){

        return $this->belongsTo(Shop::class);
    }

    public function category(){

        return $this->belongsToMany(Category::class, 'product_categories');
    }
    public function tags()
    {
        return $this->belongsToMany(Tag::class);
    }
    public function comments()
    {
        return $this->hasMany(Comment::class);
    }
    public function ratings()
    {
        return $this->hasMany(Rating::class);
    }
    public function order()
    {
        return $this->belongsToMany(Order::class)->withPivot('quantity', 'price');
    }
    public function user()
    {
        return $this->belongsToMany(User::class, 'wishlists');
    }
    public function attributes(){
        return $this->belongsToMany(Attribute::class,'product_attribute');
    }
    public function values(){
        return $this->hasMany(Values::class);
    }

    public function images(){

        return $this->hasMany(Image::class);
    }
}
