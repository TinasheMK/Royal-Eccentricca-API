<?php

namespace App\Models;

use App\Models\User;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Order extends Model
{
    use HasFactory;

    protected $fillable = [
        'order_number'  ,
        'user_id'          ,
        'status'           ,
        'item_count'       ,
        'grand_total'      ,
        'is_paid'          ,
        'payment_method'   ,
        'shipping_fullname',
        'shipping_adress'  ,
        'shipping_city'    ,
        'shipping_state'   ,
        'shipping_type'   ,
        'shipping_zipcode' ,
        'shipping_phone'   ,
        'notes'        ,
        'billing_fullname',
        'billing_adress'  ,
        'billing_city'    ,
        'billing_state'   ,
        'billing_zipcode' ,
        'billing_phone'   ,
    ];

    public function shop(){
        return $this->belongsToMany(Shop::class);
    }
    public function user(){
        return $this->belongsTo(User::class);
    }
    public function items(){
        return $this->belongsToMany(Product::class)->withPivot('quantity', 'price', 'attributes');
    }

}
