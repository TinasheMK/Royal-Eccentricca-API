
<x-home>
    <x-slot name="content">


        <div class="row">

            <div class="col-md-10 mt-4 ml-auto mr-auto">
                <div class=" full-height">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-header">
                                    <div class="card-title" style="color:rgb(214, 140, 3)"><h1>Order {{$result}}</h1></div>
                                    <h4 style="color:green">Thank you for placing your order on Kamusika. We have emailed you your order details. Did not receive order email? Click <a href=" {{ route('order.resendemail', $order->id) }}" >here</a> to resend.<br> Your order will be ready in a short while.
                                        You will be notified via email when it is ready.</h4>

                                   <h4 style="color:">Here is what to bring on collection:<br> <span style="">1. Your id<br>2. Your order number</span></h4>
                                </div>



                                <div class="invoice p-3 mb-3">
                                    <!-- title row -->
                                    <div class="row">
                                        <div class="col-12">
                                        <h4>
                                            <i class="fas fa-globe"></i> Kamusika
                                            <small class="float-right">Date: {{date('Y-m-d')}}</small>
                                        </h4>
                                        </div>
                                        <!-- /.col -->
                                    </div>
                                    <!-- info row -->
                                    <div class="row invoice-info">
                                        <div class="col-sm-4 invoice-col">
                                        From
                                        <address>
                                            <strong>Kamusika Shopping</strong><br>
                                            Phone: +263 777 198 848<br>
                                            Email: info@kamusika.com
                                        </address>
                                        </div>
                                        <!-- /.col -->
                                        <div class="col-sm-4 invoice-col">
                                        To
                                        <address>
                                            <strong>{{Auth::user()->name}}</strong><br>
                                            {{Auth::user()->email}}<br>
                                        </address>
                                        </div>
                                        <!-- /.col -->
                                        <div class="col-sm-4 invoice-col">
                                        </div>
                                        <!-- /.col -->
                                    </div>
                                    <!-- /.row -->

                                    <!-- Table row -->
                                    <div class="row">
                                        <div class="col-12 table-responsive">
                                            <div class="card-body">
                                                <div class="row">

                                                    <div class="col-md-6 col-lg-6">

                                                        <div class="card p-4">
                                                            <h4 class="ml-4"><small> Items:</small> {{$order->item_count}}</h4>

                                                            <table class="table">
                                                                <thead>
                                                                    <tr>
                                                                        <th>Name</th>
                                                                        <th>Price</th>

                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    @foreach ($items as $item)
                                                                    <tr>
                                                                        <td scope="row"><a href="{{route('home.product',$item->id)}}">{{$item->pivot->quantity}} x {{$item->name}}</a></td>
                                                                        <td>${{$item->pivot->price}}</td>
                                                                    </tr>
                                                                    @endforeach

                                                                </tbody>
                                                            </table>
                                                        </div>
                                                        <h4><small>Total: $</small>{{$order->grand_total}}</h4>
                                                    </div>
                                                    <div class="col-md-6 col-lg-6 " style="    background-color: antiquewhite;">
                                                        <span>
                                                            <h4 class="mt-4"><small>Status:</small> @if ($order->status==1)
                                                            <span style="color:green"> Done </span>
                                                            @endif
                                                            @if ($order->status==2)
                                                            <span style="color:blue"> Pending</span>
                                                            @endif
                                                            @if ($order->status==0)
                                                            <span style="color:blue"> Unpaid</span>
                                                            @endif
                                                            </h4>
                                                        </span>

                                                        <h4><small>Full Name </small>  : <span style="">{{$order->shipping_fullname}}</span></h4>
                                                        <h4><small>Address   </small>  : {{$order->shipping_adress}}</h4>
                                                        <h4><small>City      </small>  : {{$order->shipping_city}}</h4>
                                                        <h4><small>Phone     </small>  : {{$order->shipping_phone}}</h4>
                                                        <h4><small>Date Placed     </small>  : {{$order->created_at}}</h4>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                        <!-- /.col -->
                                    </div>
                                    <!-- /.row -->

                                    <div class="row">
                                        <!-- accepted payments column -->

                                        <!-- /.col -->
                                        <div class="col-6">
                                        <p class="lead">{{$result}}</p>


                                        </div>
                                        <!-- /.col -->
                                    </div>
                                    <!-- /.row -->

                                    <!-- this row will not appear when printing -->
                                    <div class="row no-print">
                                        <div class="col-12">
                                        {{-- <a href="invoice-print.html" target="_blank" class="btn btn-default"><i class="fas fa-print"></i> Print</a> --}}
                                        <a href="{{route('profile')}}">
                                        <button type="button" class="btn btn-success float-right"><i class="far fa-credit-card"></i> View Orders
                                        </button></a>
                                        <a href="{{route('home.home')}}">
                                            <button type="button" class="btn btn-info float-right" style="margin-right: 5px;">
                                            <i class="fas fa-home"></i> Back To Home
                                            </button>
                                        </a>
                                        </div>
                                    </div>
                                    </div>
                                    <div class=" p-2 invoice-col">

                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </x-slot>



</x-home>



