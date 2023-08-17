<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('Home') }}
        </h2>
    </x-slot>



    <div class = 'row'>
    @foreach ($allproducts as $product)


            <div class='col-3'>
                <div class="card ">
                    <img class="card-img-top" src="{{asset('dummy.jpg')}}" alt="Card image">
                    <div class="card-body">
                        <h4 class="card-title">{{$product->name}}</h4>
                        <p class="card-text">{{$product->description}}</p>
                    </div>
                    <div class="card-body">
                        <a href="{{route('cart.add', $product->id)}}" class="card-link">Add To Cart</a>
                        <a href="#" class="card-link">Another link</a>
                    </div>
                </div>
            </div>


    @endforeach
    </div>


</x-app-layout>
