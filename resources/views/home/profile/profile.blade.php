<x-home>
    <x-slot name="css">
    <link rel="stylesheet" href="{{ mix('css/app.css') }}">
</x-slot>
<x-slot name="sidebar">
    @include('home.sidebar.sidebar')
</x-slot>
{{-- {{dd($user)}} --}}
<x-slot name="content">
    <div class="panel-header custom-back">
        <div class="page-inner py-5">
            <div class="d-flex align-items-left align-items-md-center flex-column flex-md-row">
                <div>
                    <h2 class="text-white pb-2 fw-bold">Profile</h2>
                    <h5 class="text-white op-7 mb-2"></h5>
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
        <div class="row">

            <div class="col-lg-4">
                <div class="card card-profile">
                    <div class="card-header" style="background-image: url('../assets/img/4.jpg')">
                        <div class="profile-picture">
                            <div class="avatar avatar-xl">
                                {{-- @php
                                    $cover  = Auth::user()->profile_photo_path;
                                    $cover = substr($cover, 1);
                                    $cover = substr($cover, 1);
                                    $cover = substr_replace($cover ,"",-1);
                                    $cover = substr_replace($cover ,"",-1);
                                @endphp
                                <img src="{{asset('storage/uploads/'.Auth::user()->id.'/cache/'.$cover)}}" onerror="this.src='{{asset('assets/img/placeholderwhite.png')}}';" alt="..." class="avatar-img rounded-circle"> --}}

                                @if (Laravel\Jetstream\Jetstream::managesProfilePhotos())
                                            <img class="avatar-img rounded-circle" src="{{ Auth::user()->profile_photo_url }}" alt="{{ Auth::user()->name }}" />
                                    @else
                                        <span class="inline-flex rounded-md">
                                            <button type="button" class="inline-flex items-center px-3 py-2 border border-transparent text-sm leading-4 font-medium rounded-md text-gray-500 bg-white hover:text-gray-700 focus:outline-none transition ease-in-out duration-150">
                                                {{ Auth::user()->name }}

                                                <svg class="ml-2 -mr-0.5 h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor">
                                                    <path fill-rule="evenodd" d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z" clip-rule="evenodd" />
                                                </svg>
                                            </button>
                                        </span>
                                    @endif
                            </div>
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="user-profile text-center">
                            <div class="name">{{$user->name}}</div>
                            <div class="job">{{$user->email}}</div>
                            <div class="desc">{{$user->address}}</div>
                            {{-- <div class="social-media">
                                <a class="btn btn-info btn-twitter btn-sm btn-link" href="#">
                                    <span class="btn-label just-icon"><i class="flaticon-twitter"></i> </span>
                                </a>
                                <a class="btn btn-danger btn-sm btn-link" rel="publisher" href="#">
                                    <span class="btn-label just-icon"><i class="flaticon-google-plus"></i> </span>
                                </a>
                                <a class="btn btn-primary btn-sm btn-link" rel="publisher" href="#">
                                    <span class="btn-label just-icon"><i class="flaticon-facebook"></i> </span>
                                </a>
                                <a class="btn btn-danger btn-sm btn-link" rel="publisher" href="#">
                                    <span class="btn-label just-icon"><i class="flaticon-dribbble"></i> </span>
                                </a>
                            </div> --}}
                            <div class="view-profile">
                                <a href="{{route('profile.show')}}" class="btn btn-warning btn-block">Edit Profile</a>
                            </div>
                        </div>
                    </div>
                    {{-- <div class="card-footer">
                        <div class="row user-stats text-center">
                            <div class="col">
                                <div class="number">125</div>
                                <div class="title">Post</div>
                            </div>
                            <div class="col">
                                <div class="number">25K</div>
                                <div class="title">Followers</div>
                            </div>
                            <div class="col">
                                <div class="number">134</div>
                                <div class="title">Following</div>
                            </div>
                        </div>
                    </div> --}}
                </div>
            </div>
            <div class="col-lg-8">
            <div class="row">
                <div class="col-md-4">
                    <div class="card card-primary " style="background-color: #47658c !important">
                        <div class="card-body">
                            <div class="card-body">
                                <div class="card-title fw-mediumbold"><i class="flaticon-coins text-success"></i> <br>Balance : ${{ Auth::user()->balance }}</div>
                                <div class="card-list">

                                        <div class="item-list">


                                                <div class="status"><a class="text-white" href="{{route('wallet.wallet')}}">Add Funds</a></div>



                                        </div>



                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="card-title fw-mediumbold">Orders</div>

                            <div class="table-responsive">
                                <table id="add-row" class="display table table-striped table-hover" >
                                    <thead>
                                        <tr>
                                            <th>Order Id</th>
                                            <th>Order</th>
                                            <th>Shipping Address</th>
                                            <th>Date Placed</th>
                                            <th style="width: 10%">Amount</th>
                                            <th>More</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>Order Id</th>
                                            <th>Description</th>
                                            <th>Shipping Address</th>
                                            <th>Date Placed</th>
                                            <th>Amount</th>
                                            <th>More</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        @foreach ( $orders as $order)
                                        @if ($order->status==1)
                                            @php
                                                $newtime = strtotime($order->created_at);
                                                $data = date('d M Y  h:m',$newtime);
                                            @endphp
                                            <tr>
                                                <th>{{$order->order_number}}</th>
                                                <td style="color: green">Done</td>
                                                <td>{{$order->shipping_adress}}</td>
                                                <td>{{$data}}</td>
                                                <td>{{$order->grand_total}}</td>
                                                <td>
                                                    <div class="form-button-action">

                                                        <a href="{{route('order.detailsuser',$order->id)}}"><button type="button" class="btn btn-link btn-default" data-original-title="More Details">
                                                            <i class="fas fa-chevron-right"></i>
                                                        </button></a>
                                                    </div>
                                                </td>
                                            </tr>
                                        @endif
                                        @if ($order->status==2)
                                            @php
                                                $newtime = strtotime($order->created_at);
                                                $data = date('d M Y ',$newtime);
                                            @endphp
                                            <tr>
                                                <th>{{$order->order_number}}</th>
                                                <td style="color:blue">Pending</td>
                                                <td>{{$order->shipping_adress}}</td>
                                                <td>{{$data}}</td>
                                                <td>{{$order->grand_total}}</td>
                                                <td>
                                                    <div class="form-button-action">
                                                        <a href="{{route('order.detailsuser',$order->id)}}"><button type="button" class="btn btn-link btn-default" data-original-title="More Details">
                                                            <i class="fas fa-chevron-right"></i>
                                                        </button></a>
                                                    </div>
                                                </td>
                                            </tr>

                                        @endif
                                        @if ($order->status==0)
                                            @php
                                                $newtime = strtotime($order->created_at);
                                                $data = date('d M Y  h:m',$newtime);
                                            @endphp
                                            <tr>
                                                <th>{{$order->order_number}}</th>
                                                <td style="color:red">Unpaid</td>
                                                <td>{{$order->shipping_adress}}</td>
                                                <td>{{$data}}</td>
                                                <td>{{$order->grand_total}}</td>
                                                <td>
                                                    <div class="form-button-action">
                                                        <a href="{{route('order.detailsuser',$order->id)}}"><button type="button" class="btn btn-link btn-default" data-original-title="More Details">
                                                            <i class="fas fa-chevron-right"></i>
                                                        </button></a>
                                                    </div>
                                                </td>
                                            </tr>

                                        @endif

                                        @endforeach


                                    </tbody>
                                </table>
                            </div>
                            <div class="row">
                                <div class="col-lg-4">
                                {!! $orders->onEachSide(2)->links() !!}
                                </div>
                            </div>
                        </div>
                        <div class="card-body">
                            <div class="card-title fw-mediumbold">Suggested Shops</div>
                            <div class="card-list">
                                @foreach ($moreshops as $mshop)
                                    <div class="item-list">
                                        <div class="avatar">
                                        @php
                                            $cover  = $mshop->shop_image;
                                            $cover = substr($cover, 1);
                                            $cover = substr($cover, 1);
                                            $cover = substr_replace($cover ,"",-1);
                                            $cover = substr_replace($cover ,"",-1);
                                        @endphp
                                        <img src="{{asset('storage/uploads/'.$mshop->user->id.'/cache/'.$cover)}}"
 onerror="this.src='{{asset('assets/img/494.jpg')}}'"  alt="..." class="avatar-img rounded-circle">

                                        </div>

                                        <div class="info-user ml-3">
                                            <a href="{{route('home.shop', $mshop->id)}}">
                                            <div class="username">{{$mshop->name}}</div>
                                            </a>
                                            <div class="status">{{$mshop->description}}</div>
                                        </div>
                                        <a href="{{route('subscribe', $mshop->id)}}">
                                            <button class="btn btn-icon btn-warning btn-round btn-xs" title="subscribe">
                                                <i class="fa fa-plus " style="color: rgb(58, 98, 207)"></i>
                                            </button>
                                        </a>
                                    </div>
                                @endforeach


                            </div>
                        </div>
                    </div>
                </div>

            </div>


    </div>

</x-slot>

</x-home>
