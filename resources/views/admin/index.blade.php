<x-admin>
    <x-slot name="content">
        <div class="page-inner">
            <div class="page-header">
                <h4 class="text-white page-title">Dashboard</h4>
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
                                                <tr class="text-white">
                                                    <th>{{$order->order_number}}</th>
                                                    <td>{{$order->shipping_fullname}}</td>
                                                    <td>{{$order->shipping_adress}}</td>
                                                    <td>{{$order->item_count}}</td>
                                                    <td>{{$order->grand_total}}</td>
                                                    <td>
                                                        <div class="form-button-action">
                                                            <button type="button"  data-toggle="modal" data-target="#delete{{$order->id}}" class="btn btn-link btn-success btn-lg">
                                                                <i class="fas fa-check " id=""></i>
                                                            </button>
                                                            <a href="{{route('admin.order.details',$order->id)}}"><button type="button" class="btn btn-link btn-warning" data-original-title="More Details">
                                                                <i class="fas fa-chevron-right"></i>
                                                            </button></a>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <!-- Modal -->
                                                <div class="modal fade dark" id="delete{{$order->id}}" tabindex="-1" role="dialog" aria-hidden="true" >
                                                    <div class="modal-dialog" role="document" style="background-color: #33353b;">
                                                        <div class="modal-content">
                                                            <div class="modal-header no-bd">
                                                                <h5 class="modal-title">
                                                                    <span class="fw-mediumbold">
                                                                    Are you sure</span>

                                                                </h5>
                                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                    <span aria-hidden="true">&times;</span>
                                                                </button>
                                                            </div>
                                                            <form action="{{route('order.delivered')}}" method="post" enctype="multipart/form-data">
                                                                @csrf
                                                                <div class="modal-footer no-bd">
                                                                    <button type="submit" id="addRowButton" class="btn btn-submit btn-primary">Mark As Done</button>
                                                                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                                                                </div>
                                                                <input type="hidden" class="form-control" id="orderid"  name="orderid" value="{{$order->id}}">
                                                            </form>
                                                        </div>
                                                    </div>
                                                </div>
                                            @endif

                                            @endforeach

                                    </tbody>
                                </table>
                                @else
                                    <h3 class="modal-title p-4">
                                        <span class="fw-mediumbold">
                                        There are no pending orders.</span>
                                    </h3>
                                @endif
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-4">
                    {!! $orders->onEachSide(2)->links() !!}
                    </div>
                </div>
            </div>
        </div>
    </x-slot>
</x-admin>
