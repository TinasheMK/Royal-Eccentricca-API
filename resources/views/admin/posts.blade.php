<x-shop>
    <x-slot name="content">
        <div class="page-inner">
            <div class="page-header">
                <h4 class="page-title">Your Posts</h4>
                <ul class="breadcrumbs">
                    <li class="nav-home">
                        <a href="#">
                            <i class="flaticon-home"></i>
                        </a>
                    </li>
                    <li class="separator">
                        <i class="flaticon-right-arrow"></i>
                    </li>
                    <li class="nav-item">
                        <a href="#">Posts</a>
                    </li>

                </ul>
            </div>
            <div class="row">

                <div class="col-md-12">
                    <div class="card">
                        <div class="card-header">
                            <div class="d-flex align-items-center">
                                <h4 class="card-title">Posts</h4>
                                <button class="btn btn-primary btn-round ml-auto" data-toggle="modal" data-target="#addRowModal">
                                    <i class="fa fa-plus"></i>
                                    Add Post
                                </button>
                            </div>
                        </div>
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

                        <div class="card-body">
                            <!-- Modal -->
                            <div class="modal fade" id="addRowModal" tabindex="-1" role="dialog" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header no-bd">
                                            <h5 class="modal-title">
                                                <span class="fw-mediumbold">
                                                New</span>
                                                <span class="fw-light">
                                                    Post
                                                </span>
                                            </h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <form action="{{route('post.add')}}" method="post" enctype="multipart/form-data">
                                            @csrf
                                            <div class="modal-body">
                                            <p class="small">Create a new post.</p>
                                            <div class="row">
                                                <div class="col-sm-12">
                                                    <div class="form-group">
                                                        <div class="containerpost mb-2">
                                                            <div class="wrapperpost">
                                                                <div class="imagepost" >
                                                                <img id="imagepost" onerror="this.src='{{asset('assets/img/placeholderwhite.png')}}';" src="" alt=".">
                                                                </div>
                                                                <div class="contentpost">
                                                                <div class="icon btn-warnings"></div>
                                                                <div class="text"></div>
                                                                </div>
                                                                <div id="cancel-btn"><i class="fas fa-times"></i></div>
                                                                <div class="file-name">File name here</div>
                                                            </div>
                                                            <button type="button" onclick="defaultBtnActive()" class="btn btn-info ml-auto mr-auto" id="custom-btn">Choose Image</button>

                                                            <input type="file" class="form-control-file" name="image[]" id="exampleFormControlFile1"  multiple="multiple"  required>
                                                        </div>
                                                       
                                                    </div>
                                                </div>
                                                <div class="col-md-6 pr-0">
                                                    <div class="form-group form-group-default">
                                                        <label>Title</label>
                                                        <input id="addPosition" name="title" type="text" class="form-control" placeholder="set title" required>
                                                    </div>
                                                </div>
                                                <div class="col-sm-12">
                                                    <div class="form-group form-group-default">
                                                        <label>Caption</label>
                                                        <input id="addName" name="caption" type="text" class="form-control" placeholder="fill caption" required>
                                                    </div>
                                                </div>
                                            </div>
                                            </div>
                                            <div class="modal-footer no-bd">
                                                <button type="submit" id="addRowButton" class="btn btn-primary" >Post</button>
                                                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>

                            {{-- Posts--}}
                            <section>
                                <div class="electro-product-wrapper wrapper-padding  mt-4 pt-95 pb-45">
                                    <div class="container-fluid">
                                        <div class="row">
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
                                                        <div class="card-body p-1">
                                                            <div class="row">
                                                                <div class="col">
                                                                    <h4 class="mb-0">

                                                                            {{$post->title}}

                                                                    </h4>
                                                                </div>
                                                                <div class="col">
                                                                    <a href="{{route('post.delete',$post->id)}}">
                                                                        <button class="btn btn-danger btn-icon btn-link mr-0" style="height:auto" title="Delete Post">
                                                                            <i class="fa fa-trash" title="Delete Post"></i>
                                                                        </button>
                                                                    </a>
                                                                </div>
                                                            </div>
                                                            <h5 class="pt-0 text-muted mb-1">{{$post->caption}}<br><small>
                                                                @php
                                                                    $newtime = strtotime($post->created_at);
                                                                    $data = date('M d, Y',$newtime);
                                                                @endphp
                                                                {{$data}}</small></h5>
                                                        </div>
                                                    </div>
                                                </div>

                                            @endforeach
                                        </div>
                                    </div>
                                </div>
                            </section>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- jQuery -->
        {{-- <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script> --}}
        <script>
            const wrapper = document.querySelector(".wrapperpost");
            const fileName = document.querySelector(".file-name");
            const defaultBtn = document.querySelector("#exampleFormControlFile1");
            const customBtn = document.querySelector("#custom-btn");
            const cancelBtn = document.querySelector("#cancel-btn i");
            const img = document.querySelector("#imagepost");
            let regExp = /[0-9a-zA-Z\^\&\'\@\{\}\[\]\,\$\=\!\-\#\(\)\.\%\+\~\_ ]+$/;
            function defaultBtnActive(){
                defaultBtn.click();
            }
            defaultBtn.addEventListener("change", function(){
                const file = this.files[0];
                if(file){
                const reader = new FileReader();
                reader.onload = function(){
                    const result = reader.result;
                    img.src = result;
                    wrapper.classList.add("active");
                }
                cancelBtn.addEventListener("click", function(){
                    img.src = "";
                    wrapper.classList.remove("active");
                })
                reader.readAsDataURL(file);
                }
                if(this.value){
                let valueStore = this.value.match(regExp);
                fileName.textContent = valueStore;
                }
            });
        </script>
        <script>
            $(function() {
            // Multiple images preview with JavaScript
            var multiImgPreview = function(input, imgPreviewPlaceholder) {

                if (input.files) {
                    var filesAmount = input.files.length;

                    for (i = 0; i < filesAmount; i++) {
                        var reader = new FileReader();

                        reader.onload = function(event) {
                            $($.parseHTML('<img>')).attr('src', event.target.result).appendTo(imgPreviewPlaceholder);
                        }

                        reader.readAsDataURL(input.files[i]);
                    }
                }

            };

            $('#images').on('change', function() {
                multiImgPreview(this, 'div.imgPreview');
            });
            });
        </script>

    </x-slot>
</x-shop>
