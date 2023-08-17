<?php

namespace App\Http\Livewire;

use Livewire\Component;
use Darryldecode\Cart\Facades\CartFacade as Cart1;
use Illuminate\Support\Facades\Auth;

class Cart extends Component
{
    public $allcartitems;

    public function mount(){
        $this->allcartitems = Cart1::session(Auth::user()->id)->getContent();;
    }



    public function render()
    {
        return view('livewire.cart');
    }

}
