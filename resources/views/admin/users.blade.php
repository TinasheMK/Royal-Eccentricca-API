<x-admin>


    <x-slot name="content">
        <div class="page-inner">
            <div class="page-header">
                <h4 class="page-title">Registered Users</h4>
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
                        <a>Users</a>
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


                        <div class="card-body">


                            <div class="table-responsive">
                                <table id="add-row" class="display table table-striped table-hover dataTable" role="grid" aria-describedby="add-row_info">
                                    <thead>
                                        <tr role="row">
                                            <th class="sorting_asc" tabindex="0" aria-controls="add-row" rowspan="1" colspan="1" aria-label="Name: activate to sort column descending" style="width: 301.111px;" aria-sort="ascending">Name
                                            </th>
                                            <th class="sorting" tabindex="0" aria-controls="add-row" rowspan="1" colspan="1" aria-label="Position: activate to sort column ascending" style="width: 429.111px;">Email
                                            </th>
                                            <th class="sorting" tabindex="0" aria-controls="add-row" rowspan="1" colspan="1" aria-label="Position: activate to sort column ascending" style="width: 429.111px;">Position
                                            </th>
                                            <th class="sorting" tabindex="0" aria-controls="add-row" rowspan="1" colspan="1" aria-label="Office: activate to sort column ascending" style="width: 238px;">location
                                            </th>
                                            <!-- <th style="width: 126.889px;" class="sorting" tabindex="0" aria-controls="add-row" rowspan="1" colspan="1" aria-label="Action: activate to sort column ascending">Action</th> -->
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th rowspan="1" colspan="1">Name</th>
                                            <th rowspan="1" colspan="1">Email</th>
                                            <th rowspan="1" colspan="1">City</th>
                                            <th rowspan="1" colspan="1">Date Joined</th>
                                            <!-- <th rowspan="1" colspan="1">Action</th></tr> -->
                                    </tfoot>
                                    <tbody>


                                        @foreach ($users as $user)
                                            @php

                                                if($user->details){
                                                    $lastname = $user->details->lastname;
                                                    $location = $user->details->city;
                                                    $date = $user->created_at;
                                                }
                                                else{
                                                    $lastname = null;
                                                    $location = null;
                                                    $date = null;
                                                }
                                            @endphp
                                            <tr role="row" class="odd">
                                                <td class="sorting_1">{{$user->name}} {{$lastname}}</td>
                                                <td>{{$user->email}}</td>
                                                <td>{{$date}}</td>
                                                <td>{{$location}}</td>
<!--                                                                    <td>
                                                    <div class="form-button-action">
                                                        <button type="button" data-toggle="tooltip" title="" class="btn btn-link btn-primary btn-lg" data-original-title="Edit Task">
                                                            <i class="fa fa-edit"></i>
                                                        </button>
                                                        <button type="button" data-toggle="tooltip" title="" class="btn btn-link btn-danger" data-original-title="Remove">
                                                            <i class="fa fa-times"></i>
                                                        </button>
                                                    </div>
                                                </td> -->
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
                        {!! $users->onEachSide(2)->links() !!}
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
