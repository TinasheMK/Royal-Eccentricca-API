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
								<h2 class="text-white pb-2 fw-bold">Wishlist</h2>
								<h5 class="text-white op-7 mb-2">Your desires.</h5>
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

                    <section>
                        <div class="electro-product-wrapper wrapper-padding  mt-3">
                            <div class=" container-fluid mb-4">
                                <h2>Wish List</h2>
                                        <div class=" card p-4 top-product-style">
                                            <!--Grid Products-->
                                            <div class="tab-content">
                                                <div class="tab-pane active show fade" id="electro1" role="tabpanel">
                                                    <div class="row">
                                                        @php
                                                            $wish=1;
                                                        @endphp
                                                        @include( 'home.productcard' , ['allproducts' => $allproducts,'wish' => $wish], ['allproducts1' => $allproducts])
                                                    </div>
                                                </div>
                                            </div>
                                            <!--end grid products-->
                                        </div>

                            </div>
                        </div>
                    </section>






				</div>
    </x-slot>
</x-home>
