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
								<h1 class="text-white pb-2 fw-bold">{{$location}}</h1>
								<h5 class="text-white op-7 mb-2">Welcome to Kamusika, Enjoy your shopping !</h5>
							</div>

						</div>
					</div>
				</div>
				<div class="page-inner mt--5">
                    @include('home.navigation')

					<!--main slide-->

		            <section class="slideshow-container" style="max-height: fit-content">
                        <div  >
                            <div class="owl-carousel owl-theme" id="owl-carousel2">
                                <div class="item">
                                    <a href="https://zimbohost.co.zw" target="_blank">
                                        <img class="card-img-top" src="storage/ads/1.jpg" alt="">
                                    </a>
                                </div>
                                <div class="item">  
                                    <a href="https://zimbosoft.co.zw" target="_blank">
                                        <img class="card-img-top" src="storage/ads/2.jpg" alt="">
                                    </a>
                                </div>
                            </div>
                        </div>

                    </section>

                

                    <section>
                        <div class="electro-product-wrapper wrapper-padding  mt-4 pt-95 pb-45">
                            <div class=" container-fluid mb-4">
                                <h1>{{$location}}</h1>
                                        <div class="section-title-4 text-center mb-4 mt-5">
                                            <h2>Top Products in {{$location}}</h2>
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
                                <h3>{{$allcategories[0]->name}}</h3>
                                <div class="card p-4 owl-carousel owl-theme owl-twist">
                                    @foreach ( $allcategories[0]->products as $product )
                                        <div class="item" >
                                            <div class="card card-post card-round">
                                                @php
                                                    $cover  = $product->cover_img;
                                                    $cover = substr($cover, 1);
                                                    $cover = substr($cover, 1);
                                                    $cover = substr_replace($cover ,"",-1);
                                                    $cover = substr_replace($cover ,"",-1);
                                                @endphp
                                                <a href="{{route('home.product',$product->id)}}"><img src="{{asset('storage/uploads/'.$product->shop->user->id.'/'.$cover)}}" alt="..." class="avatar-img rounded"></a>
                                            </div>
                                        </div>
                                    @endforeach
                                </div>
                            </div>
                        </div>
                    </section>


                    <section>
                        <div class="electro-product-wrapper wrapper-padding  mt-4 pt-95 pb-45">
                            <div class="container-fluid">
                                <h3>{{$allcategories[1]->name}}</h3>
                                <div class="card p-4 owl-carousel owl-theme owl-twist">
                                    @foreach ( $allcategories[1]->products as $product )
                                        <div class="item" >
                                            <div class="card card-post card-round">
                                                @php
                                                    $cover  = $product->cover_img;
                                                    $cover = substr($cover, 1);
                                                    $cover = substr($cover, 1);
                                                    $cover = substr_replace($cover ,"",-1);
                                                    $cover = substr_replace($cover ,"",-1);
                                                @endphp
                                                <a href="{{route('home.product',$product->id)}}"><img src="{{asset('storage/uploads/'.$product->shop->user->id.'/'.$cover)}}" alt="..." class="avatar-img rounded"></a>
                                            </div>
                                        </div>
                                    @endforeach
                                </div>
                            </div>
                        </div>
                    </section>

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


                    <section>
                        <div class="electro-product-wrapper wrapper-padding  mt-4 pt-95 pb-45">
                            <div class="container-fluid">
                                <h3>{{$allcategories[2]->name}}</h3>
                                <div class="card p-4 owl-carousel owl-theme owl-twist ">
                                    @foreach ( $allcategories[2]->products as $product )
                                        <div class="item" >
                                            <div class="card card-post card-round">
                                                @php
                                                    $cover  = $product->cover_img;
                                                    $cover = substr($cover, 1);
                                                    $cover = substr($cover, 1);
                                                    $cover = substr_replace($cover ,"",-1);
                                                    $cover = substr_replace($cover ,"",-1);
                                                @endphp
                                                <a href="{{route('home.product',$product->id)}}"><img src="{{asset('storage/uploads/'.$product->shop->user->id.'/'.$cover)}}" alt="..." class="avatar-img rounded"></a>
                                            </div>
                                        </div>
                                    @endforeach
                                </div>
                            </div>
                        </div>
                    </section>


                    <!-- modal -->
                    <div class="modal fade" id="exampleCompare" tabindex="-1" role="dialog" aria-hidden="true">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span class="pe-7s-close" aria-hidden="true"></span>
                        </button>
                        <div class="modal-dialog modal-compare-width" role="document">
                            <div class="modal-content">
                                <div class="modal-body">
                                    <form action="#">
                                        <div class="table-content compare-style table-responsive">
                                            <table>
                                                <thead>
                                                    <tr>
                                                        <th></th>
                                                        <th>
                                                            <a href="#">Remove <span>x</span></a>
                                                            <img src="assets/img/cart/4.jpg" alt="">
                                                            <p>Blush Sequin Top </p>
                                                            <span>$75.99</span>
                                                            <a class="compare-btn" href="#">Add to cart</a>
                                                        </th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td class="compare-title">
                                                            <h4>Description </h4></td>
                                                        <td class="compare-dec compare-common">
                                                            <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has beenin the stand ard dummy text ever since the 1500s, when an unknown printer took a galley</p>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="compare-title">
                                                            <h4>Sku </h4></td>
                                                        <td class="product-none compare-common">
                                                            <p>-</p>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="compare-title">
                                                            <h4>Availability  </h4></td>
                                                        <td class="compare-stock compare-common">
                                                            <p>In stock</p>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="compare-title">
                                                            <h4>Weight   </h4></td>
                                                        <td class="compare-none compare-common">
                                                            <p>-</p>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="compare-title">
                                                            <h4>Dimensions   </h4></td>
                                                        <td class="compare-stock compare-common">
                                                            <p>N/A</p>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="compare-title">
                                                            <h4>brand   </h4></td>
                                                        <td class="compare-brand compare-common">
                                                            <p>HasTech</p>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="compare-title">
                                                            <h4>color   </h4></td>
                                                        <td class="compare-color compare-common">
                                                            <p>Grey, Light Yellow, Green, Blue, Purple, Black </p>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="compare-title">
                                                            <h4>size    </h4></td>
                                                        <td class="compare-size compare-common">
                                                            <p>XS, S, M, L, XL, XXL </p>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="compare-title"></td>
                                                        <td class="compare-price compare-common">
                                                            <p>$75.99 </p>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>

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
                            loop:true,
                            margin:10,
                            nav:false,

                            responsive:{
                                0:{
                                    items:1
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
                    <script type="text/javascript">
                        var owl = $('#owl-carousel2');
                        owl.owlCarousel({
                            items:1,
                            loop:true,
                            margin:10,
                            nav:false,
                            autoplay:true,
                            autoplayTimeout:4000,
                            autoplayHoverPause:false
                        });
                        $('.play').on('click',function(){
                            owl.trigger('play.owl.autoplay',[1000])
                        })
                        $('.stop').on('click',function(){
                            owl.trigger('stop.owl.autoplay')
                        })

                    </script>

                </div>
    </x-slot>
</x-home>

