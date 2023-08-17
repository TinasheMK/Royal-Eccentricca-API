<x-home>

    <x-slot name="head">
        <!-- overlayScrollbars -->
		{{-- <link rel="stylesheet" href="{{asset('assets/assets/css/adminlte.css')}}"> --}}

    </x-slot>

    <x-slot name="sidebar">
        @include('home.sidebar.sidebar')
    </x-slot>

    <x-slot name="content">
        <div class="content">




                <!--Cateories and main slide-->

                <section>




                    <div class="">
                        <div class=" clearfix">

                            <div class="">


                                <div class="" >


                                    <!-- Content Wrapper. Contains page content -->



                                <!-- Main content -->
                                <section class="content">

                                      <!-- Default box -->
                                      <div class="card card-solid">
                                        <div class="card-body">


                                                <div class="tab-content " id="nav-tabContent">

                                                    {{-- Shop Home Page --}}
                                                    <div class="tab-pane fade show active" id="product-rating" role="tabpanel" aria-labelledby="product-rating-tab">
                                                        <div class="">

                                                            {{-- @foreach ($allposts as $post) --}}

                                                                <div class="col-md-10  col-xl-6 ml-auto mr-auto" style="padding:0 " id="{{$post->id}}">
                                                                    <div class="card card-post card-round">
                                                                        @php
                                                                        $cover  = $post->media_link;
                                                                        $cover = substr($cover, 1);
                                                                        $cover = substr($cover, 1);
                                                                        $cover = substr_replace($cover ,"",-1);
                                                                        $cover = substr_replace($cover ,"",-1);
                                                                        // dd($post);
                                                                        @endphp
                                                                        <img src="{{asset('storage/uploads/'.$post->shop->user->id.'/'.$cover)}}" alt="..." class="card-img-top">

                                                                        <div class="card-body">
                                                                            <div class="d-flex">
                                                                                <div class="avatar">
                                                                                    @php
                                                                                    $cover  = $post->shop->shop_image;
                                                                                    $cover = substr($cover, 1);
                                                                                    $cover = substr($cover, 1);
                                                                                    $cover = substr_replace($cover ,"",-1);
                                                                                    $cover = substr_replace($cover ,"",-1);
                                                                                    // dd($post);
                                                                                    @endphp
                                                                                    <img src="{{asset('storage/uploads/'.$post->shop->user->id.'/cache/'.$cover)}}" alt="..." class="avatar-img rounded-circle">
                                                                                </div>
                                                                                <div class="info-post ml-2">
                                                                                    <p class="username">{{$post->shop->name}}</p>
                                                                                    <p class="date text-muted"><small>
                                                                                        @php
                                                                                        $newtime = strtotime($post->created_at);
                                                                                        $data = date('M d, Y',$newtime);
                                                                                    @endphp
                                                                                    {{$data}} </small></p>
                                                                                </div>
                                                                            </div>
                                                                            <div class="separator-solid"></div>
                                                                            <h3 class="card-title">
                                                                                <a href="#">
                                                                                    {{$post->title}}
                                                                                </a>
                                                                            </h3>
                                                                            <p class="card-text">{{$post->caption}}</p>

                                                                            <div class="card-list">
                                                                                <h5>Comments</h5>
                                                                                <form action="{{route('comment.store')}}" method="POST">
                                                                                    @csrf
                                                                                    <div class="form-group" id="b">
                                                                                        <div class="input-icon">
                                                                                            <input type="text" name="body" class="form-control" placeholder="Leave Comment..." required>
                                                                                            <input type="hidden" name="post_id" value="{{$post->id}}">
                                                                                            <span class="input-icon-addon" >
                                                                                                <button class= "btn btn-icon btn-round btn-link btn-sm"  type="submit">
                                                                                                <i class="fa fa-chevron-right"></i>
                                                                                                </button>
                                                                                            </span>
                                                                                        </div>
                                                                                    </div>
                                                                                </form>

                                                                                @php
                                                                                    // $comments = DB::select('select * from comments where post_id = :id', ['id' => $post->id]simplePaginate(2););
                                                                                    $comments = DB::table('comments')->where('post_id',$post->id)->take(2)->get();
                                                                                @endphp


                                                                                    <livewire:load-more-comments :post="$post->id">


                                                                                <div class=" ">
                                                                                    <a  id="load" class="btn btn-primary btn-rounded btn-xs " style="color: white">more comments</a>
                                                                                </div>

                                                                            </div>

                                                                        </div>
                                                                </div>
                                                                </div>
                                                            {{-- @endforeach --}}

                                                        </div>
                                                    </div>

                                                </div>
                                               </div>
                                        </div>
                                        <!-- /.card-body -->
                                      </div>
                                      <!-- /.card -->

                                </section>
                                <!-- /.content -->






                                </div>


                            </div>

    </x-slot>

</x-home>
