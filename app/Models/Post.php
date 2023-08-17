<?php

namespace App\Models;

use App\Models\Shop;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Post extends Model
{
    use HasFactory;

    protected $fillable = [
    'caption' ,'media_link','location'  ,'shop_id', 'title'
    ];

    public function comments()
    {
        return $this->hasMany(Comment::class);
    }

    public function shop()
    {
        return $this->belongsTo(Shop::class);
    }
}
