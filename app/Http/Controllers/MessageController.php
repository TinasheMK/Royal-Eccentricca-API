<?php

namespace App\Http\Controllers;

use App\Models\Shop;
use App\Models\Message;
use App\Models\User;
use App\Models\Category;
use Illuminate\Http\Request;
use PhpParser\Node\Expr\FuncCall;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Illuminate\Database\Eloquent\Builder;

class MessageController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index($user_id)
    {
        $user=User::where('id', $user_id)->get();

        $messages= User::find(Auth::user()->id)->messages
        ->where(
            'user_id',$user_id
        );

        $messages1= User::find($user_id)->messages
        ->where(
            'user_id',Auth::user()->id
        );


        foreach($messages1 as $message){
            if(!$message->reply){
                $message->is_read = true;
                $message->save();
            }
            else{

            }

        }



        return view('home.messaging.message', ['user'=>$user], ['messages'=>$messages]);
    }

    public function messages(){
        $messages =  User::find(Auth::user()->id)->messages;
        // dd($messages->sortByDesc('created_at'));
        $messages = $messages->sortByDesc('created_at');



        return view('home.profile.messages', ['messages'=>$messages]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create(Request $request)
    {

        // dd($request);
        $message = new Message([
            'user_id'       => $request->userid ,
            'reply' => false ,
            'body'          =>$request->body,
            ]);

        $user_id = Auth::user()->id;
        $message1 = new Message([
            'user_id'       => $user_id,
            'reply' => true ,
            'body'          =>$request->body,
            ]);

        $user = User::find($user_id);
        $user->messages()->save($message);

        $user = User::find($request->userid);
        $user->messages()->save($message1);

        $user->refresh();

        // dd($user->messages);

        return back();
    }

    public function contacts(){
        $contacts = User::find(Auth::user()->id)->contacts;
        // dd($contacts);

        return view('home.messaging.contacts', ['contacts'=>$contacts]);
    }
    public function subscriptions(){
        $contacts = User::find(Auth::user()->id)->subscriptions;
        if(!$contacts){
            $contacts = [];
        }

        return view('home.messaging.following', ['contacts'=>$contacts]);
    }

    public function addcontacts(User $contact){
        $user = User::find(Auth::user()->id);
        $user->contacts()->save($contact);
        // dd('jfj');

        return back();
    }
    public function deletecontact(User $contact){
        $user = User::find(Auth::user()->id);
        $user->contacts()->detach($contact);
        // dd('jfj');

        return back();
    }
    public function unsubscribe(Shop $shop){
        $user = User::find(Auth::user()->id);
        $contact = User::find($shop->user_id);
        $user->contacts()->detach($contact);
        $user->subscriptions()->detach($shop);

        return back();
    }
    public function subscribe(Shop $shop){
        $user = User::find(Auth::user()->id);
        $subscription = $user->subscriptions;
        foreach ($subscription as $sub){
            if($sub->id == $shop->id){
                return back()->with('success', 'Already Subscribed');
            }
        }
        $user->subscriptions()->save($shop);
        $contact = User::find($shop->user_id);
        $user->contacts()->save($contact);
        // dd('jfj');

        return back()->with('success', 'Subscribed');
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
     * @param  \App\Models\Message  $message
     * @return \Illuminate\Http\Response
     */
    public function show(Message $message)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Message  $message
     * @return \Illuminate\Http\Response
     */
    public function edit(Message $message)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Message  $message
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Message $message)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Message  $message
     * @return \Illuminate\Http\Response
     */
    public function destroy(Message $message)
    {
        //
    }
}
