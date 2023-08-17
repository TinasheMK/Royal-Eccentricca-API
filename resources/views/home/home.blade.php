<x-home>
    <x-slot name="head">
        <link rel="stylesheet" href="{{asset('owlcarousel/owl.carousel.min.css')}}">
        <link rel="stylesheet" href="{{asset('owlcarousel/owl.theme.default.min.css')}}">
    </x-slot>

    <x-slot name="sidebar">
        @include('home.sidebar.sidebar')
    </x-slot>

    <x-slot name="content">
        <!--Top Slide!-->
                <div class="panel-header  custom-back">
                    <div class="page-inner py-5">
                        <div class="d-flex align-items-left align-items-md-center flex-column flex-md-row">
                            <div>
                                <h2 class="text-white pb-2 fw-bold">Home</h2>
                                <h5 class="text-white op-7 mb-2">Welcome to Kamusika. Enjoy your shopping.</h5>
                            </div>

                        </div>
                    </div>
                </div>
                <div class="page-inner mt--5">
                    @include('home.navigation')

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
                    <!--main slide-->
                    {{-- <section class="slideshow-container" style="max-height: fit-content">
                        <div  >
                            <div class="owl-carousel owl-theme" id="owl-carousel2">
                                <div class="item">
                                    <a href="https://zimbohost.co.zw" target="_blank">
                                        <img loading="lazy"  class="card-img-top" src="storage/ads/1.jpg" alt="">
                                    </a>
                                </div>
                                <div class="item">
                                    <a href="https://zimbosoft.co.zw" target="_blank">
                                        <img loading="lazy"  class="card-img-top" src="storage/ads/2.jpg" alt="">
                                    </a>
                                </div>
                            </div>
                        </div>

                    </section> --}}




                    <section>
                        <div class="row">
                            <div class="col-sm-6 col-md-3 col-6">
                                <div class="card card-stats card-round">
                                    <div class="card-body ">
                                        <div class="row align-items-center">
                                            <a href="{{route('categories')}}">
                                                <div class="col-icon">
                                                    <div class="icon-big text-center icon-primary bubble-shadow-small">
                                                        <i class="fas fa-layer-group"></i>
                                                    </div>
                                                </div>
                                                <div class="col col-stats ml-3 ml-sm-0">
                                                    <div class="numbers">
                                                        <p class="card-category">
                                                            Browse By Category
                                                        </p>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6 col-md-3 col-6">
                                <div class="card card-stats card-round">
                                    <div class="card-body">
                                        <div class="row align-items-center">
                                            <a href="{{route('home.location')}}">
                                                <div class="col-icon">
                                                    <div class="icon-big text-center icon-warning bubble-shadow-small">
                                                        <i class="fas fa-map-pin"></i>
                                                    </div>
                                                </div>
                                                <div class="col col-stats ml-3 ml-sm-0">
                                                    <div class="numbers">
                                                        <p class="card-category">Products In Your Area</p>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6 col-md-3 col-6">
                                <div class="card card-stats card-round">
                                    <div class="card-body">
                                        <div class="row align-items-center">
                                            <a href="{{route('shops')}}">
                                                <div class="col-icon">
                                                    <div class="icon-big text-center icon-success bubble-shadow-small">
                                                        <i class="fas fa-store"></i>
                                                    </div>
                                                </div>
                                                <div class="col col-stats ml-3 ml-sm-0">
                                                    <div class="numbers">
                                                        <p class="card-category">Browse Shops</p>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6 col-md-3 col-6">
                                <div class="card card-stats card-round">
                                    <div class="card-body">
                                        <div class="row align-items-center">
                                            <a href="{{route('subscriptions')}}">
                                                <div class="col-icon">
                                                    <div class="icon-big text-center icon-info bubble-shadow-small">
                                                        <i class="flaticon-user"></i>
                                                    </div>
                                                </div>
                                                <div class="col col-stats ml-3 ml-sm-0">
                                                    <div class="numbers">
                                                        <p class="card-category">Following</p>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>

                    <section>
                        <div class="electro-product-wrapper wrapper-padding  mt-4 pt-95 pb-45">
                            <div class=" container-fluid mb-4">
                                        <div class="section-title-4 text-center mb-4 mt-5">
                                            <h2>Hot Products</h2>
                                        </div>
                                        <div class=" card p-4 top-product-style">
                                            <!--Grid Products-->
                                            <div class="tab-content">
                                                <div class="tab-pane active show fade" id="electro1" role="tabpanel">
                                                    <div class="row">
                                                        @include( 'home.productcard' , ['allproducts' => $allproducts], ['allproducts1' => $allproducts])
                                                    </div>
                                                </div>
                                            </div>
                                            <!--end grid products-->
                                        </div>

                            </div>
                        </div>
                    </section>


                    <section>
                        <div class="electro-product-wrapper wrapper-padding  mt-4 pt-95 pb-45">
                            <div class="container-fluid">
                                @if(count($allcategories)>1)
                                <a href="{{route('home.category',$allcategories[0]->id)}}"><h2 class="text-center">{{$allcategories[0]->name}}</h2></a>
                                <div class="card pb-0 p-2 owl-carousel  owl-theme owl-twist">
                                    @php
                                        $cat0 = $allcategories[0]->products->shuffle()->take(6);
                                    @endphp
                                    @foreach ( $cat0 as $product )
                                        <div class="item" >
                                            <div class="card card-post card-round">
                                                @php
                                                    $cover  = $product->cover_img;
                                                    $cover = substr($cover, 1);
                                                    $cover = substr($cover, 1);
                                                    $cover = substr_replace($cover ,"",-1);
                                                    $cover = substr_replace($cover ,"",-1);
                                                @endphp
                                                <a href="{{route('home.product',$product->id)}}"><img loading="lazy"  src="{{asset('storage/uploads/'.$product->shop->user->id.'/'.$cover)}}"  alt="..." class="avatar-img rounded"></a>
                                            </div>
                                        </div>
                                    @endforeach
                                </div>
                                @else
                                <a href="#"><h2 class="text-center">No Products</h2></a>

                                @endif
                            </div>
                        </div>
                    </section>

                    @if(count($allcategories)>2)
                    <section>
                        <div class="electro-product-wrapper wrapper-padding  mt-4 pt-95 pb-45">
                            <div class="container-fluid">
                                <a href="{{route('home.category',$allcategories[1]->id)}}"><h2 class="text-center">{{$allcategories[1]->name}}</h2></a>
                                <div class="card pb-0 p-2 owl-carousel  owl-theme owl-twist">
                                    @php
                                        $cat1 = $allcategories[1]->products->shuffle()->take(6);
                                    @endphp
                                    @foreach ( $cat1 as $product )
                                        <div class="item" >
                                            <div class="card card-post card-round">
                                                @php
                                                    $cover  = $product->cover_img;
                                                    $cover = substr($cover, 1);
                                                    $cover = substr($cover, 1);
                                                    $cover = substr_replace($cover ,"",-1);
                                                    $cover = substr_replace($cover ,"",-1);
                                                @endphp
                                                <a href="{{route('home.product',$product->id)}}"><img loading="lazy"  src="{{asset('storage/uploads/'.$product->shop->user->id.'/'.$cover)}}"  alt="..." class="avatar-img rounded"></a>
                                            </div>
                                        </div>
                                    @endforeach
                                </div>
                            </div>
                        </div>
                    </section>
                    @endif


                    <section>
                        <div class="electro-product-wrapper wrapper-padding  mt-4 pt-95 pb-45">
                            <div class=" container-fluid mb-4">
                                        <div class="section-title-4 text-center mb-4 mt-5">
                                            <h2>Featured</h2>
                                        </div>
                                        <div class=" card p-4 top-product-style">
                                            <!--Grid Products-->
                                            <div class="tab-content">
                                                <div class="tab-pane active show fade" id="electro1" role="tabpanel">
                                                    <div class="row">
                                                        @include( 'home.productcard' , ['allproducts' => $featprods], ['allproducts1' => $featprods])
                                                    </div>
                                                </div>
                                            </div>
                                            <!--end grid products-->
                                        </div>

                            </div>
                        </div>
                    </section>

                    @if(count($allcategories)>3)
                    <section>
                        <div class="electro-product-wrapper wrapper-padding  mt-4 pt-95 pb-45">
                            <div class="container-fluid">
                                <a href="{{route('home.category',$allcategories[2]->id)}}"><h2 class="text-center">{{$allcategories[2]->name}}</h2></a>
                                <div class="card pb-0 p-2 owl-carousel  owl-theme owl-twist ">
                                    @php
                                        $cat2 = $allcategories[2]->products->shuffle()->take(6);
                                    @endphp
                                    @foreach ( $cat2 as $product )
                                        <div class="item" >
                                            <div class="card card-post card-round">
                                                @php
                                                    $cover  = $product->cover_img;
                                                    $cover = substr($cover, 1);
                                                    $cover = substr($cover, 1);
                                                    $cover = substr_replace($cover ,"",-1);
                                                    $cover = substr_replace($cover ,"",-1);
                                                @endphp
                                                <a href="{{route('home.product',$product->id)}}"><img loading="lazy"  src="{{asset('storage/uploads/'.$product->shop->user->id.'/'.$cover)}}"  alt="..." class="avatar-img rounded"></a>
                                            </div>
                                        </div>
                                    @endforeach
                                </div>
                            </div>
                        </div>
                    </section>
                    @endif

                    <section>
                        <h2 class="text-center">Recommended For You</h2>
                        <livewire:recommend-home />

                        <div class="row">
                            <div class="col-md-2 col-sm-2 col-lg-2 col-6 card ml-auto mr-auto" id="load">
                                <button class="btn btn-link"  >
                                    <span class="btn-label">
                                        <i class="fas fa-redo-alt "></i>
                                    </span>
                                    <span>More</span>
                                </button>
                            </div>
                        </div>
                    </section>



                    <script>
                        var slideIndex = 1;
                        showSlides(slideIndex);

                        // Next/previous controls
                        function plusSlides(n) {
                        showSlides(slideIndex += n);
                        }

                        // Thumbnail image controls
                        function currentSlide(n) {
                        showSlides(slideIndex = n);
                        }

                        function showSlides(n) {
                        var i;
                        var slides = document.getElementsByClassName("mySlides");
                        var dots = document.getElementsByClassName("dot");
                        if (n > slides.length) {slideIndex = 1}
                        if (n < 1) {slideIndex = slides.length}
                        for (i = 0; i < slides.length; i++) {
                            slides[i].style.display = "none";
                        }
                        for (i = 0; i < dots.length; i++) {
                            dots[i].className = dots[i].className.replace(" active1", "");
                        }
                        slides[slideIndex-1].style.display = "block";
                        dots[slideIndex-1].className += " active1";
                        }
                    </script>

                    <script src="{{asset('owlcarousel/jquery.min.js')}}"></script>
                    <script src="{{asset('owlcarousel/owl.carousel.min.js')}}"></script>

                    <script>
                        $('.owl-twist').owlCarousel({
                            loop:false,
                            margin:10,
                            nav:false,
                            // lazyload:true,
                            // autoplay:true,
                            // autoplayTimeout:2500,
                            // autoplayHoverPause:true
                            responsive:{
                                0:{
                                    items:2
                                },
                                600:{
                                    items:3
                                },
                                1000:{
                                    items:5
                                }
                            }
                            })
                    </script>

                    {{-- ads slider --}}
                    {{-- <script type="text/javascript">
                        var owl = $('#owl-carousel2');
                        owl.owlCarousel({
                            items:1,
                            loop:false,
                            margin:10,
                            nav:false,
                            lazyload:true,
                            // autoplay:true,
                            // autoplayTimeout:4000,
                            // autoplayHoverPause:false
                        });
                        $('.play').on('click',function(){
                            owl.trigger('play.owl.autoplay',[1000])
                        })
                        $('.stop').on('click',function(){
                            owl.trigger('stop.owl.autoplay')
                        })

                    </script> --}}

                </div>
    </x-slot>
</x-home>
