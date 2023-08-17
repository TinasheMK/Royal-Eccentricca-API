@if($allproducts!=null)
@foreach ( $allproducts as $product )
    @if(count($product->category->all()))
        @if($product->category[0]->name==$cat)
            @if($product->status)

                <div class="custom-col-style-2 col-6 col-sm-4 col-lg-2">
                    <div class="card    product-wrapper product-border ">
                        <div class="product-img-3">
                            <a href="{{route('home.product', $product->id)}}">
                                @php
                                $cover  = $product->cover_img;
                                $cover = substr($cover, 1);
                                $cover = substr($cover, 1);
                                $cover = substr_replace($cover ,"",-1);
                                $cover = substr_replace($cover ,"",-1);
                                @endphp
                                <img src="{{asset('storage/uploads/'.$product->shop->user->id.'/'.$cover)}}" onerror="this.src='{{asset('assets/img/494.jpg')}}'" alt="..." class="avatar-img rounded">

                                {{-- <img class="p-1" src="{{asset('assets/img/Phones/Samsung/A10')}} Samsung.jpg" alt=""> --}}
                            </a>
                            <div class="product-action-right">
                                <a class="" href="#" data-target="#exampleModal{{$product->id}}" data-toggle="modal" title="Quick View">
                                    <button class="animate-right btn btn-icon btn-info">
                                        <i class="fas fa-eye "></i>
                                    </button>
                                </a>
                                @if ($product->attributes->count())
                                <a class="" href="#" data-target="#exampleModal{{$product->id}}" data-toggle="modal" title="Quick View">
                                    <button class="animate-right btn btn-icon btn-success">
                                        <i class="fas fa-cart-plus"></i>
                                    </button>
                                </a>
                                @else
                                    <a class="" href="{{route('cart.add',$product->id)}}"    title="Add To Cart">
                                        <button class="animate-right btn btn-icon btn-success">
                                            <i class="fas fa-cart-plus"></i>
                                        </button>
                                    </a>
                                @endif

                                @if (isset($wish))
                                    <a class="" href="{{route('wishlist.delete',$product->id)}}" data-target="#exampleModal{{$product->id}}" title="Remove From Wishlist">
                                        <button class="animate-right btn btn-icon btn-danger">
                                            <i class="fas fa-trash"></i>
                                        </button>
                                    </a>
                                @else

                                    <a class="" href="{{route('wishlist.add',$product->id)}}" data-target="#exampleModal{{$product->id}}" title="Add To Wishlist">
                                        <button class="animate-right btn btn-icon btn-warning">
                                            <i class="far fa-heart"></i>
                                        </button>
                                    </a>
                                @endif


                            </div>
                        </div>
                        <div class="product-content-1 p-1 text-center">
                            <h5><a href="{{route('home.product',$product->id)}}">{{$product->name}}</a></h5>
                            <label>$ {{$product->price}}</label>
                        </div>
                    </div>
                </div>
            @endif
        @endif
    @endif
@endforeach
@endif

@if($allproducts1!=null)
@foreach ($allproducts1 as $product)
    @if(count($product->category->all()))
        @if($product->category[0]->name==$cat)
            @if($product->status)
                <div class="modal fade" id="exampleModal{{$product->id}}" tabindex="-1" role="dialog" aria-hidden="true">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span class="pe-7s-close" aria-hidden="true"></span>
                    </button>
                    <div class="modal-dialog modal-quickview-width" role="document">
                        <div class="modal-content">
                            <div class="modal-body">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-12 col-sm-12 col-md-12 col-xl-7">
                                            <h1 class="d-inline-block d-sm-none">{{$product->name}}</h1>
                                            <div class="col-12">
                                                @php
                                                    $cover  = $product->cover_img;
                                                    $cover = substr($cover, 1);
                                                    $cover = substr($cover, 1);
                                                    $cover = substr_replace($cover ,"",-1);
                                                    $cover = substr_replace($cover ,"",-1);
                                                @endphp
                                                <img src="{{asset('storage/uploads/'.$product->shop->user->id.'/'.$cover)}}" alt="..." class="avatar-img rounded">
                                                {{-- <img src="../assets/img/img/prod-1.jpg" class="card-img" alt="Product Image"> --}}
                                            </div>
                                            <div class="mt-4 product-share">

                                                </div>
                                                @if ($message = Session::get('success'))
                                                    <div class="alert alert-success">
                                                        <strong>{{ $message }}</strong>
                                                    </div>
                                                @endif

                                                <h4 class="mt-3">Rating </h4>
                                                <span class="btn-label">
                                                    <div class="row pl-3">
                                                        <span>
                                                            <form class="navbar-left navbar-form nav-search mr-md-3" action="{{route('rating.rate')}}" method="GET">
                                                                <button type="submit" class="btn btn-icon btn-link" style=" width:auto; height: auto; line-height: normal; min-width: 0;">
                                                                    <input type="hidden" name='rating' value="1">
                                                                    <input type="hidden" name='product_id' value="{{$product->id}}">
                                                                    @if ($product->rating>=1)

                                                                        <i class="far fas fa-star" style="color: #d2c63b"></i>
                                                                    @else
                                                                        <i class="far fas fa-star" style="color: #d3d3cf"></i>

                                                                    @endif
                                                                </button>
                                                            </form>
                                                        </span>
                                                        <span>
                                                            <form class="navbar-left navbar-form nav-search mr-md-3" action="{{route('rating.rate')}}" method="GET">
                                                                <button type="submit" class="btn btn-icon btn-link" style=" width:auto; height: auto; line-height: normal; min-width: 0;">
                                                                    <input type="hidden" name='rating' value="2">
                                                                    <input type="hidden" name='product_id' value="{{$product->id}}">
                                                                    @if ($product->rating>=2)

                                                                        <i class="far fas fa-star" style="color: #d2c63b"></i>
                                                                    @else
                                                                        <i class="far fas fa-star" style="color: #d3d3cf"></i>

                                                                    @endif
                                                                </button>
                                                            </form>
                                                        </span>
                                                        <span>
                                                            <form class="navbar-left navbar-form nav-search mr-md-3" action="{{route('rating.rate')}}" method="GET">
                                                                <button type="submit" class="btn btn-icon btn-link" style=" width:auto; height: auto; line-height: normal; min-width: 0;">
                                                                    <input type="hidden" name='rating' value="3">
                                                                    <input type="hidden" name='product_id' value="{{$product->id}}">

                                                                    @if ($product->rating>=3)

                                                                        <i class="far fas fa-star" style="color: #d2c63b"></i>
                                                                    @else
                                                                        <i class="far fas fa-star" style="color: #d3d3cf"></i>

                                                                    @endif
                                                                </button>
                                                            </form>
                                                        </span>

                                                        <span>
                                                            <form class="navbar-left navbar-form nav-search mr-md-3" action="{{route('rating.rate')}}" method="GET">
                                                                <button type="submit" class="btn btn-icon btn-link" style=" width:auto; height: auto; line-height: normal; min-width: 0;">
                                                                    <input type="hidden" name='rating' value="4">
                                                                    <input type="hidden" name='product_id' value="{{$product->id}}">


                                                                    @if ($product->rating>=4)

                                                                        <i class="far fas fa-star" style="color: #d2c63b"></i>
                                                                    @else
                                                                        <i class="far fas fa-star" style="color: #d3d3cf"></i>

                                                                    @endif
                                                                </button>
                                                            </form>
                                                        </span>
                                                        <span>
                                                            <form class="navbar-left navbar-form nav-search mr-md-3" action="{{route('rating.rate')}}" method="GET">
                                                                <button type="submit" class="btn btn-icon btn-link" style=" width:auto; height: auto; line-height: normal; min-width: 0;">
                                                                    <input type="hidden" name='rating' value="5">
                                                                    <input type="hidden" name='product_id' value="{{$product->id}}">

                                                                    @if ($product->rating>=5)

                                                                        <i class="far fas fa-star" style="color: #d2c63b"></i>
                                                                    @else
                                                                        <i class="far fas fa-star" style="color: #d3d3cf"></i>

                                                                    @endif
                                                                </button>
                                                            </form>
                                                        </span>

                                                        <div class="col-6"><small>{{$product->ratings->count()}} ratings</small></div>
                                                    </div>
                                                </span>
                                                <div ><small>Rate this product!</small></div>
                                        </div>
                                        <div class="col-12 col-sm-12 col-md-12 col-xl-5">
                                            <h3 class="my-3 page-title">{{$product->name}}</h3>
                                            {!! html_entity_decode($product->description) !!}
                                            <h4 class="mt-3 page-title">Available Stock :
                                                @if($product->status)
                                                    <span style="color: green"> {{$product->status}}</span>
                                                @else
                                                    <span style="color: red">Sold Out</span>
                                                @endif
                                            </h4>


                                            @php
                                                $ats = [];
                                                $atribs = $product->attributes;

                                                foreach ($atribs as $a) {
                                                    $name = strtolower($a->name);
                                                    array_push($ats,$name );
                                                    if($name=='color'){
                                                        $colorid=$a->id;
                                                    }
                                                    if($name=='size'){
                                                        $sizeid=$a->id;
                                                    }
                                                    if($name=='numbersize'){
                                                        $numbersizeid=$a->id;
                                                    }
                                                }
                                                // dd($ats);

                                            @endphp

                                            <form action="{{route('cart.advanced.add')}}" method="post">
                                                @csrf
                                                <input name="productid" type="hidden" value="{{$product->id}}"  required>

                                                {{-- Product Attributes --}}
                                                @if (in_array('color',$ats))
                                                    @php
                                                $colors = [];
                                            @endphp
                                                    <h4 class="mt-3 page-title">Colors <small>Select a color</small></h4>
                                                    <div class="form-group">
                                                        <div class="row selectgroup gutters-xs">
                                                            @foreach ($product->values as $v )
                                                                @if ($v->attribute_id == $colorid)
                                                                    @php
                                                                        $colors= explode(',',$v->value);
                                                                    @endphp
                                                                @endif
                                                            @endforeach
                                                            @foreach ($colors as $col)
                                                                <div class="col-auto">
                                                                    <label class="colorinput selectgroup-item">
                                                                        <input name="color" type="radio" value="{{$col}}" required class="colorinput-input" required>
                                                                        <span class="colorinput-color " style="background-color:{{$col}}"></span>
                                                                    </label>
                                                                </div>
                                                            @endforeach
                                                        </div>
                                                    </div>
                                                @endif
                                                @if (in_array('size',$ats))
                                                @php
                                                $sizes = [];
                                            @endphp
                                                    <h4 class="mt-3 page-title">Sizes <small>Select size</small></h4>
                                                    <div class="form-group">

                                                        <div class="selectgroup w-100">
                                                            @foreach ($product->values as $v )
                                                                @if ($v->attribute_id == $sizeid)
                                                                    @php
                                                                        $sizes = explode(',',$v->value);
                                                                    @endphp

                                                                @endif

                                                            @endforeach
                                                            @foreach ($sizes as $sz)
                                                                @php
                                                                    $szu = strtoupper($sz);
                                                                @endphp
                                                                <label class="selectgroup-item">
                                                                    <input type="radio" name="size" value="{{$sz}}" class="selectgroup-input" required>
                                                                    <span class="selectgroup-button">{{$szu}}</span>
                                                                </label>
                                                            @endforeach
                                                        </div>
                                                    </div>
                                                @endif
                                                @if (in_array('numbersize',$ats))
                                                @php
                                                $sizes = [];
                                            @endphp
                                                    <h4 class="mt-3 page-title">Sizes <small>Select size</small></h4>
                                                    <div class="form-group">

                                                        <div class="selectgroup w-100">
                                                            @foreach ($product->values as $v )
                                                                @if ($v->attribute_id == $numbersizeid)
                                                                    @php
                                                                        $sizes = explode(',',$v->value);
                                                                    @endphp

                                                                @endif

                                                            @endforeach
                                                            @foreach ($sizes as $sz)
                                                                @php
                                                                    $szu = strtoupper($sz);
                                                                @endphp
                                                                <label class="selectgroup-item">
                                                                    <input type="radio" name="numbersize" value="{{$sz}}" class="selectgroup-input" required>
                                                                    <span class="selectgroup-button">{{$szu}}</span>
                                                                </label>
                                                            @endforeach
                                                        </div>
                                                    </div>
                                                @endif
                                                {{-- End Product Attributes --}}

                                                <div class="card card-primary bg-primary-gradient">
                                                    <div class="card-body">
                                                        <h2 class="mb-0">
                                                            $ {{$product->price}}
                                                        </h2>
                                                        <h4 class="mt-0">
                                                            <small>Ex Tax: $80.00 </small>
                                                        </h4>
                                                    </div>
                                                </div>

                                                {{-- Cart and wishlist buttons  --}}
                                                <div class="mt-4 product-share">
                                                    <div class="">
                                                        <p class="demo">
                                                            <button type="submit" class="btn btn-primary">
                                                                <span class="btn-label">
                                                                    <i class="fas fa-cart-plus"></i>
                                                                </span>
                                                                Add To Cart
                                                            </button>
                                                            <a href="{{route('wishlist.add',$product->id)}}" class="btn btn-default">
                                                                <span class="btn-label">
                                                                    <i class="far fa-heart"></i>
                                                                </span>
                                                                Wishlist
                                                            </a>

                                                        </p>
                                                    </div>
                                                    <a href="{{route('cart.index')}}" class="btn btn-success btn-lg">
                                                            <span class="pr-3  ">Proceed To Checkout</span>
                                                            <span class="btn-label">
                                                                <i class="fas fa-chevron-right"></i>
                                                            </span>
                                                    </a>
                                                </div>
                                                {{-- End cart and wishlist buttons  --}}
                                            </form>


                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            @endif
        @endif
    @endif
@endforeach
@endif
