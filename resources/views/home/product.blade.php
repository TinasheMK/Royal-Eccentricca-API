<x-home>


    <x-slot name="head">
        <!-- overlayScrollbars -->
		{{-- <link rel="stylesheet" href="{{asset('assets/assets/css/adminlte.css')}}"> --}}

    </x-slot>

    <x-slot name="sidebar">
        @include('home.sidebar.sidebar')
    </x-slot>

    <x-slot name="content">
        <div class="content">


            <!--Top Slide!-->
            <div class="panel-header custom-back">
                <div class="page-inner">
                    <div class="d-flex align-items-left align-items-md-center flex-column flex-md-row">

                    </div>
                </div>
            </div>
            <div class="page-inner mt--5">
                @include('home.navigation')





                <!--Cateories and main slide-->

                <section >




                    <div class="overflow clearfix">
                        <div class="categori-menu-slider-wrapper clearfix">
                            <div class="categories-menu">
                                <div class="category-heading">
                                    <h3 class="pr-3"> Product</h3>
                                </div>
                                <div class="category-menu-list">
                                    <ul>

                                    </ul>
                                </div>
                            </div>
                            <div class="">


                                <div class="single-slider single-slider-hm3 bg-img pt-170 pb-173" >


                                    <!-- Content Wrapper. Contains page content -->




                                <!-- Main content -->
                                <section class="content">

                                      <!-- Default box -->
                                      <div class="card card-solid ">


                                            <div class="card-body">
                                                <div class="row">
                                                    <div class="col-12 col-sm-12 col-md-6 col-xl-6">
                                                        <h1 class="d-inline-block d-sm-none">{{$product->name}}</h1>
                                                        <div class="col-12">
                                                            @php
                                                                $images= json_decode($product->more_imgs);
                                                                $cover  = $product->cover_img;
                                                                $cover = substr($cover, 1);
                                                                $cover = substr($cover, 1);
                                                                $cover = substr_replace($cover ,"",-1);
                                                                $cover = substr_replace($cover ,"",-1);
                                                                if($images == NULL){
                                                                    $images = array();
                                                                }
                                                            @endphp
                                                            {{-- <img src="{{asset('storage/uploads/'.$product->shop->user->id.'/'.$cover)}}" alt="..." class="avatar-img rounded"> --}}
                                                            {{-- <img src="../assets/img/img/prod-1.jpg" class="card-img" alt="Product Image"> --}}
                                                        </div>

                                                        <div class="card-body">

                                                            <div class="tab-content mt-2 mb-3" id="pills-without-border-tabContent">
                                                                <div class="tab-pane fade show active" id="pills-home-nobd" role="tabpanel" aria-labelledby="pills-home-tab-nobd">
                                                                    <img src="{{asset('storage/uploads/'.$product->shop->user->id.'/'.$cover)}}" alt="..." class="avatar-img rounded">
                                                                </div>
                                                                @foreach ($images as $image)
                                                                    <div class="tab-pane fade" id="{{$image}}" role="tabpanel" aria-labelledby="pills-profile-tab-nobd">
                                                                        <img src="{{asset('storage/uploads/'.$product->shop->user->id.'/'.$image)}}" alt="..." class="avatar-img rounded">
                                                                    </div>
                                                                @endforeach
                                                            </div>
                                                            <ul class="nav nav-pills nav-default nav-pills-no-bd row" id="pills-tab-without-border" role="tablist" style="background-color: #7c7c7c3b;">
                                                                <li class="nav-item col" style="max-width: 20%">
                                                                    <a class="nav-link active p-0" id="pills-home-tab-nobd" data-toggle="pill" href="#pills-home-nobd" role="tab" aria-controls="pills-home-nobd" aria-selected="false">
                                                                        <img src="{{asset('storage/uploads/'.$product->shop->user->id.'/cache/'.$cover)}}" alt="..." class="avatar-img rounded">
                                                                    </a>
                                                                </li>
                                                                @foreach ( $images as $image)
                                                                    <li class="nav-item submenu col" style="max-width: 20%">
                                                                        <a class="nav-link p-0" id="pills-profile-tab-nobd" data-toggle="pill" href="#{{$image}}" role="tab" aria-controls="pills-profile-nobd" aria-selected="false">
                                                                            <img src="{{asset('storage/uploads/'.$product->shop->user->id.'/cache/'.$image)}}" alt="..." class="avatar-img rounded">
                                                                        </a>
                                                                    </li>
                                                                @endforeach
                                                            </ul>
                                                        </div>
                                                        <div class="mt-4 product-share">
                                                            <div class="">


                                                                    <h4><small>Product by: </small><a href="{{route('home.shop',$shop->id)}}">{{$shop->name}}</a></h4>

                                                                    <p class="demo">


                                                                        <a href="{{route('home.shop',$shop->id)}} ">
                                                                            <button class="mt-3 btn btn-danger">
                                                                                <span class="btn-label">
                                                                                    <i class="fas fa-shopping-bag"></i>
                                                                                </span>
                                                                                Visit Shop
                                                                            </button>
                                                                        </a>
                                                                        {{-- <button class="mt-3 btn btn-primary" data-toggle="modal" data-target="#addRowModal">
                                                                            <span class="btn-label">
                                                                                <i class="fas fa-location-arrow"></i>
                                                                            </span>
                                                                            locate
                                                                        </button> --}}
                                                                    </p>
                                                                        <!-- Modal -->
                                                                    <div class="modal fade" id="addRowModal" tabindex="-1" role="dialog" aria-hidden="true">
                                                                        <div class="modal-dialog" role="document">
                                                                            <div class="modal-content">
                                                                                <div class="modal-header no-bd">
                                                                                <h4>Adress: {{$shop->address}}</h4>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>

                                                            </div>


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

                                                        <span class="btn-label">
                                                            <small>tags: </small>
                                                            @foreach ($tags as $tag )
                                                                <a href="{{route('home.tag',$tag->id)}}"><small>#{{$tag->name}}</small></a>
                                                            @endforeach
                                                        </span>
                                                    </div>
                                                    <div class="col-12 col-sm-12 col-md-6 col-xl-6">
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
                                                                    $colors = [];
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
                                                <div class="row mt-4">
                                                <nav class="w-100">
                                                  <div class="nav nav-tabs" id="product-tab" role="tablist">
                                                    <a class="nav-item nav-link active" id="product-desc-tab" data-toggle="tab" href="#product-desc" role="tab" aria-controls="product-desc" aria-selected="true">Full Specs</a>
                                                    <a class="nav-item nav-link" id="product-comments-tab" data-toggle="tab" href="#product-comments" role="tab" aria-controls="product-comments" aria-selected="false">Comments</a>
                                                  </div>
                                                </nav>
                                                <div class="tab-content p-3" id="nav-tabContent">
                                                    <div class="tab-pane fade show active" id="product-desc" role="tabpanel" aria-labelledby="product-desc-tab">
                                                        {!! html_entity_decode($product->full_specs) !!}
                                                    </div>

                                                    <div class="tab-pane fade" id="product-comments" role="tabpanel" aria-labelledby="product-comments-tab">
                                                        <div class="card-list">
                                                            <h5>Comments</h5>

                                                            <form action="{{route('comment.store')}}" method="POST">
                                                                @csrf
                                                                <div class="form-group" id="b">
                                                                    <div class="input-icon">
                                                                        <input type="text" name="body" class="form-control" placeholder="Leave Comment..." data-rule="minlen:1" data-msg="Please enter a comment." required>
                                                                        <div class="validation"></div>
                                                                        <input type="hidden" name="product_id" value="{{$product->id}}" >
                                                                        <span class="input-icon-addon" >
                                                                            <button class= "btn btn-icon btn-round btn-icon btn-sm"  type="submit">
                                                                            <i class="icon-action-redo"></i>
                                                                            </button>
                                                                        </span>
                                                                    </div>
                                                                </div>
                                                            </form>

                                                            <livewire:load-more-comments :product="$product->id">

                                                            <div class=" ">
                                                                <a  id="load" class="btn btn-primary btn-rounded btn-xs " style="color: white">Read More</a>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    </div>
                                                    </div>


                                    </div>
                                            <!-- /.card-body -->
                        </div>
                                        <!-- /.card -->
                            <!-- Card With Icon States Background -->
                        <h3>Related Products</h3>
                        <div class="row">
                            @foreach ( $related as $related )
                                <div class="col-sm-3 col-md-2 col-6">
                                <div class="card  card-round">
                                    <div class="card-body ">

                                        <div class=" ">
                                            <a href="{{route('home.product',$related->id)}}">
                                            <div class="card-img">
                                                <div class="icon-big text-center icon-primary bubble-shadow-small">
                                                    @php
                                                        $cover  = $related->cover_img;
                                                        $cover = substr($cover, 1);
                                                        $cover = substr($cover, 1);
                                                        $cover = substr_replace($cover ,"",-1);
                                                        $cover = substr_replace($cover ,"",-1);
                                                    @endphp
                                                    <img src="{{asset('storage/uploads/'.$related->shop->user->id.'/'.$cover)}}" alt="..." class="avatar-img rounded">
                                                </div>
                                            </div>
                                            </a>
                                            <div class="ml-3 ml-sm-0">
                                                <div class="numbers">
                                                    <p class="card-category">{{$related->name}}</p>
                                                    <h4 class="card-title">${{$related->price}}</h4>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            @endforeach

                        </div>
                                </section>
                                <!-- /.content -->






                                </div>


                            </div>
                        </div>
                    </div>





                </section>


    </div>



</div>

    </x-slot>

</x-home>
