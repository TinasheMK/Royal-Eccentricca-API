<x-home>

    <x-slot name="sidebar">
        @include('home.sidebar.sidebar')
    </x-slot>

    <x-slot name="content">

                <!--Top Slide!-->
	    <div class="panel-header custom-back">
	    	<div class="page-inner py-5">
	    		<div class="d-flex align-items-left align-items-md-center flex-column flex-md-row">
	    			<div>
	    				<h2 class="text-white pb-2 fw-bold">Shops</h2>
	    				<h5 class="text-white op-7 mb-2">Welcome to Pamusika, Enjoy your shoping !</h5>
	    			</div>
	    		</div>
	    	</div>
	    </div>
	    <div class="page-inner mt--5">
            @include('home.navigation')

            <section>
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
                <div class="electro-product-wrapper wrapper-padding  mt-4 pt-95 pb-45">
                    <div class="container-fluid">
                        <h3>Popular Shops</h3>
                        <div class="row">
                            @foreach ($topshop as $tshop)
                                <div class="col-md-3 col-sm-4 pr-md-0 col-6 ">
                                <div class="card card-post card-round">

                                    @php
                                        $cover  = $tshop->shop_image;
                                        $cover = substr($cover, 1);
                                        $cover = substr($cover, 1);
                                        $cover = substr_replace($cover ,"",-1);
                                        $cover = substr_replace($cover ,"",-1);
                                    @endphp
                                    <img src="{{asset('storage/uploads/'.$tshop->user_id.'/'.$cover)}}" onerror="this.src='{{asset('assets/img/494.jpg')}}'"  alt="..." class="avatar-img rounded">

                                    <div class="card-body">
                                        <div class="separator-solid" style="margin: 0"></div>
                                        <h5 class="">
                                            <a href="#">
                                                {{$tshop->name}}
                                            </a>
                                        </h5>
                                        <div class="row">
                                            <div class="col-lg-4 col-sm-6 item-list">
                                                <p class=" text-info mb-1">
                                                    <a href="{{route('home.shop',$tshop->id)}}">
                                                    <button class="btn btn-icon btn-info btn-round btn-xs">
                                                        <i class="fa fa-info"></i>
                                                    </button>
                                                    View</a>
                                                </p>
                                            </div>
                                            <div class="col-lg-4 col-sm-6 item-list">
                                                <p class=" text-info mb-1">
                                                     <a href="{{route('message',$tshop->user_id)}}">
                                                        <button class="btn btn-icon btn-success btn-round btn-xs">
                                                        <i class="fa fa-envelope  "></i>
                                                    </button>
                                                   Chat</a>
                                                </p>
                                            </div>
                                            <div class="col-lg-4 col-sm-6 item-list">
                                                <p class=" text-info mb-1">
                                                    <a href="{{route('subscribe',$tshop->id)}}">
                                                    <button class="btn btn-icon btn-warning btn-round btn-xs">
                                                        <i class="fa fa-plus"></i>
                                                    </button>
                                                    Add
                                                </a>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                </div>
                            @endforeach


                        </div>
                        <h3>More Shops</h3>
                        <div class="card">
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
                                            <img src="{{asset('storage/uploads/'.$mshop->user_id.'/cache/'.$cover)}}"  onerror="this.src='{{asset('assets/img/494.jpg')}}'"  alt="..." class="avatar-img rounded">

                                        </div>
                                        <div class="info-user ml-3">
                                            <a href="{{route('home.shop',$mshop->id)}}">
                                            <div class="username">{{$mshop->name}}</div>
                                            <div class="status">{{$mshop->description}}</div></a>
                                        </div>
                                        <a href="{{route('subscribe', $mshop->id)}}">
                                            <button class="btn btn-icon btn-warning btn-round btn-xs" title="Subscribe">
                                                <i class="fa fa-plus"></i>
                                            </button>
                                        </a>
                                    </div>
                                    @endforeach


                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </x-slot>
</x-home>
