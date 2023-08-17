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
	    				<h2 class="text-white pb-2 fw-bold">Contacts</h2>
	    				<h5 class="text-white op-7 mb-2">Here are your contacts.</h5>
	    			</div>

	    		</div>
	    	</div>
	    </div>
	    <div class="page-inner mt--5">
            @include('home.navigation')

            <div class="row">
                <div class="col-md-8 mt-4 ml-auto mr-auto">
                    <div class="full-height">
                        <div class="card-header" style="background-color: #e1a142">
                            <div class="card-head-row">
                                <div class="card-title">Contacts</div>
                                <div class="card-tools">
                                    <ul class="nav nav-pills nav-secondary nav-pills-no-bd nav-sm" id="pills-tab" role="tablist">
                                        <li class="nav-item">
                                            <a class="nav-link active" id="pills-today" style="background:#8f5151" href="{{route('notifications')}}" role="tab" aria-selected="true">Messages</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" id="pills-week"  href="{{route('subscriptions')}}" role="tab" aria-selected="false">Subscriptions</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        		<!-- TimeLine -->
	        			<div class="row">
	        				<div class="col-md-12">
                                <div class="card">
                                    <div class="card-body">

                                        <div class="card-list">
                                            @foreach ($contacts as $contact)
                                                <div class="item-list">
                                                    <div class="avatar">
                                                        @php
                                                        $cover  = $contact->shop->shop_image;
                                                        $cover = substr($cover, 1);
                                                        $cover = substr($cover, 1);
                                                        $cover = substr_replace($cover ,"",-1);
                                                        $cover = substr_replace($cover ,"",-1);
                                                    @endphp
                                                    <img src="{{asset('storage/uploads/'.$contact->id.'/cache/'.$cover)}}" alt="..." class="avatar-img rounded">

                                                    </div>
                                                    <div class="info-user ml-3">
                                                        <div class="username"><a href="{{route('home.shop',$contact->shop->id)}}">{{$contact->shop->name}}</a>->{{$contact->name}}</div>
                                                        <div class="status">{{$contact->description}}</div>
                                                    </div>
                                                    <a href="{{route('unsubscribe',$contact->shop->id)}}">
                                                    <button class="btn btn-icon btn-danger btn-round btn-xs">
                                                        <i class="fa fa-trash"></i>
                                                    </button>
                                                    </a>
                                                    <a href="{{route('message',$contact->id)}}">
                                                    <button class="btn btn-icon btn-primary btn-round btn-xs">
                                                        <i class="fa fa-envelope"></i>
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
                </div>
            </div>
        </div>
    </x-slot>
</x-home>
