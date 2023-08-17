<x-home>

    <x-slot name="head">

    </x-slot>

    <x-slot name="sidebar">
        @include('home.sidebar.sidebar')
    </x-slot>

    <x-slot name="content">
        <div class="content">


            <!--Top Slide!-->
            @php
                $cover  = $shop->cover_image;
                $dp  = $shop->shop_image;
                $cover = substr($cover, 1);
                $cover = substr($cover, 1);
                $cover = substr_replace($cover ,"",-1);
                $cover = substr_replace($cover ,"",-1);
                $dp = substr($dp, 1);
                $dp = substr($dp, 1);
                $dp = substr_replace($dp ,"",-1);
                $dp = substr_replace($dp ,"",-1);
            @endphp

            <div style="background-image: url('{{asset('assets/img/756.jpg')}} ');     background-repeat: no-repeat; background-size: cover;">
                <div class="panel-header " style="background-image: url('{{asset('storage/uploads/'.$shop->user_id.'/'.$cover)}}');background-size: cover;    background-position: center;">
                    <div class="page-inner py-5" style="    background-color: #0000004d;">
                        <div class="d-flex align-items-left align-items-md-center flex-column flex-md-row" style="margin-bottom: 100px; margin-top: 100px;">
                            <div>
                                <div class="avatar avatar-xl mr-4">
                                    <img src="{{asset('storage/uploads/'.$shop->user_id.'/cache/'.$dp)}}"  alt="..." class="avatar-img rounded">
                                </div>
                            </div>
                            <div>
                                <h2 class="text-white pb-2 fw-bold">{{$shop->name}}</h2>
                                <h5 class="text-white op-7 mb-2">kamusika.com/shop/{{$shop->id}}</h5>
                                <h5 class="text-white op-7 mb-2">{{$shop->description}}</h5>
                            </div>
                            <div class="ml-md-auto py-2 py-md-0">
                                <a href="{{route('message',$shop->user_id)}}" class="btn btn-white btn-border btn-round mr-2">Message</a>
                                @if (!count($subscribed) == 0)
                                    <a href="{{route('unsubscribe',$shop->id)}}" class="btn btn-danger btn-round">Unsubscribe</a>
                                @else
                                    <a href="{{route('subscribe',$shop->id)}}" class="btn btn-warning btn-round">Subscribe</a>
                                @endif
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="page-inner mt--5">
                @include('home.navigation')
            </div>

                <!--Cateories and main slide-->

                <section>




                    <div class="">
                        <div class="categori-menu-slider-wrapper clearfix">

                            <div class="">


                                <div class="" >


                                    <!-- Content Wrapper. Contains page content -->



                                <!-- Main content -->
                                <section class="content">
                                    @if ($message = Session::get('success'))
                                    <div class="alert alert-success">
                                        <strong>{{ $message }}</strong>
                                    </div>
                                    @endif

                                    @if (count($errors) > 0)
                                        <div class="alert alert-danger">
                                            <ul style="list-style: none">
                                                @foreach ($errors->all() as $error)
                                                <li>{{ $error }}</li>
                                                @endforeach
                                            </ul>
                                        </div>
                                    @endif
                                      <!-- Default box -->
                                      <div class="card card-solid">
                                        <div class="card-body">

                                            <nav class="w-100" style="margin-bottom: 5px">
                                                <div class="nav nav-tabs justify-content-center" id="product-tab" role="tablist">
                                                    <a class="nav-item nav-link " id="product-rating-tab" data-toggle="tab" href="#product-rating" role="tab" aria-controls="product-rating" aria-selected="false">Page</a>
                                                    <a class="nav-item nav-link " id="product-desc-tab" data-toggle="tab" href="#product-desc" role="tab" aria-controls="product-desc" aria-selected="true">Featured</a>
                                                    <a class="nav-item nav-link active " id="product-comments-tab" data-toggle="tab" href="#product-comments" role="tab" aria-controls="product-comments" aria-selected="false">All Products</a>
                                                </div>
                                            </nav>
                                                <div class="tab-content " id="nav-tabContent">

                                                    {{-- Shop Home Page --}}
                                                    <div class="tab-pane fade " id="product-rating" role="tabpanel" aria-labelledby="product-rating-tab">
                                                        <div class="">

                                                            @foreach ($allposts as $post)

                                                                <div class="col-md-10  col-xl-6 ml-auto mr-auto" style="padding:0 " id="{{$post->id}}">
                                                                    <div class="card card-post card-round">
                                                                        @php
                                                                        $cover  = $post->media_link;
                                                                        $cover = substr($cover, 1);
                                                                        $cover = substr($cover, 1);
                                                                        $cover = substr_replace($cover ,"",-1);
                                                                        $cover = substr_replace($cover ,"",-1);
                                                                        // dd($post);
                                                                        @endphp
                                                                        <img src="{{asset('storage/uploads/'.$post->shop->user->id.'/'.$cover)}}" alt="..." class="card-img-top">

                                                                        <div class="card-body" >
                                                                            <div class="d-flex">
                                                                                <div class="avatar">
                                                                                    @php
                                                                                    $cover  = $post->shop->shop_image;
                                                                                    $cover = substr($cover, 1);
                                                                                    $cover = substr($cover, 1);
                                                                                    $cover = substr_replace($cover ,"",-1);
                                                                                    $cover = substr_replace($cover ,"",-1);
                                                                                    // dd($post);
                                                                                    @endphp
                                                                                    <img src="{{asset('storage/uploads/'.$post->shop->user->id.'/cache/'.$cover)}}" alt="..." class="avatar-img rounded-circle">
                                                                                </div>
                                                                                <div class="info-post ml-2">
                                                                                    <p class="username">{{$post->shop->name}}</p>
                                                                                    <p class="date text-muted"><small>
                                                                                        @php
                                                                                        $newtime = strtotime($post->created_at);
                                                                                        $data = date('M d, Y',$newtime);
                                                                                    @endphp
                                                                                    {{$data}} </small></p>
                                                                                </div>
                                                                            </div>
                                                                            <div class="separator-solid"></div>
                                                                            <h3 class="card-title">
                                                                                <a href="#">
                                                                                    {{$post->title}}
                                                                                </a>
                                                                            </h3>
                                                                            <p class="card-text">{{$post->caption}}</p>

                                                                            <div class="card-list">
                                                                                <h5>Comments</h5>
                                                                                <form action="{{route('comment.store')}}" method="POST">
                                                                                    @csrf
                                                                                    <div class="form-group" id="b">
                                                                                        <div class="input-icon">
                                                                                            <input type="text" name="body" class="form-control" placeholder="Leave Comment..." required>
                                                                                            <input type="hidden" name="post_id" value="{{$post->id}}">
                                                                                            <span class="input-icon-addon" >
                                                                                                <button class= "btn btn-icon btn-round btn-link btn-sm"  type="submit">
                                                                                                    <i class="fa fa-chevron-right"></i>
                                                                                                </button>
                                                                                            </span>
                                                                                        </div>
                                                                                    </div>
                                                                                </form>


                                                                                    <livewire:load-more-comments :post="$post->id">


                                                                                <div class=" ">
                                                                                    <a  href="{{route('home.post',$post->id)}}" class="btn btn-primary btn-rounded btn-xs " style="color: white">Read More</a>
                                                                                </div>

                                                                            </div>

                                                                        </div>
                                                                </div>
                                                                </div>
                                                            @endforeach

                                                        </div>
                                                    </div>

                                                    {{-- Featured --}}
                                                    <div class="tab-pane fade  " id="product-desc" role="tabpanel" aria-labelledby="product-desc-tab">

                                                        <div class="container-fluid">
                                                            <div class="row mb-2">
                                                            <div class="col-sm-6">
                                                                <h1>Featured Products</h1>
                                                            </div>

                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                        @foreach ($allproducts1 as $product )

                                                            <div class="col-md-10  col-xl-6 justify-content-center">
                                                                <div class="col-12 col-sm-12 col-md-12 col-xl-6 ml-auto mr-auto ">
                                                                        <a href="{{route('home.product',$product->id)}}">
                                                                        <h3 class="d-inline-block d-sm-none">{{$product->name}}</h3>
                                                                        <div class="col-12">
                                                                            @php
                                                                            $cover  = $product->cover_img;
                                                                            $cover = substr($cover, 1);
                                                                            $cover = substr($cover, 1);
                                                                            $cover = substr_replace($cover ,"",-1);
                                                                            $cover = substr_replace($cover ,"",-1);
                                                                            @endphp
                                                                            <img src="{{asset('storage/uploads/'.$product->shop->user->id.'/'.$cover)}}" alt="..." class="avatar-img rounded">
                                                                        </div>
                                                                        </a>

                                                                </div>
                                                                <div class="col-12 col-sm-12 col-md-12 col-xl-6 ml-auto mr-auto ">
                                                                        <a href="{{route('home.product',$product->id)}}">
                                                                            <h3 class="my-3">{{$product->name}}</h3>
                                                                        </a>
                                                                        <p> {{$product->description}}</p>

                                                                        <hr>


                                                                    <div class="bg-gray py-2 px-3 mt-4">
                                                                        <h2 class="mb-0">
                                                                        ${{$product->price}}
                                                                        </h2>
                                                                        {{-- <h4 class="mt-0">
                                                                        <small>Ex Tax: $80.00 </small>
                                                                        </h4> --}}
                                                                    </div>

                                                                    <div class="p-3">
                                                                        <a href="{{route('home.product',$product->id)}}">
                                                                            <div class="btn btn-primary mt-2 btn-lg btn-flat">
                                                                                <i class="fas fa-arrow-circle-right fa-lg mr-2"></i>
                                                                                View Product
                                                                            </div>
                                                                        </a>

                                                                        <a href="{{route('wishlist.add',$product->id)}}">
                                                                            <div class="btn btn-default mt-2 btn-lg btn-flat">
                                                                            <i class="fas fa-heart fa-lg mr-2"></i>
                                                                            Add to Wishlist
                                                                            </div>
                                                                        </a>
                                                                    </div>


                                                                </div>
                                                            </div>

                                                        @endforeach

                                                        </div>
                                                    </div>

                                                    {{-- Products --}}
                                                    <div class="tab-pane fade show active " id="product-comments" role="tabpanel" aria-labelledby="product-comments-tab">
                                                        <div class="electro-product-wrapper wrapper-padding pt-95 pb-45">
                                                            <div class="container-fluid">
                                                                <div class="section-title-4 text-center mb-40 mt-5" style="margin-bottom: 100px">
                                                                    <h1>All Products</h1>
                                                                </div>

                                                                @foreach($cats as $cat)
                                                                    <div class="top-product-style">
                                                                        <h1>{{$cat}}</h1>
                                                                        <!--Grid Products-->
                                                                        <div class="tab-content">
                                                                            <div class="tab-pane active show fade" id="electro1" role="tabpanel">
                                                                                <div class="row">

                                                                                    @include( 'home.productcard1' , ['allproducts' => $allproducts, 'cat'=>$cat], ['allproducts1' => $allproducts])

                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <!--end grid products-->

                                                                    </div>
                                                                @endforeach
                                                            </div>
                                                        </div>
                                                    </div>

                                                </div>
                                               </div>
                                        </div>
                                        <!-- /.card-body -->
                                      </div>
                                      <!-- /.card -->

                                </section>
                                <!-- /.content -->






                                </div>


                            </div>

    </x-slot>

</x-home>
