<x-shop>
    <x-slot name="content">
        <div class="page-inner">
            <div class="page-header">
                <h4 class="page-title">Dashboard</h4>
                <ul class="breadcrumbs">
                    <li class="nav-home">
                        <a href="{{route('shop.shop')}}">
                            <i class="flaticon-home"></i>
                        </a>
                    </li>
                    <li class="separator">
                        <i class="flaticon-right-arrow"></i>
                    </li>

                </ul>
            </div>
            <div class="row">
                @if(!$shop->shop_image)
                <div class="col-md-4">
                    <div class="card card-primary ">
                        <div class="card-body">
                            <div class="card-body">
                                <div class="card-title fw-mediumbold"><i class="fas fa-air-freshener"></i> Add a shop image!</div>
                                <div class="card-list">

                                        <div class="item-list">


                                                <div class="status"><a class="text-white" href="{{route('shop.settings')}}">Add Images</a></div>



                                        </div>



                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                @endif

                <div class="col-md-4">
                    <div class="card card-info ">
                        <div class="card-body">
                            <div class="card-body">
                                <div class="card-title fw-mediumbold"><i class="  fas fa-handshake"></i>  Shareable Link</div>
                                <div class="card-list">

                                        <div class="item-list">


                                                <div class="status">kamusika.com/shop/{{$shop->id ?? ''}}</div>



                                        </div>



                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card  " style="background-color: #ff9dae">
                        <div class="card-body">
                            <div class="card-body">
                                <div class="card-title text-white fw-mediumbold"><i class="fas fa-basketball-ball"></i> Add products to your shop.</div>
                                <div class="card-list">

                                        <div class="item-list">


                                            <div class="status"><a class="text-white" href="{{route('shop.products')}}">Add Products</a></div>



                                        </div>



                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-12">
                    <div class="card">


                            <div class="table-responsive">

                                @if (!count($orders) == 0)

                                <table id="add-row" class="display table table-striped table-hover" >
                                    <thead>
                                        <tr>
                                            <th>Order Id</th>
                                            <th>Order</th>
                                            <th>Shipping Address</th>
                                            <th>Number of items</th>
                                            <th style="width: 10%">Amount</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>Order Id</th>
                                            <th>Name</th>
                                            <th>Shipping Address</th>
                                            <th>Number of items</h>
                                            <th>Amount</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>

                                                @foreach ( $orders as $order)
                                            @if ($order->status==2)
                                                <tr>
                                                    <th>{{$order->order_number}}</th>
                                                    <td>{{$order->shipping_fullname}}</td>
                                                    <td>{{$order->shipping_adress}}</td>
                                                    <td>{{$order->item_count}}</td>
                                                    <td>{{$order->grand_total}}</td>
                                                    <td>
                                                        <div class="form-button-action">
                                                            <a href="{{route('order.details',$order->id)}}"><button type="button" class="btn btn-link btn-default" data-original-title="More Details">
                                                                <i class="fas fa-chevron-right"></i>
                                                            </button></a>
                                                        </div>
                                                    </td>
                                                </tr>
                                            @endif

                                            @endforeach

                                    </tbody>
                                </table>
                                @else
                                    <h3 class="modal-title p-4">
                                        <span class="fw-mediumbold">
                                        You do not have any orders yet.</span>
                                    </h3>
                                @endif
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </x-slot>
</x-shop>
