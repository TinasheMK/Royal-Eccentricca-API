<x-home>


    <x-slot name="css">
        <link rel="stylesheet" href="{{ mix('css/app.css') }}">
    </x-slot>

    <x-slot name="content">
        <div class="content">


            <!--Top Slide!-->
            <div class="panel-header custom-back">
                <div class="page-inner py-5">
                    <div class="d-flex align-items-left align-items-md-center flex-column flex-md-row">
                        <div>
                            <h2 class="text-white pb-2 fw-bold">Search Results</h2>
                            <h5 class="text-white op-7 mb-2">Here are some results I found for you.</h5>
                        </div>

                    </div>
                </div>
            </div>
            <div class="page-inner mt--5">

                <section>
                    <div class="">
                        <div class="row">
                            <div class="col-md-10 mr-auto ml-auto">

                                <!--Search Space-->
                                <div class="card p-4">
                                    <div class="section-title-4 text-center mb-40 mt-5" style="margin-bottom: 50px;">
                                        <h2>Search Results</h2>
                                    </div>
                                    <form action="{{route('home.search')}}" method="GET">
                                        <div class="form-group">
                                            <label for="email2">Search for Products and Shops.</label>

                                            <div class="input-icon">
                                                <input type="text" name="query" class="form-control" placeholder="Search for...">
                                                <span class="input-icon-addon">
                                                    <i class="fa fa-search"></i>
                                                </span>
                                            </div>
                                        </div>
                                    </form>

                                    <div class="top-product-style">
                                        <!--Grid Products-->
                                        <div class="shop-product-wrapper">
                                            <div class="shop-bar-area">
                                                @if(count($shops->all())==0)
                                                @else
                                                <div class="card">
                                                    <div class="card-body">
                                                        <div class="card-title fw-mediumbold"><h4>Shops: </h4></div>
                                                        <div class="card-list">
                                                            @foreach ($shops as $shop)
                                                                <div class="item-list">
                                                                    @php
                                                                        $images= json_decode($shop->shop_image);
                                                                        if($images == NULL){
                                                                            $img="";
                                                                        }
                                                                        else{
                                                                            $img= $images[0];
                                                                        }
                                                                    @endphp
                                                                    <div class="avatar">
                                                                        <img src="{{asset('storage/uploads/'.$shop->user_id.'/cache/'.$img)}}" onerror="this.src='{{asset('assets/img/494.jpg')}}'" alt="..." class="avatar-img rounded">
                                                                    </div>
                                                                    <a href="{{route('home.shop',$shop->id)}}">
                                                                    <div class="info-user ml-3">
                                                                        <div class="username">{{$shop->name}}</div>
                                                                        <div class="status">{{$shop->description}}</div>
                                                                    </div>
                                                                    </a>
                                                                </div>
                                                            @endforeach
                                                        </div>
                                                    </div>
                                                </div>
                                                @endif
                                                <div class="shop-product-content tab-content">

                                                    <div id="grid-sidebar10" class="tab-pane fade active show">
                                                        <div class="">
                                                            @if(count($allproducts->all())==0)
                                                                <h4>Sorry we do not have that product yet. Try again in the future.</h4>
                                                            @else
                                                                @foreach ($allproducts as $product )
                                                                    <div class="">
                                                                        @php
                                                                            $images= json_decode($product->cover_img);
                                                                            $img= $images[0] ?? '';
                                                                            if($images == NULL){
                                                                                $img="";
                                                                            }
                                                                        @endphp
                                                                        <div class="product-wrapper mb-30 single-product-list product-list-right-pr mb-60" style="margin-bottom: 50px;">
                                                                            <div class="product-img list-img-width">
                                                                                <a href="{{route('home.product',$product->id)}} ">
                                                                                    <img src="{{asset('storage/uploads/'.$product->shop->user->id.'/'.$img)}}" alt="..." class="avatar-img rounded">
                                                                                </a>
                                                                                {{-- <span>hot</span> --}}
                                                                                {{-- <div class="product-action-list-style">
                                                                                    <a class="animate-right" title="Quick View" data-toggle="modal" data-target="#exampleModal{{$product->id}}" href="#">
                                                                                        <i class="fas fa-eye "></i>
                                                                                    </a>
                                                                                </div> --}}
                                                                            </div>
                                                                            <div class="product-content-list">
                                                                                <div class="product-list-info">
                                                                                    <h4> <a href="{{route('home.product',$product->id)}} ">{{$product->name}}</a></h4>
                                                                                    <span>${{$product->price}}</span>
                                                                                    <p>Desciption: {{$product->description}} </p>
                                                                                </div>
                                                                                <div class="">
                                                                                    <a href="{{route('wishlist.add',$product->id)}}">
                                                                                        <button class="mt-3 btn btn-default">
                                                                                            <span class="btn-label">
                                                                                                <i class="fas fa-heart"></i>
                                                                                            </span>
                                                                                            WishList
                                                                                        </button>
                                                                                    </a>
                                                                                    <a href="{{route('home.product',$product->id)}} ">
                                                                                        <button class="mt-3 btn btn-danger">
                                                                                            <span class="btn-label">
                                                                                                <i class="fas fa-shopping-bag"></i>
                                                                                            </span>
                                                                                            View
                                                                                        </button>
                                                                                    </a>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                @endforeach
                                                            @endif
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="card-body">

                                        </div>
                                        <!--end grid products-->
                                        <div >
                                            <div class="row">
                                                <div class="col-md-4">
                                                    {{ $allproducts->onEachSide(5)->links() }}
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>

                </section>
            </div>

        </div>


    </x-slot>



</x-home>
