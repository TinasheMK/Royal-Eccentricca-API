<?php

namespace App\Http\Controllers;

use App\Models\Shop;
use App\Models\User;
use App\Models\Order;
use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Darryldecode\Cart\Facades\CartFacade as Cart;
use Illuminate\Support\Facades\Auth;


class CartController extends Controller
{
    //
    public function add($productid){

        $product = Product::find($productid);
        // $rowId = 456; // generate a unique() row ID


        // add the product to cart
        Cart::session(Auth::user()->id)->add(array(
            'id' => $product->id,
            'name' => $product->name,
            'price' => $product->price,
            'quantity' => 1,
            'attributes' => array(),
            'associatedModel' => $product
        ));



         return back();

    }
    public function add_advanced(Request $request){

        $product = Product::find($request->productid);
        $atts = [];
        if($request->color){
            $atts['color']=$request->color;
        }
        if($request->size){
            $atts['size']=$request->size;
        }
        if($request->numbersize){
            $atts['numbersize']=$request->numbersize;
        }
        Cart::session(Auth::user()->id)->add(array(
            'id' => $product->id,
            'name' => $product->name,
            'price' => $product->price,
            'quantity' => 1,
            'attributes' => $atts,
            'associatedModel' => $product
        ));



         return back();

    }

    public function index(){

        $cartitems = Cart::session(Auth::user()->id)->getContent();

        return view('cart.index', ['allcartitems'=>$cartitems]);
    }

    public function up($product){

        return back();
    }
    public function down($product){

        return back();
    }
    public function delete($product){

        $userId = auth()->user()->id;
        $cart1 = Cart::session($userId);
        $cart1->remove($product);

        return back();
    }
}
