<section>
    <div class="electro-product-wrapper wrapper-padding  mt-4 pt-95 pb-45">
        <div class="container-fluid">
            <div class="row">
                @if (session()->has('message'))
                    <div class="alert alert-success">
                        {{ session('message') }}
                    </div>
                @endif
                @foreach ($posts as $post)
                <div class="col-md-4 col-sm-6 pr-md-0 col-12 ">
                    <div class="card card-post card-round">
                        @php
                            $cover  = $post->media_link;
                            $cover = substr($cover, 1);
                            $cover = substr($cover, 1);
                            $cover = substr_replace($cover ,"",-1);
                            $cover = substr_replace($cover ,"",-1);
                        @endphp
                        <img src="{{asset('storage/uploads/'.$post->shop->user->id.'/'.$cover)}}" alt="..." class="card-img-top">
                        <div class="card-body">
                            <div class="separator-solid" style="margin: 0"></div>
                            <h5 class="">

                                    {{$post->title}}

                            </h5>
                            <p class=" text-info mb-1"><a href="{{route('home.shop',$post->shop_id)}}">Visit</a></p>
                        </div>
                    </div>
                </div>
                @php
                    $welcome+=1;
                @endphp
                @auth
                     @if ($welcome==6)
                        <div class="col-md-4 col-sm-6 pr-md-0 col-12">
                            <div class="card card-info card-annoucement card-round">
                                <div class="card-body text-center">
                                    <div class="card-opening">Hello {{Auth::user()->name}},</div>
                                    <div class="card-desc">
                                        Welcome back to Kamusika. Here are some popular posts to keep you updated.
                                    </div>
                                    <div class="card-detail">
                                        <a href="{{route('notifications')}}"><div class="btn btn-light btn-rounded">View Messages</div></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    @endif
                @endauth


                @endforeach

                <div class="col-md-4 col-sm-6 pr-md-0 col-12 ">
                    <div class="card card-round">
                        <div class="card-body">
                            <div class="card-title fw-mediumbold">Suggested Shops</div>
                            <div class="card-list">
                                @foreach ($suggestions as $shop)
                                    <div class="item-list">
                                    <div class="avatar">
                                        @php
                                        $cover  = $shop->shop_image;
                                        $cover = substr($cover, 1);
                                        $cover = substr($cover, 1);
                                        $cover = substr_replace($cover ,"",-1);
                                        $cover = substr_replace($cover ,"",-1);
                                        @endphp
                                        <img src="{{asset('storage/uploads/'.$shop->user->id.'/cache/'.$cover)}}" onerror="this.src='{{asset('assets/img/494.jpg')}}'" alt="..." class="avatar-img rounded-circle">
                                    </div>
                                    <div class="info-user ml-3">
                                        <a href="{{route('home.shop',$shop->id)}}"><div class="username">{{$shop->name}}</div></a>
                                        <div class="status">{{$shop->description}}</div>
                                    </div>
                                    <button class="btn btn-icon btn-warning btn-round btn-xs">
                                        <a href="{{route('subscribe',$shop->id)}}"><i class="fa fa-plus"></i></a>
                                    </button>
                                </div>
                                @endforeach


                            </div>
                        </div>
                    </div>
                </div>







            </div>
        </div>
    </div>
</section>





