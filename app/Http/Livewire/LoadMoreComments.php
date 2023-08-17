<?php

namespace App\Http\Livewire;

use App\Models\Post;
use App\Models\User;
use App\Models\Product;
use Livewire\Component;

class LoadMoreComments extends Component
{
    public $perPage = 2;
    public $post;
    public $product;

    protected $listeners = [
        'load-more' => 'loadMore'
    ];

    /**
     * Write code on Method
     *
     * @return response()
     */
    public function loadMore()
    {
        $this->perPage = $this->perPage + 5;

    }

    /**
     * Write code on Method
     *
     * @return response()
     */
    public function render()
    {
        if($this->post){
            $comments = Post::find($this->post)->comments()->latest()->paginate($this->perPage);
        }
        if($this->product){
            $comments = Product::find($this->product)->comments()->latest()->paginate($this->perPage);
        }
        $this->emit('commentStore');
        // dd($comments);

        return view('livewire.load-more-comments', ['comments' => $comments]);
    }
}
