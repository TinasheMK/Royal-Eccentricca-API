<?php

namespace App\Http\Livewire;

use Livewire\Component;
use Darryldecode\Cart\Facades\CartFacade as Cart1;

class Cartform extends Component
{

    public $item;
    public $quantity;

    public function mount($item){
        $this->quantity = $item->quantity;
    }

    public function upcart(){

        $i = $this->item->toarray();

        $userId = auth()->user()->id;
        $cart1 = Cart1::session($userId);
        $cart1->update($i["id"], array(
        'quantity' => 1,
        ));

        $this->quantity = $cart1->get($i["id"])->quantity;



    }

    public function downcart(){
        $i = $this->item->toarray();

        $userId = auth()->user()->id;
        $cart1 = Cart1::session($userId);
        $cart1->update($i["id"], array(
        'quantity' => -1,
        ));

        $this->quantity = $cart1->get($i["id"])->quantity;



    }

    public function render()
    {
        return view('livewire.cartform');
    }
}
