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
							<h5 class="text-white op-7 mb-2">Communicate with your shops and place orders.</h5>
						</div>
					</div>
				</div>
			</div>
			<div class="page-inner mt--5">
                @include('home.navigation')
                <div class="row">
                    <div class="col-md-8  mt-4 ml-auto mr-auto">
                        <div class="card full-height">
                            <div class="card-header" style="background-color: #e1a142">
                                <div class="card-head-row">
                                    <div class="card-title">Messages</div>
                                    <div class="card-tools">
                                        <ul class="nav nav-pills nav-secondary nav-pills-no-bd nav-sm" id="pills-tab" role="tablist">
                                            <li class="nav-item">
                                                <a class="nav-link active" id="pills-today" style="background:#8f5151" href="{{route('notifications')}}" role="tab" aria-selected="true">Messages</a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" id="pills-week"  href="{{route('contacts')}}" role="tab" aria-selected="false">Contacts</a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="card-body">
                                @php
                                    $users = array();
                                @endphp

                                @foreach ($messages as $message)
                                    @if (in_array($message->user_id, $users))

                                    @else
                                        <div class="d-flex">
                                            <div class="avatar avatar-online">

                                                        <!--9 is the disabled shop to replace shop that is deleted-->
                                                    @php
                                                        $username = DB::select('select * from users where id = :id', ['id' => $message->user_id]);
                                                        $tshop = DB::table('shops')->where('user_id', $message->user_id )->first();
                                                        // dd($username[0]->name);
                                                        if($tshop){
                                                        }
                                                        else{
                                                        $tshop =DB::table('shops')->find(9);
                                                        }
                                                    @endphp

                                                    @php
                                                        $cover  = $username[0]->profile_photo_path;

                                                    @endphp

                                                    @php
                                                        $cover  = $tshop->shop_image;
                                                        $cover = substr($cover, 1);
                                                        $cover = substr($cover, 1);
                                                        $cover = substr_replace($cover ,"",-1);
                                                        $cover = substr_replace($cover ,"",-1);
                                                    @endphp


                                                <span>
                                                    <img src="{{asset('storage/uploads/'.$tshop->user_id.'/'.$cover)}}" onerror="this.src='{{asset('assets/img/placeholderwhite.png')}}';" alt="..." class="avatar-title rounded-circle border border-white bg-warning">
                                                </span>

                                            </div>

                                            <div class="flex-1 ml-3 pt-1">
                                                <a href="{{route('message', $message->user_id)}}">

                                                    @foreach ($username as $username)
                                                        <h6 class="text-uppercase fw-bold mb-1">{{$tshop->name}}
                                                            @if ($message->reply)
                                                                <span class="text-default pl-3">incoming</span>
                                                            @else
                                                               @if ($message->is_read)
                                                                    <span class="text-success pl-3">seen</span>
                                                                @else
                                                                    <span class="text-warning pl-3">unseen</span>
                                                                @endif

                                                            @endif


                                                        </h6>
                                                        <span class="text-muted">{{$message->body}}</span>
                                                    @endforeach
                                                </a>
                                            </div>

                                        </div>
                                        <div class="float-right">
                                            <small class="text-muted">{{$message->created_at}}</small>
                                        </div>

                                        <div class="separator-dashed"></div>
                                        @php

                                            array_push($users,$message->user_id);
                                        @endphp
                                    @endif


                                @endforeach
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    </x-slot>
</x-home>
