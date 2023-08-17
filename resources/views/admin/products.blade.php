<x-admin>


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
                        <a>Products</a>
                    </li>
                    <li class="separator">
                        <i class="flaticon-right-arrow"></i>
                    </li>

                </ul>
            </div>
            <div class="row">

                <div class="col-md-12">
                    <div class="card">
                        <div class="card-header">
                            <div class="d-flex align-items-center">
                                <h4 class="card-title">Products</h4>
                                <button class="btn btn-warning btn-round ml-auto" data-toggle="modal" data-target="#addRowModal">
                                    <i class="fa fa-plus"></i>
                                    Add Product
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
                                <div class="modal-dialog ml-auto mr-auto" role="document" style="max-width: 80%; ">
                                    <div class="modal-content">
                                        <div class="modal-header no-bd">
                                            <h5 class="modal-title">
                                                <span class="fw-mediumbold">
                                                New</span>
                                                <span class="fw-light">
                                                    Row
                                                </span>
                                            </h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>


                                        <form action="{{route('product.add')}}" method="post" enctype="multipart/form-data">
                                                @csrf
                                            <div class="modal-body">
                                                <p class="small">Create a new product using this form, make sure you fill them all</p>




                                                <div class="row">
                                                    <div class="col-sm-12">
                                                        <div class="form-group form-group-default">
                                                            <label>Name</label>
                                                            <input id="addName" name="name" type="text" class="form-control" placeholder="fill name" required>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-12 pr-0">
                                                        <div class="form-group form-group-default">
                                                            <label>Description</label>
                                                            <input id="addPosition" name="description" type="text" class="form-control" placeholder="fill description" required>
                                                        </div>
                                                    </div>
                                                    <div class="col-12">
                                                        <div class="card-body card-warning">

                                                            <div class="form-group" >
                                                                <textarea id="compose-textarea" name="full_specs" class="form-control" required style="height: 300px">
                                                                  <h1><u>No Description</u></h1>

                                                                </textarea>
                                                            </div>

                                                          </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-group form-group-default">
                                                            <label>Price</label>
                                                            <input id="addOffice" name="price" type="number" step="any" class="form-control" placeholder="fill price" required>
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-12">
                                                        <div class="form-group">
                                                            <label for="exampleFormControlFile1">Image</label>
                                                            <input type="file" class="form-control-file" name="image[]" id="exampleFormControlFile1"  multiple="multiple" required>
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-12">
                                                        <div class="form-group">
                                                            <label for="largeSelect">Select Category</label>
                                                            <select class="form-control form-control-default" id="largeSelect" name="category">

                                                                @php
                                                                    $allcategories3 = DB::select('select * from categories where parent_id IS NOT NULL');
                                                                    // dd($allcategories3);
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
                                                        <livewire:tag >
                                                    </div>

                                                </div>

                                            </div>
                                            <div class="modal-footer no-bd">
                                                <button type="submit" id="addRowButton" class="btn btn-primary" >Add</button>
                                                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                                            </div>
                                    </form>
                                    </div>
                                </div>
                            </div>

                            <div class="table-responsive">
                                <table id="add-row" class="display table table-striped table-hover" >
                                    <thead>
                                        <tr>
                                            <th>Image</th>
                                            <th>Feature</th>
                                            <th>Name</th>
                                            <th>Description</th>
                                            <th>Price</th>
                                            <th style="width: 10%">Action</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th WIDTH="100">Image</th>
                                            <th WIDTH="10">Feature</th>
                                            <th WIDTH="200">Name</th>
                                            <th>Description</th>
                                            <th WIDTH="150">Price</th>
                                            <th WIDTH="100">Action</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>

                                        {{-- Product Content --}}
                                        @foreach ($products as $product)
                                            <tr>
                                                <td class="demo">
                                                    @php
                                                        $cover  = $product->cover_img;
                                                        $cover = substr($cover, 1);
                                                        $cover = substr($cover, 1);
                                                        $cover = substr_replace($cover ,"",-1);
                                                        $cover = substr_replace($cover ,"",-1);
                                                    @endphp

                                                        <div class="avatar">
                                                            <img src="{{asset('storage/uploads/'.$product->shop->user->id.'/cache/'.$cover)}}" alt="..." class="avatar-img rounded">
                                                        </div>

                                                </td>
                                                <td>
                                                    <form action="{{route('product.update')}}" method="post" enctype="multipart/form-data">
                                                        @csrf
                                                        <div class="form-button-action">

                                                               <input class="form-check-input" type="hidden" name="id" value="{{$product->id}}">

                                                               @if(!$product->featured)
                                                                    <input class="form-check-input" type="hidden" name="featured" value=1>
                                                                    <button type="submit"  style="color: grey" class="btn btn-link  btn-lg"  title="Set Featured" >
                                                                        <i class="far fa-thumbs-up"></i>
                                                                    </button>
                                                               @else
                                                                    <input class="form-check-input" type="hidden" name="featured" value=0>
                                                                    <button type="submit"   class="btn btn-link btn-success btn-lg" title="Remove from featured">
                                                                        <i class="far fa-thumbs-up"></i>
                                                                    </button>
                                                               @endif









                                                        </div>
                                                    </form>
                                                </td>
                                                <td><a href="{{route('home.product', $product->id)}}">{{$product->name}}</td>
                                                <td>{{$product->description}}</td>
                                                <td>$ {{$product->price}}</td>
                                                <td>
                                                    <div class="form-button-action">
                                                        <a href="{{route('product.edit',$product->id)}}">
                                                        <button type="button"   class="btn btn-link btn-primary btn-lg" title="Edit Product">
                                                            <i class="fa fa-edit"></i>
                                                        </button>
                                                        </a>
                                                        <a href="{{route('product.delete',$product->id)}}">
                                                            <button type="button"  data-toggle="tooltip" title="" class="btn btn-link btn-danger" data-original-title="Remove">
                                                                <i class="fa fa-times"></i>
                                                            </button>
                                                        </a>
                                                    </div>
                                                </td>
                                            </tr>



                                        @endforeach

                                    </tbody>
                                </table>
                                <div class="col-md-12">
                                    <div class="card card-warning card-outline">

                                      <!-- /.card-header -->


                                      <!-- /.card-footer -->
                                    </div>
                                    <!-- /.card -->
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-4">
                        {!! $products->onEachSide(2)->links() !!}
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
</x-admin>
