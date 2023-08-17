<?php

namespace App\Http\Livewire;

use App\Models\Shop;
use App\Models\User;
use App\Models\Product;
use Livewire\Component;
use Illuminate\Support\Facades\Auth;

class RecommendHome extends Component
{
    public $welcome = 1;

    public $limitPerPage = 12;

    protected $listeners = [
        'load-more' => 'loadMore'
    ];

    public function loadMore()
    {
        $this->limitPerPage = $this->limitPerPage + 18;

    }


    public function render()
    {
        $suggestions = Shop::where('is_active',1)->inRandomOrder()->take(100)->get();
        $posts = Product::inRandomOrder()->paginate($this->limitPerPage);

        $shopids = [];

        if(Auth::user()){
            $user = User::find(Auth::user()->id);
            $subscription = $user->subscriptions;
            if($subscription){
                foreach ($subscription as $sub){
                    array_push($shopids,$sub->id);
                    $suggestions = $suggestions->except($sub->id);
                }
            }
        }


        $suggestions=$suggestions->take(3);
        $this->emit('postStore');

        return view('livewire.recommend-home', ['products' => $posts, 'suggestions'=>$suggestions]);
    }
}



