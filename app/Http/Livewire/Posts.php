<?php

namespace App\Http\Livewire;

use App\Models\Post;
use App\Models\Shop;
use App\Models\User;
use Illuminate\Support\Facades\Auth;
use Livewire\Component;

class Posts extends Component
{
    public $welcome = 1;

    public $limitPerPage = 12;

    protected $listeners = [
        'load-more' => 'loadMore'
    ];

    public function loadMore()
    {
        $this->limitPerPage = $this->limitPerPage + 14;

    }

    public function render()
    {
        $posts = Post::latest()->inRandomOrder()->paginate($this->limitPerPage);
        $suggestions = Shop::where('is_active',1)->inRandomOrder()->take(100)->get();

        $shopids = [];
        $user = User::find(Auth::user()->id);
        $subscription = $user->subscriptions;
        if($subscription){
            foreach ($subscription as $sub){
                array_push($shopids,$sub->id);
                $suggestions = $suggestions->except($sub->id);
            }
        }
        $suggestions=$suggestions->take(3);
        $this->emit('postStore');

        return view('livewire.posts', ['posts' => $posts, 'suggestions'=>$suggestions]);
    }
}
