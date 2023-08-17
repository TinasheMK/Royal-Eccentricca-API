<x-home>
    <x-slot name="bodytag">
        <body onload="window.location.hash = 'b'">
    </x-slot>

    <x-slot name="sidebar">
        @include('home.sidebar.sidebar')
    </x-slot>

    <x-slot name="content">


        <div class="card-header main-header" style="  background-color: #f1f1f1;        ; z-index:999">
            <div class="card-head-row">
                @foreach ($user as $user)
                    @if($user->shop->name)
                        <div class="card-title">{{$user->shop->name}}<small>->{{$user->name}}</small></div>
                    @else
                        <div class="card-title">{{$user->name}}</div>
                    @endif
                    @php
                        $userid = $user->id;
                    @endphp
                    <div class="card-tools">
                        <ul class="nav nav-pills nav-secondary nav-pills-no-bd nav-sm" id="pills-tab" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link" id="pills-today"  href="{{route('notifications')}}" role="tab" aria-selected="true">Messages</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link " id="pills-week"  href="{{route('contacts')}}" role="tab" aria-selected="false">Contacts</a>
                            </li>

                        </ul>
                    </div>
                @endforeach

            </div>
        </div>
        <div class="row">

            <div class="col-md-8 mt-4 ml-auto mr-auto">
                <div class="card mt-4 full-height">
                    		<!-- TimeLine -->

					<div class="row mt-4">
						<div class="col-md-12 mt-4">

							<ul class="timeline mt-4 p-3">

                                @foreach ($messages as $message )

                                    @if ($message->reply)
                                        <li class="timeline-inverted">
                                            <div class="timeline-panel mb-1 mt-1">
                                                <div class="timeline-heading">
                                                    {{$message->body}}
                                                    <h5><small class="text-muted"><i class="flaticon-message"></i> {{$message->created_at}}</small></h5>
                                                </div>
                                            </div>
                                        </li>
                                    @else
                                        <li>
                                            <div class="timeline-panel mb-1 mt-1">
                                                <div class="timeline-heading">
                                                    {{$message->body}}
                                                    <h5><small class="text-muted"><i class="flaticon-message"></i> {{$message->created_at}}</small></h5>
                                                </div>
                                            </div>
                                        </li>
                                    @endif


                                @endforeach



							</ul>
                            <form action="{{route('message.create')}}" method="POST">
                                @csrf
                                <div class="form-group" id="b">
                                    <div class="input-icon">
                                        <input type="text" name="body" class="form-control" placeholder="Type Message...">
                                        <input type="hidden" name="userid" value="{{$userid}}">
                                        <span class="input-icon-addon" >
                                            <button class= "btn btn-icon btn-round btn-link btn-sm"  type="submit">
                                            <i class="icon-action-redo"></i>
                                            </button>
                                        </span>
                                    </div>
                                </div>
                            </form>

						</div>
					</div>

                </div>
            </div>
        </div>










    </x-slot>
</x-home>
