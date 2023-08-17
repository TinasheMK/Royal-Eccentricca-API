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
	    				<h2 class="text-white pb-2 fw-bold">Messages</h2>
	    				<h5 class="text-white op-7 mb-2">Welcome to Pamusika, Enjoy your shopping !</h5>
	    			</div>

	    		</div>
	    	</div>
	    </div>
	    <div class="page-inner mt--5">
            @include('home.navigation')

            <div class="row">
                <div class="col-md-8 mt-4 ml-auto mr-auto">
                    <div class="full-height">
                        <div class="card-header " style="background-color: #c9b826bd">
                            <div class="card-head-row">
                                <div class="card-title">Your Subscriptions</div>

                            </div>
                        </div>
                        		<!-- TimeLine -->
	        			<div class="row">
	        				<div class="col-md-12">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="card-title fw-mediumbold">Your Favourite Shops</div>
                                        <div class="card-list">
                                            @if(count($contacts))
                                            @foreach ($contacts as $contact)
                                                <div class="item-list">
                                                    <div class="avatar">

                                                        @php
                                                        $cover  = $contact->shop_image;
                                                        $cover = substr($cover, 1);
                                                        $cover = substr($cover, 1);
                                                        $cover = substr_replace($cover ,"",-1);
                                                        $cover = substr_replace($cover ,"",-1);
                                                        @endphp
                                                        <img src="{{asset('storage/uploads/'.$contact->user_id.'/cache/'.$cover)}}" alt="..." class="avatar-img rounded">

                                                    </div>
                                                    <a href="{{route('home.shop',$contact->id)}}">
                                                    <div class="info-user ml-3">
                                                        <div class="username"><h3>{{$contact->name}}</h3></div>
                                                        <div class="status"><h4>{{$contact->description}}</h4></div>
                                                    </div>

                                                </div>
                                            @endforeach
                                            @endif


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
