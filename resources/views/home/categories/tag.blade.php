<x-home>
    <x-slot name="sidebar">
        @include('home.sidebar.sidebar')
    </x-slot>

    <x-slot name="content">
        <div class="content">


            <!--Top Slide!-->
            <div class="panel-header bg-primary-gradient">
                <div class="page-inner py-5">
                    <div class="d-flex align-items-left align-items-md-center flex-column flex-md-row">
                        <div>
                            <h2 class="text-white pb-2 fw-bold">Kamusika</h2>
                            <h5 class="text-white op-7 mb-2">Hash Tags</h5>
                        </div>
                    </div>
                </div>
            </div>
            <div class="page-inner mt--5">
                @include('home.navigation')

                <!--Cateories and main slide-->
                <section>
                    <div class="pl-200 pr-200 overflow clearfix">
                        <div class="categori-menu-slider-wrapper clearfix">
                            <div class="categories-menu">
                                <div class="category-heading">
                                    <h3> All Departments <i class="pe-7s-angle-down"></i></h3>
                                </div>
                                <div class="category-menu-list">
                                    <ul>
                                        @foreach ($allcategories as $category )
                                            <li>
                                                <a href="#"><img alt="" src="assets/img/icon-img/5.png">{{$category->name}} <i class="pe-7s-angle-right"></i></a>

                                                @php
                                                    $children = DB::select('select * from categories where parent_id = :id', ['id' => $category->id]);
                                                @endphp

                                                {{-- @if ($children->isEmpty()) --}}
                                                    <div class="category-menu-dropdown">
                                                        <div class="category-dropdown-style category-common4 mb-40">


                                                                @foreach ($children as $child)
                                                                <a href="{{route('home.category', $child->id)}}">
                                                                    <h4 class="">{{$child->name}}</h4>

                                                                @endforeach




                                                        </div>
                                                        <div class="mega-banner-img">
                                                            <a href="single-product.html">
                                                                <img src="assets/img/banner/18.jpg" alt="">
                                                            </a>
                                                        </div>
                                                    </div>
                                                {{-- @endif --}}

                                            </li>
                                        @endforeach


                                    </ul>
                                </div>
                            </div>


                            <div class="menu-slider-wrapper">
                                <div class="electro-product-wrapper wrapper-padding pt-95 pb-45">
                                    <div class="container-fluid">
                                        <div class="section-title-4 text-center mb-40 mb-80 mt-5">
                                            @foreach ($category1 as $category2)
                                                <h2>{{$category2->name}}</h2>
                                            @endforeach

                                        </div>
                                        <div class="top-product-style">
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
                <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-hidden="true">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span class="pe-7s-close" aria-hidden="true"></span>
                    </button>
                    <div class="modal-dialog modal-quickview-width" role="document">
                        <div class="modal-content">
                            <div class="modal-body">
                                <div class="qwick-view-left">
                                    <div class="quick-view-learg-img">
                                        <div class="quick-view-tab-content tab-content">
                                            <div class="tab-pane active show fade" id="modal1" role="tabpanel">
                                                <img src="assets/img/quick-view/l1.jpg" alt="">
                                            </div>
                                            <div class="tab-pane fade" id="modal2" role="tabpanel">
                                                <img src="assets/img/quick-view/l2.jpg" alt="">
                                            </div>
                                            <div class="tab-pane fade" id="modal3" role="tabpanel">
                                                <img src="assets/img/quick-view/l3.jpg" alt="">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="quick-view-list nav" role="tablist">
                                        <a class="active" href="#modal1" data-toggle="tab" role="tab">
                                            <img src="assets/img/quick-view/s1.jpg" alt="">
                                        </a>
                                        <a href="#modal2" data-toggle="tab" role="tab">
                                            <img src="assets/img/quick-view/s2.jpg" alt="">
                                        </a>
                                        <a href="#modal3" data-toggle="tab" role="tab">
                                            <img src="assets/img/quick-view/s3.jpg" alt="">
                                        </a>
                                    </div>
                                </div>
                                <div class="qwick-view-right">
                                    <div class="qwick-view-content">
                                        <h3>Handcrafted Supper Mug</h3>
                                        <div class="price">
                                            <span class="new">$90.00</span>
                                            <span class="old">$120.00  </span>
                                        </div>
                                        <div class="rating-number">
                                            <div class="quick-view-rating">
                                                <i class="pe-7s-star"></i>
                                                <i class="pe-7s-star"></i>
                                                <i class="pe-7s-star"></i>
                                                <i class="pe-7s-star"></i>
                                                <i class="pe-7s-star"></i>
                                            </div>
                                            <div class="quick-view-number">
                                                <span>2 Ratting (S)</span>
                                            </div>
                                        </div>
                                        <p>Lorem ipsum dolor sit amet, consectetur adip elit, sed do tempor incididun ut labore et dolore magna aliqua. Ut enim ad mi , quis nostrud veniam exercitation .</p>
                                        <div class="quick-view-select">
                                            <div class="select-option-part">
                                                <label>Size*</label>
                                                <select class="select">
                                                    <option value="">- Please Select -</option>
                                                    <option value="">900</option>
                                                    <option value="">700</option>
                                                </select>
                                            </div>
                                            <div class="select-option-part">
                                                <label>Color*</label>
                                                <select class="select">
                                                    <option value="">- Please Select -</option>
                                                    <option value="">orange</option>
                                                    <option value="">pink</option>
                                                    <option value="">yellow</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="quickview-plus-minus">
                                            <div class="cart-plus-minus">
                                                <input type="text" value="02" name="qtybutton" class="cart-plus-minus-box">
                                            </div>
                                            <div class="quickview-btn-cart">
                                                <a class="btn-hover-black" href="#">add to cart</a>
                                            </div>
                                            <div class="quickview-btn-wishlist">
                                                <a class="btn-hover" href="#"><i class="pe-7s-like"></i></a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>



            </div>
        </div>

    </x-slot>

</x-home>
