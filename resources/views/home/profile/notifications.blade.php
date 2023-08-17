<x-home>

    <x-slot name="content">

        <!--Top Slide!-->
		<div class="panel-header bg-primary-gradient">
			<div class="page-inner py-5">
				<div class="d-flex align-items-left align-items-md-center flex-column flex-md-row">
					<div>
						<h2 class="text-white pb-2 fw-bold">Notifications</h2>
						<h5 class="text-white op-7 mb-2">Here is your feed.</h5>
					</div>
				</div>
			</div>
		</div>
		<div class="page-inner mt--5">
            @include('home.navigation')
            <div class="row">
                <div class="col-md-8 mr-auto ml-auto p-3">
                            <div class="card full-height">
                                <div class="card-header">
                                    <div class="card-title">Activity</div>
                                </div>
                                <div class="card-body">
                                    @if (count($notifications)>0)

                                        <ol class="activity-feed">
                                        @foreach ($notifications as $notification )
                                            @php
                                                $newtime = strtotime($notification->created_at);
                                                $data = date('d M',$newtime);
                                            @endphp
                                            <li class="feed-item feed-item-secondary">
                                            <time class="date" datetime="9-25">{{$data}}</time>
                                            <span class="text">{!! html_entity_decode($notification->title) !!} {{$notification->description}}</span>
                                        </li>

                                        @endforeach

                                    </ol>
                                    @else
                                        No notifications yet.
                                    @endif

                                </div>
                            </div>
                </div>
            </div>
        </div>
    </x-slot>
</x-home>
