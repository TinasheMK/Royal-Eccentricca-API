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
				<div class="panel-header custom-back">
					<div class="page-inner py-5">
						<div class="d-flex align-items-left align-items-md-center flex-column flex-md-row">
							<div>
								<h2 class="text-white pb-2 fw-bold">Explore</h2>
								<h5 class="text-white op-7 mb-2">Discover more!</h5>
							</div>
							{{-- <div class="ml-md-auto py-2 py-md-0">
								<a href="#" class="btn btn-white btn-border btn-round mr-2">Manage</a>
								<a href="#" class="btn btn-secondary btn-round">Add Customer</a>
							</div> --}}
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
                    <section>
                        <div class="electro-product-wrapper wrapper-padding   ">
                            <div class="container-fluid">

                                <div class="card p-4 owl-carousel owl-theme " style="margin-bottom: 0">

                                    @foreach ($allcategories as $category)
	                                    @if($category->menu)
	                                        <div class="item" >
	                                            <div class=" card-post card-round">
	                                                <a href="{{route('home.category',$category->id)}}">
	                                                <div class="card card-dark bg-primary-gradient">
	                                                    <div class="card-body bubble-shadow">
	                                                        <h3 style="text-align:center; ">{{$category->name}}</h3>
	                                                        {{-- <h5 class="op-8">{{$category->description}}</h5> --}}
	                                                    </div>
	                                                </div>
	                                                </a>
	                                            </div>
	                                        </div>
	                                    @endif
                                    @endforeach

                                </div>

                            </div>
                        </div>
                    </section>

                    <section>
                        <div class="electro-product-wrapper wrapper-padding  mt-3">
                            <div class=" container-fluid mb-4">

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



                    <livewire:posts />

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





					<!-- modal -->
					{{-- <div class="modal fade" id="exampleCompare" tabindex="-1" role="dialog" aria-hidden="true">
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
					</div> --}}

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
                        $('.owl-carousel').owlCarousel({
                            loop:false,
                            margin:10,
                            nav:false,
                            dots:false,
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

				</div>
    </x-slot>
</x-home>
