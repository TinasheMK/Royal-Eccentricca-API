<?php

namespace App\Http\Controllers;

use App\Models\Shop;
use App\Models\User;
use App\Models\Order;
use App\Models\Pickup;
use App\Mail\OrderDone;
use App\Models\Message;
use App\Models\Product;
use App\Mail\OrderComplete;
use App\Mail\OrderShop;
use Paynow\Payments\Paynow;
use App\Models\Notification;
use Illuminate\Http\Request;
use App\Notifications\NewOrder;
use App\Notifications\OrderPlaced;
use Illuminate\Support\Facades\DB;
use App\Mail\ShopActivationRequest;
use Darryldecode\Cart\Facades\CartFacade as Cart;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Mail;

class OrderController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request){

        // dd($request);
        $cartitems = Cart::session(Auth::user()->id)->getContent();

        $fee = 99;

        // dd($cartitems);
        // dd(uniqid() );


         $user = User::find(Auth::user()->id);

        $user->address = $request->address;
        $user->city = $request->city;
        $user->country = $request->country;
        $user->phone = $request->phone;
        $user->save();


        $user = User::find(Auth::user()->id);
         $pickup = Pickup::find($request->pickup);


        if($request->pickup){
            $ordersave = [
                'order_number' => uniqid(),
                'user_id'            =>     Auth::user()->id ,
                'status'             =>     false ,
                'item_count'        =>      Cart::session(Auth::user()->id)->getContent()->count() ,
                'grand_total'         =>    Cart::getTotal() ,
                'is_paid'           =>      false ,
                'payment_method'      =>    1 ,


                'shipping_fullname' => $user->name ,
                'shipping_adress'   => $pickup->address ,
                'shipping_city'     => $pickup->region_name ,
                'shipping_state'    => $pickup->country ,
                'shipping_zipcode'  => 1  ,
                'shipping_type'  => 1  ,
                'shipping_phone'    => 1 ,
                'notes'             => $request->notes ,


                'billing_fullname'     =>   $user->name ,
                'billing_adress'      =>    $user->address ,
                'billing_city'        =>    $user->city ,
                'billing_state'       =>    $user->country ,
                'billing_zipcode'      =>   1,
                'billing_phone'       =>    1,
            ];
        }
        else{
            $ordersave = [
                'order_number' => uniqid(),
                'user_id'            =>     Auth::user()->id ,
                'status'             =>     false ,
                'item_count'        =>      Cart::session(Auth::user()->id)->getContent()->count() ,
                'grand_total'         =>    Cart::getTotal() ,
                'is_paid'           =>      false ,
                'payment_method'      =>    1 ,


                'shipping_fullname' => $user->name ,
                'shipping_adress'   => $user->address ,
                'shipping_city'     => $user->city ,
                'shipping_state'    => $user->country ,
                'shipping_type'  => 2  ,
                'shipping_zipcode'  => 1  ,
                'shipping_phone'    => 1 ,
                'notes'             => 'Default' ,


                'billing_fullname'     =>   $user->name ,
                'billing_adress'      =>    $user->address ,
                'billing_city'        =>    $user->city ,
                'billing_state'       =>    $user->country ,
                'billing_zipcode'      =>   1,
                'billing_phone'       =>    1,
            ];
        }

        $order = new Order($ordersave);
        // dd($ordersave);

        //save order to user
        $user = User::find(Auth::user()->id);
        $user->order()->save($order);




        $you = Auth::user()->id;
        $message = new Notification([
            'user_id'       => $you ,
            'title' =>' <a href="/profile">Order Placed</a>' ,
            'description'          =>"You have placed an order. Order will be ready in 2-4 days. " ,
            ]);
        // emails
        $user->notification()->save($message);
        // $user->notify(new OrderPlaced($order));


        Mail::to($user)->send(new OrderComplete($order));


        $shops = [];


        // Save order items
        foreach($cartitems as $item){
            $atts = '';
            if(count(Cart::get($item->id)->attributes)==0){
                $atts ='{"color":"#ffffff00"}';
            }
            else{
                $atts = Cart::get($item->id)->attributes;

            }
            $product = Product::find($item->id);

            $qty = Cart::get($item->id)->quantity;
            $product->order()->Attach($order, ['quantity' =>$qty, 'price' =>$product->price*$qty,  'attributes' =>$atts]);



            //saving order to ascociated shop
            if (in_array($item->associatedModel->shop_id, $shops)){
                //silence is key
            }
            else{
                $shop = Shop::find($item->associatedModel->shop_id);
                $shop->order()->save($order);
                array_push($shops,$item->associatedModel->shop_id);
                $user2 = Shop::find($item->associatedModel->shop_id)->user;
                // dd($user);

                $not1 = new Notification([
                    'user_id'       => $user2->id,
                    'title' =>'<a href="/owner"> New Order </a>' ,
                    'description'          =>"You have a new order. Order number  ".$order->order_number ,
                    ]);

                $user2->notification()->save($not1);
                // $user2->notify(new NewOrder($order));
                Mail::to($shop->user)->send(new OrderShop($order));


            }


        }


        if($request->method== 'paynow'){



            $paynow = new Paynow(
                '12085',
                'f16c5e2a-5b9d-4f9a-8ee3-7798ba0c1d32',
                'https://kamusika.com/owner/order/payment-complete/'.$order->order_number,
                'https://kamusika.com/owner/order/payment-process-complete'
            );


            $payment = $paynow->createPayment($order->order_number ,$user->email);



            foreach($cartitems as $item){
                $product = Product::find($item->id);

            }
            $payment->add('Pickup Fee', $fee);

            // Optionally set a description for the order.
            // By default, a description is generated from the items
            // added to a payment
            $payment->setDescription($user->name."'s Kamusika Order Pickup Fee");


            // Initiate a Payment
            $response = $paynow->send($payment);
            // dd($response);


            if(!$response->success){

            echo("  <h2>An error occured while communicating with Paynow Service. This is a temporary issue try again later.
            If this error persists contact us and we will be glad to help.</h2>
                <p><?= $response->error ?></p>");
            }
            else{



                DB::table('order_status')->insert([
                    'ref' => $order->order_number,
                    'poll_url' => $response->pollUrl()
                ]);


                return redirect($response->redirectUrl());



            }
        }
        if($request->method== 'wallet'){

            $user = User::find(Auth::user()->id);
            $items = $order->items;
            if($user->balance>=$fee){
                        $order->status = 2;
                        $user->withdraw($fee);
                        $order->save();
                        $order->refresh();
                        Cart::session(Auth::user()->id)->clear();

                return view('cart.done',['result'=>'Payment Was Successful.', 'order'=>$order, 'items'=>$items]);
            }
            else{
                        return view('cart.done',['result'=>'Payment Failed. Insufficient Balance.','order'=>$order, 'items'=>$items]);

            }

        }

        return back();
    }

    //for testing
    public function addfunds( $amount){


        $user = User::find(1);

        $user->address = "245 Mainway";
        $user->city = "Harare";
        $user->country = "Zimbabwe";
        $user->phone = "98888";
        $user->save();

        $ordersave = [
            'order_number' => uniqid(),
            'user_id'            =>     $user->id ,
            'status'             =>     false ,
            'item_count'        =>      $amount ,
            'grand_total'         =>    $amount,
            'is_paid'           =>      false ,
            'payment_method'      =>    1 ,


            'shipping_fullname' => $user->name ,
            'shipping_adress'   => $user->address ,
            'shipping_city'     => $user->address ,
            'shipping_state'    => $user->address ,
            'shipping_zipcode'  => 1  ,
            'shipping_type'  => 1  ,
            'shipping_phone'    => 1 ,
            'notes'             => "none" ,


            'billing_fullname'     =>   $user->name ,
            'billing_adress'      =>    $user->address ,
            'billing_city'        =>    $user->city ,
            'billing_state'       =>    $user->country ,
            'billing_zipcode'      =>   1,
            'billing_phone'       =>    1,
        ];


        $order = new Order($ordersave);
        // dd($ordersave);

        //save order to user
        $user = User::find(1);
        $user->order()->save($order);

        return response()->json([
            'message' => 'Successfully created add funds invoice'
        ]);
    }
    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }
    public function resend(Order $order)
    {
        Mail::to(Auth::user()->email)->send(new OrderComplete($order));
        return redirect(route('profile'))->with('success','Email resent');
    }
    public function callback()
    {




        // $product = new Pickup();
        //     $product->name = 'EastMAll';
        //     $product->address = 'EastMAll';
        //     $product->region_name = 'EastMAll';
        //     $product->country = 'EastMAll';
        //     $product->save();

    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Order  $order
     * @return \Illuminate\Http\Response
     */
    public function show(Order $order)
    {
        $items = $order->items;
        return view('shop.orderdetails',['order'=>$order, 'items'=>$items]);
    }
    public function showadmin(Order $order)
    {
        $items = $order->items;
        return view('admin.orderdetails',['order'=>$order, 'items'=>$items]);
    }
    public function showuser(Order $order)
    {
        $items = $order->items;
        return view('home.profile.orderdetails',['order'=>$order, 'items'=>$items]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Order  $order
     * @return \Illuminate\Http\Response
     */
    public function edit(Order $order)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Order  $order
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request)
    {
        //order is done
            $order = Order::find($request->orderid);
            $order->status = 1;
            $order->save();
            $order->refresh();
            // dd($order->user);
            Mail::to($order->user)->send(new OrderDone($order));

            //notifications
            $message = new Notification([
                'user_id'       => $order->user->id ,
                'title' =>' <a href="/profile">Order Completed</a>' ,
                'description'          =>"Your order was successsfuly picked up. Order number ".$order->order_number.". Thank you for shopping with Kamusika." ,
                ]);

            $order->user->notification()->save($message);

            foreach($order->shop as $o){

                Mail::to($o->user)->send(new OrderDone($order));

                //notifications
                $message = new Notification([
                    'user_id'       => $o->user->id ,
                    'title' =>' <a href="/profile">Order Completed</a>' ,
                    'description'          =>"Order was successfuly picked up. Order number ".$order->order_number.". We will be processing your transaction soon." ,
                    ]);

                $o->user->notification()->save($message);
            }
           return back()->with('success', 'Order has been updated!');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Order  $order
     * @return \Illuminate\Http\Response
     */
    public function destroy(Order $order)
    {
        //
    }
    public function deliveries()
    {
        //
        $pickups = Pickup::get();
        // dd($pickups);
        return view('cart.deliveries',['pickups'=>$pickups]);
    }
    public function payments(Request $request)
    {
        //
        $pickup = Pickup::find($request->pickup);
        // dd($pickup);
        return view('cart.payments', ['pickup'=>$pickup]);
    }


    public function received($order)
    {
        $paynow = new Paynow(
            '12085',
            'f16c5e2a-5b9d-4f9a-8ee3-7798ba0c1d32',
            'https://kamusika.com/owner/order/payment-complete/'.$order,
            'https://kamusika.com/owner/order/payment-process-complete'
        );

        $pollurl = DB::table('order_status')->where('ref', $order)->first()->poll_url;

        $status = $paynow->pollTransaction($pollurl);

                    $order = Order::where('order_number', $order)->first();
                    $items = $order->items;
        if($status->paid()){
                    $order->status = 2;
                    $order->save();
                    Cart::session(Auth::user()->id)->clear();

            return view('cart.done',['result'=>'Payment Received', 'order'=>$order, 'items'=>$items]);
        }
        else{
                    return view('cart.done',['result'=>'Payment Failed','order'=>$order, 'items'=>$items]);

        }



    }

}
