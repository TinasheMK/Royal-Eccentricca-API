<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Models\Order;
use Paynow\Payments\Paynow;
use App\Models\Notification;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;

class WalletController extends Controller
{
    //
    public function index(){
        return view('home.wallet.addfunds');
    }

    public function add_funds(Request $request){


        // dd($cartitems);
        // dd(uniqid() );


         $user = User::find(Auth::user()->id);


            $ordersave = [
                'order_number' => uniqid(),
                'user_id'            =>     Auth::user()->id ,
                'status'             =>     false ,
                'item_count'        =>      1 ,
                'grand_total'         =>    $request->amount ,
                'is_paid'           =>      false ,
                'payment_method'      =>    1 ,


                'shipping_fullname' => "Add Funds" ,
                'shipping_adress'   => "virtual" ,
                'shipping_city'     => "virtual" ,
                'shipping_state'    => "virtual" ,
                'shipping_type'  => 2  ,
                'shipping_zipcode'  => 1  ,
                'shipping_phone'    => 0 ,
                'notes'             => 'Default' ,


                'billing_fullname'     =>   "virtual" ,
                'billing_adress'      =>    "virtual" ,
                'billing_city'        =>    "virtual" ,
                'billing_state'       =>    "virtual" ,
                'billing_zipcode'      =>   1,
                'billing_phone'       =>    1,
            ];


        $order = new Order($ordersave);
        // dd($ordersave);

        //save order to user
        $user = User::find(Auth::user()->id);
        $user->order()->save($order);




        $you = Auth::user()->id;
        $notification = new Notification([
            'user_id'       => $you ,
            'title' =>' <a href="/profile">Order Placed</a>' ,
            'description'          =>"You have placed an order. Order will be ready in 2-4 days. " ,
            ]);
                    // emails
        $user->notification()->save($notification);
        // $user->notify(new OrderPlaced($order));


        // Mail::to($user)->send(new OrderComplete($order));


        $shops = [];


            // Save order items




        $paynow = new Paynow(
            '12085',
            'f16c5e2a-5b9d-4f9a-8ee3-7798ba0c1d32',
            'https://kamusika.com/wallet/order/payment-complete/'.$order->order_number,
            'https://kamusika.com/owner/order/payment-process-complete'
        );


        $payment = $paynow->createPayment($order->order_number ,$user->email);




        $payment->add('Add funds to account.', $request->amount);

        // Optionally set a description for the order.
        // By default, a description is generated from the items
        // added to a payment
        $payment->setDescription($user->name."'s Kamusika add funds.");


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
    public function getbalance(Request $request){

         $user = User::find(1);
         return response()->json([
            'message' => '45'
        ]);
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
        $user = User::find(Auth::user()->id);
        if($status->paid()){
                    $user->deposit($order->grand_total);
                    $order->status = 1;
                    $order->save();

            return view('cart.done',['result'=>'Payment Received', 'order'=>$order, 'items'=>$items]);
        }
        else{
                    return view('cart.done',['result'=>'Payment Failed','order'=>$order, 'items'=>$items]);

        }



    }
}
