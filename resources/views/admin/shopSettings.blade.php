<x-admin>

    <x-slot name="content">
        <div class="row">

            <div class="col-md-8 mt-4 ml-auto mr-auto">
                <div class=" full-height">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-header">
                                    <div class="card-title">Edit Your Shop</div>

                                </div>
                                @if ($message = Session::get('success'))
                                    <div class="alert alert-success">
                                        <strong>{{ $message }}</strong>
                                    </div>
                                @endif
                                <form action="{{route('shop.update')}}" method="post" enctype="multipart/form-data">
                                    @csrf
                                    <div class="card-body">
                                        <div class="row">

                                            <div class="col-md-6 col-lg-6">
                                                <label class="mt-3 mb-3"><b>Shop Details</b></label>
                                                <div class="form-group form-floating-label">
                                                    <input id="inputFloatingLabel" type="text" name="name" class="form-control input-border-bottom" value="{{$shop->name}}"   required>
                                                    <label for="inputFloatingLabel" class="placeholder">Shop Name</label>
                                                </div>
                                                <div class="form-group form-floating-label">
                                                    <input id="inputFloatingLabel2" type="text" name="address" class="form-control input-border-bottom" value="{{$shop->address}}"  required>
                                                    <label for="inputFloatingLabel2" class="placeholder">Physical Address</label>
                                                </div>
                                                <label class="mt-3 mb-3"><b>Set Shop Location</b></label>
                                                <p>Don't know your location? Click <a href="https://www.google.com/maps" target="_blank">here</a> to find your shop longitude and latitude.</p>
                                                <div class="form-group form-group-default">
                                                    <label>longitude</label>
                                                    <input id="addOffice" name="long" type="number" step="any" class="form-control" value="{{$shop->longitude}}" required>
                                                </div>
                                                <div class="form-group form-group-default">
                                                    <label>latitude</label>
                                                    <input id="addOffice" name="lat" type="number" step="any" class="form-control" value="{{$shop->latitude}}" required>
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-lg-6">
                                                <div class="form-group">
                                                    <label for="exampleFormControlFile1">Shop Image</label>
                                                    <input type="file" class="form-control-file" name="display_image[]" id="exampleFormControlFile1">
                                                </div>
                                                <div class="form-group">
                                                    <label for="exampleFormControlFile1">Cover Image</label>
                                                    <input type="file" class="form-control-file" name="cover_image[]" id="exampleFormControlFile1">
                                                </div>
                                                <div class="form-group">
                                                    <label>Shop Description</label>
                                                    <div class="input-group">
                                                        <input class="form-control" name="description" value="{{$shop->description}}"  aria-label="With textarea"></textarea>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="form-check-label">
                                                        <input class="form-check-input" name="terms" type="checkbox" value="1" required>
                                                        <span class="form-check-sign">Agree with terms and conditions</span>
                                                    </label>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                    <div class="card-action">
                                        <button class="btn btn-success" type="submit">Submit</button>
                                        <a href="{{route('home.home')}}"><span class="btn btn-warning">Cancel</span></a>
                                    </div>
                                </form>
                            </div>
                            <div class="card-action">

                                <p>This action is irreversible. All shop data will be permanently lost.</p>
                                <a href="{{route('shop.delete')}}"><button class="btn btn-danger">Delete Shop</button></a>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </x-slot>
</x-admin>
