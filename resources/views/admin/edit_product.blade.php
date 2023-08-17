<x-shop>


    <x-slot name="content">
        <div class="page-inner">
            <div class="page-header">
                <h4 class="page-title">Your Products</h4>
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
                        <a>Edit Product</a>
                    </li>
                    <li class="separator">
                        <i class="flaticon-right-arrow"></i>
                    </li>

                </ul>
            </div>
            <div class="row">

                <div class="col-md-12">
                    <div class="card">



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


                    <!-- Modal For Edit-->


                            <div class="card-content">
                                <div class="modal-header no-bd">
                                    <h2 class="modal-title">
                                        <span class="fw-mediumbold">
                                        Editing</span>
                                        <span class="fw-bold">
                                            {{$product->name}}
                                        </span>
                                    </h2>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <form action="{{route('product.update')}}" method="post" enctype="multipart/form-data">
                                        @csrf
                                    <div class="modal-body">
                                        <p class="small">Create a new row using this form, make sure you fill them all</p>

                                        <div class="row">



                                            <input id="addName" name="id" type="hidden" class="form-control" value="{{$product->id}}" required>

                                            <div class="col-sm-12">
                                                <div class="form-group form-group-default">
                                                    <label>Name</label>
                                                    <input id="addName" name="name" type="text" class="form-control" value="{{$product->name}}" required>
                                                </div>
                                            </div>
                                            <div class="col-md-12 pr-0">

                                            </div>
                                            <div class="col-md-12">
                                                <div class="form-group form-group-default">
                                                    <label>Description</label>
                                                    <input id="addOffice" name="description" type="text" class="form-control" value="{{$product->description}}" required>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group form-group-default">
                                                    <label>Price</label>
                                                    <input id="addOffice" name="price" type="number" step="any" class="form-control" value="{{$product->price}}" required>
                                                </div>
                                            </div>
                                            <div class="col-12">
                                                <div class="card-body card-warning">

                                                    <div class="form-group" >
                                                        <textarea id="compose-textarea" name="full_specs" class="form-control" style="height: 300px">
                                                            {!! html_entity_decode($product->full_specs) !!}
                                                        </textarea>
                                                    </div>

                                                  </div>
                                            </div>
                                            <div class="col-sm-12">
                                                <div class="form-group">
                                                    <label for="exampleFormControlFile1">Image</label>
                                                    <input type="file" class="form-control-file" name="image[]" id="exampleFormControlFile1"  multiple="multiple" >
                                                </div>
                                            </div>
                                            <div class="col-sm-12">
                                                <div class="form-group">
                                                    <label for="largeSelect">Select Category</label>
                                                    <select class="form-control form-control-default" id="largeSelect" name="category">

                                                        @foreach($product->category as $c)

                                                            <option value="{{$c->id}}">{{$c->name}}</option>

                                                        @endforeach

                                                        @php
                                                            $allcategories3 = DB::select('select * from categories where parent_id IS NOT NULL');
                                                        @endphp
                                                        @foreach ( $allcategories3 as $category )
                                                            @if($category->menu)
                                                                <option value="{{$category->id}}">{{$category->name}}</option>

                                                            @endif
                                                        @endforeach

                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-sm-12">
                                                <div class="form-group">
                                                    <label for="largeSelect">Select Attributes</label>
                                                        @php
                                                        $ats = [];
                                                        $atribs = $product->attributes;

                                                        foreach ($atribs as $a) {
                                                            array_push($ats, $a->name);
                                                        }
                                                        // dd($ats);

                                                        @endphp


                                                        @foreach ( $attributes as $attribute )

                                                            <div class="form-check">

                                                                @if (in_array($attribute->name,$ats))

                                                                    <div class="form-check">
                                                                        <label class="form-check-label">
                                                                            <input class="form-check-input" type="checkbox" name="{{'att'.$attribute->id}}" value="{{$attribute->id}}" checked>
                                                                            <span class="form-check-sign">{{$attribute->name}}</span>
                                                                        </label>
                                                                    </div>
                                                                @else
                                                                    <div class="form-check">
                                                                        <label class="form-check-label">
                                                                            <input class="form-check-input" type="checkbox" name="{{'att'.$attribute->id}}" value="{{$attribute->id}}">
                                                                            <span class="form-check-sign">{{$attribute->name}}</span>
                                                                        </label>
                                                                    </div>
                                                                @endif

                                                            </div>
                                                        @endforeach

                                                </div>
                                            </div>
                                            <div class="col-sm-12">
                                                <livewire:tag >
                                            </div>
                                        </div>


                                    </div>
                                    <div class="modal-footer no-bd">
                                        <button type="submit" id="addRowButton" class="btn btn-primary">Edit</button>
                                        <a href="{{route('shop.products')}}"><button type="button" class="btn btn-danger" >Close</button>
                                    </div>
                                </form>
                            </div>


                    </div>
                </div>
            </div>
        </div>
        <!-- jQuery -->
        {{-- <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script> --}}
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
        <script src="{{asset('assets/js/core/jquery.min.js')}}"></script>


    </x-slot>
</x-shop>
