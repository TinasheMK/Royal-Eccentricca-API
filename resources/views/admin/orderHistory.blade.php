<x-admin>
    <x-slot name="content">
        <div class="page-inner">
            <div class="page-header">
                <h4 class="page-title">Completed Orders</h4>
                <ul class="breadcrumbs">
                    <li class="nav-home">
                        <a href="#">
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
                        {{-- <div class="card-header">
                            <div class="d-flex align-items-center">
                                <h4 class="card-title">Add Row</h4>
                                <button class="btn btn-primary btn-round ml-auto" data-toggle="modal" data-target="#addRowModal">
                                    <i class="fa fa-plus"></i>
                                    Add Row
                                </button>
                            </div>
                        </div> --}}
                        <div class="card-body">
                            <!-- Modal -->
                            <div class="modal fade" id="addRowModal" tabindex="-1" role="dialog" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header no-bd">
                                            <h5 class="modal-title">
                                                <span class="fw-mediumbold">
                                                New</span>
                                                <span class="fw-light">
                                                    Row
                                                </span>
                                            </h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <p class="small">Create a new row using this form, make sure you fill them all</p>
                                            <form>
                                                <div class="row">
                                                    <div class="col-sm-12">
                                                        <div class="form-group form-group-default">
                                                            <label>Name</label>
                                                            <input id="addName" type="text" class="form-control" placeholder="fill name">
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6 pr-0">
                                                        <div class="form-group form-group-default">
                                                            <label>Position</label>
                                                            <input id="addPosition" type="text" class="form-control" placeholder="fill position">
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-group form-group-default">
                                                            <label>Office</label>
                                                            <input id="addOffice" type="text" class="form-control" placeholder="fill office">
                                                        </div>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                        <div class="modal-footer no-bd">
                                            <button type="button" id="addRowButton" class="btn btn-primary">Mark As Done</button>
                                            <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="table-responsive">
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
                                            <th>Number of items</th>
                                            <th>Amount</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        @foreach ( $orders as $order)
                                        @if ($order->status==1)
                                            <tr>
                                                <th>{{$order->order_number}}</th>
                                                <td>{{$order->shipping_fullname}}</td>
                                                <td>{{$order->shipping_adress}}</td>
                                                <td>{{$order->item_count}}</td>
                                                <td>{{$order->grand_total}}</td>
                                                <td>
                                                    <div class="form-button-action">
                                                        {{-- <button type="button"  data-toggle="modal" data-target="#delete{{$order->id}}" class="btn btn-link btn-success btn-lg">
                                                            <i class="fas fa-check " id=""></i>
                                                        </button> --}}
                                                        <a href="{{route('order.details',$order->id)}}"><button type="button" class="btn btn-link btn-default" data-original-title="More Details">
                                                            <i class="fas fa-chevron-right"></i>
                                                        </button></a>
                                                    </div>
                                                </td>
                                            </tr>
                                              <!-- Modal -->
                                            <div class="modal fade" id="delete{{$order->id}}" tabindex="-1" role="dialog" aria-hidden="true">
                                                <div class="modal-dialog" role="document">
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
                                                                <button type="submit" id="addRowButton" class="btn btn-submit btn-primary">Add</button>
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
        </div>
    </x-slot>
</x-admin>
