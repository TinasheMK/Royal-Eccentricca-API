<x-shop>
    <x-slot name="content">
        <div class="row">

            <div class="col-md-10 mt-4 ml-auto mr-auto">
                <div class=" full-height">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-header">
                                    <div class="card-title">OrderNumber:<span class="mt-3 mb-3"><b> {{$order->order_number}}</b></span>
                                    </div>
                                </div>

                                    <div class="card-body">
                                        <div class="row">

                                            <div class=" col-lg-8">

                                                <div class="card p-4">
                                                    <h4 class="ml-4"><small> Items:</small> {{$order->item_count}}</h4>

                                                    <table class="table">
                                                        <thead>
                                                            <tr>
                                                                <th>Name</th>
                                                                <th>Specs<br><small>Color,Size</small></th>
                                                                <th>Price</th>

                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            @foreach ($items as $item)
                                                            <tr>
                                                                <td scope="row"><a href="{{route('home.product',$item->id)}}">{{$item->pivot->quantity}} x {{$item->name}}</a></td>
                                                                <td>
                                                                    @php
                                                                        $cover  = $item->pivot->attributes;
                                                                        $cover = substr($cover, 1);
                                                                        $cover = substr_replace($cover ,"",-1);

                                                                       $atts=explode(',',$cover);
                                                                       for($i=0; $i < count($atts ); $i++){
                                                                            $atr = explode(':', $atts [$i]);

                                                                            $cover1  = $atr [0];
                                                                            $cover1 = substr($cover1, 1);
                                                                            $cover1 = substr_replace($cover1 ,"",-1);

                                                                            $cover2  = $atr [1];
                                                                            $cover2 = substr($cover2, 1);
                                                                            $cover2 = substr_replace($cover2 ,"",-1);

                                                                            $attarr[$cover1] = $cover2;
                                                                            
                                                                        }
                                                                        if (isset($attarr['numbersize'])){
                                                                        }
                                                                        else{
                                                                            $attarr['numbersize'] = "";
                                                                        }
                                                                        if (isset($attarr['size'])){
                                                                        }
                                                                        else{
                                                                            $attarr['size'] = "";
                                                                        }
                                                                    @endphp
                                                                    <i class="fas fa-clone" style="color: {{$attarr['color'] ?? '#ffffff00'}} "></i>
                                                                    {{strtoupper($attarr['size'])}}
                                                                    {{strtoupper($attarr['numbersize'])}}
                                                                </td>
                                                                <td>${{$item->pivot->price}}</td>
                                                            </tr>
                                                            @endforeach

                                                        </tbody>
                                                    </table>
                                                </div>
                                                <h4><small>Total: $</small>{{$order->grand_total}}</h4>
                                            </div>
                                            <div class=" col-lg-4 " style="    background-color: rgb(192, 184, 157);">
                                                <span>
                                                    <h4 class="mt-4"><small>Status:</small> @if ($order->status==1)
                                                    <span style="color:green"> Done </span>
                                                    @else
                                                    <span style="color:red"> Pending</span>
                                                    @endif
                                                    </h4>
                                                </span>
                                                <h4><small>Full Name </small>  : <span style="">{{$order->shipping_fullname}}</span></h4>
                                                <h4><small>Address   </small>  : {{$order->shipping_adress}}</h4>
                                                <h4><small>City      </small>  : {{$order->shipping_city}}</h4>
                                                <h4><small>Phone     </small>  : {{$order->shipping_phone}}</h4>
                                                @php
                                                    $newtime = strtotime($order->created_at);
                                                    $data = date('d M',$newtime);
                                                @endphp
                                                <h4><small>Date Placed     </small>  : {{$data}}</h4>
                                            </div>

                                        </div>
                                    </div>

                                    <div class="modal-footer no-bd">

                                            <a href="{{route('shop.orders')}}"><button class="btn btn-danger">Back</button></a>
                                        </div>
                                        <input type="hidden" class="form-control" id="orderid"  name="orderid" value="{{$order->id}}">

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </x-slot>
</x-shop>
