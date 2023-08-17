<x-shop>


    <x-slot name="content">
    <!-- Bootstrap Color Picker -->
    <link rel="stylesheet" href="{{asset('assets/bootstrap-colorpicker/css/bootstrap-colorpicker.min.css') }}">


    <script src="{{asset('assets/tom-select-master/dist/js/tom-select.complete.js')}}"></script>
    <link rel="stylesheet" href="{{asset('assets/tom-select-master/dist/css/tom-select.bootstrap4.css')}}" >

    <style>
        .ts-control .option .title {
            display: block;
        }
        .ts-control .option .url {
            font-size: 12px;
            display: block;
            color: #a0a0a0;
        }
        .ts-control .item a {
            color: #006ef5;
        }
        .ts-control .item.active a {
            color: #303030;
        }
    </style>

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
                                {{-- <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button> --}}
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
                                        <div class="col-md-4">
                                            <div class="form-group form-group-default">
                                                <label>Price</label>
                                                <div class="input-group ">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text mr-2" id="basic-addon1">$</span>
                                                </div>
                                                <input type="text" class="form-control" name="price" type="number" step="any" value="{{$product->price}}" required">                                                </div>
                                            </div>
                                        </div>

                                        {{-- <div class="col-md-4">
                                            <div class="form-group form-group-default">
                                                <label>Sale Price</label>
                                                <input id="addOffice" name="price" type="number" step="any" class="form-control" value="{{$product->price}}" required>
                                            </div>
                                        </div> --}}
                                        <div class="col-md-4">
                                            <div class="form-group form-group-default">
                                                <label>Available Stock</label>
                                                <input id="addOffice" name="stock" type="number" step="any" class="form-control" value="{{$product->status}}" required>
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="card-body card-warning">
                                                <label>A more detailed description with specifications.</label>
                                                <div class="form-group" >
                                                    <textarea id="compose-textarea" name="full_specs" class="form-control" style="height: 300px">
                                                        {!! html_entity_decode($product->full_specs) !!}
                                                    </textarea>
                                                </div>

                                              </div>
                                        </div>
                                        <div class="col-6">
                                            <div class="form-group">
                                                <label for="exampleFormControlFile1">Image</label>
                                                <input type="file" class="form-control-file" name="image[]" id="exampleFormControlFile1"  multiple="multiple" >
                                            </div>
                                        </div>
                                        <div class="col-6">
                                            <div class="form-group">
                                                <label for="exampleFormControlFile1">More Images (Optional)</label>
                                                <input type="file" class="form-control-file" name="images[]" id="exampleFormControlFile1"  multiple="multiple" >
                                            </div>
                                        </div>



                                        <div class="col-md-12 mt-4">
                                            <div class="">
                                                <div class="">
                                                        <div class="row">
                                                            <div class="col-12 ">
                                                            <ul class="nav nav-pills nav-warning nav-pills-no-bd" id="pills-tab-without-border" role="tablist">
                                                                <li class="nav-item">
                                                                    <a class="nav-link active" id="v-pills-home-tab-nobd" data-toggle="pill" href="#v-pills-home-nobd" role="tab" aria-controls="v-pills-home-nobd" aria-selected="true">Categorisation</a>
                                                                </li>
                                                                <li class="nav-item">
                                                                    <a class="nav-link" id="v-pills-profile-tab-nobd" data-toggle="pill" href="#v-pills-profile-nobd" role="tab" aria-controls="v-pills-profile-nobd" aria-selected="false">Attributes</a>
                                                                </li>
                                                            </ul>
                                                        </div>
                                                        <div class="col-12">
                                                            <div class="tab-content" id="v-pills-without-border-tabContent">
                                                                <div class="tab-pane fade show active" id="v-pills-home-nobd" role="tabpanel" aria-labelledby="v-pills-home-tab-nobd">
                                                                    <div class="col-sm-12">
                                                                        <div class="form-group">
                                                                            <label for="largeSelect">Select Category</label>
                                                                            <select id="select-state" name="categories[]" multiple placeholder="Select categories (max 3)..." autocomplete="off">

                                                                                @foreach($product->category as $c)

                                                                                    <option value="{{$c->id}}" selected>{{$c->name}}</option>

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


                                                                    {{-- Tags input with tom select editor --}}
                                                                    @php
                                                                        $ts = [];
                                                                        $tags  = $product->tags;
                                                                        foreach ($tags as $t) {
                                                                            // dd($t);
                                                                            array_push($ts, $t->name);
                                                                        }
                                                                        $j=implode(',',$ts);
                                                                    @endphp
                                                                    <div class="col-md-12">
                                                                        <div class="form-group ">
                                                                            <label>Tags</label>
                                                                            <input id="input-tags" value="{{$j}}" name="tags[]" autocomplete="off"  multiple placeholder="Enter a comma after each tag.">
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="tab-pane fade" id="v-pills-profile-nobd" role="tabpanel" aria-labelledby="v-pills-profile-tab-nobd">
                                                                    <div class="col-sm-12">
                                                                        <div class="form-group">
                                                                            <label for="largeSelect">Select Attributes</label>
                                                                                @php
                                                                                $ats = [];
                                                                                $atribs = $product->attributes;

                                                                                foreach ($atribs as $a) {
                                                                                    array_push($ats, $a->name);
                                                                                }


                                                                                @endphp


                                                                                @foreach ( $attributes as $attribute )
                                                                                    @php
                                                                                        $atname = strtolower($attribute->name);
                                                                                    @endphp
                                                                                    <div class="form-check">

                                                                                        @php
                                                                                            if (in_array($attribute->name,$ats)){
                                                                                                $checked = 'checked';
                                                                                            }
                                                                                            else{
                                                                                                $checked = '';
                                                                                            }
                                                                                            $color1 ='';
                                                                                            $color2 ='';
                                                                                            $color3 ='';
                                                                                            $color4 ='';
                                                                                            $color5 ='';
                                                                                            $color6 ='';

                                                                                            $checked1 ='';
                                                                                            $checked2 ='';
                                                                                            $checked3 ='';
                                                                                            $checked4 ='';

                                                                                        @endphp


                                                                                            @if($atname=='color')
                                                                                            <input type="hidden"   name='colorid' value="{{$attribute->id}}" class="form-control">
                                                                                                <div class="form-group">
                                                                                                    <label>Set product colors if applicable:</label>
                                                                                                    <div class="row">
                                                                                                        @foreach ($product->values as $v )

                                                                                                            @if ($v->attribute_id == $attribute->id)
                                                                                                                @php
                                                                                                                    $colors= explode(',',$v->value);
                                                                                                                    $color1 ='';
                                                                                                                    $color2 ='';
                                                                                                                    $color3 ='';
                                                                                                                    $color4 ='';
                                                                                                                    $color5 ='';
                                                                                                                    $color6 ='';
                                                                                                                    $var =0;
                                                                                                                    foreach ($colors as $c) {
                                                                                                                        if($var==0){
                                                                                                                            $color1 =$c;
                                                                                                                        }
                                                                                                                        if($var==1){
                                                                                                                            $color2 =$c;
                                                                                                                        }
                                                                                                                        if($var==2){
                                                                                                                            $color3 =$c;
                                                                                                                        }
                                                                                                                        if($var==3){
                                                                                                                            $color4 =$c;
                                                                                                                        }
                                                                                                                        if($var==4){
                                                                                                                            $color5 =$c;
                                                                                                                        }
                                                                                                                        if($var==5){
                                                                                                                            $color6 =$c;
                                                                                                                        }
                                                                                                                        $var+=1;
                                                                                                                    }

                                                                                                                @endphp

                                                                                                            @endif

                                                                                                        @endforeach
                                                                                                        <div class="col-md-4 input-group my-colorpicker1">
                                                                                                            <label class="mr-3">1</label>
                                                                                                            <input type="text"  value="{{$color1}}" name='color1' class="form-control">

                                                                                                            <div class="input-group-append">
                                                                                                                <span class="input-group-text"><i class="fas fa-square" style="color:{{$color1 ?? ''}}"></i></span>
                                                                                                            </div>
                                                                                                        </div>
                                                                                                        <div class="col-md-4 input-group my-colorpicker2">
                                                                                                            <label class="mr-3">2</label>
                                                                                                            <input type="text" value="{{$color2 ?? ''}}" name='color2' class="form-control">

                                                                                                            <div class="input-group-append">
                                                                                                                <span class="input-group-text"><i class="fas fa-square" style="color:{{$color2 ?? ''}}"></i></span>
                                                                                                            </div>
                                                                                                        </div>
                                                                                                        <div class="col-md-4 input-group my-colorpicker3">
                                                                                                            <label class="mr-3">3</label>
                                                                                                            <input type="text" value="{{$color3 ?? ''}}" name='color3' class="form-control">

                                                                                                            <div class="input-group-append">
                                                                                                                <span class="input-group-text"><i class="fas fa-square" style="color:{{$color3 ?? ''}}"></i></span>
                                                                                                            </div>
                                                                                                        </div>
                                                                                                        <div class="col-md-4 input-group my-colorpicker4">
                                                                                                            <label class="mr-3">4</label>
                                                                                                            <input type="text" value="{{$color4 ?? ''}}" name='color4' class="form-control">

                                                                                                            <div class="input-group-append">
                                                                                                                <span class="input-group-text"><i class="fas fa-square" style="color:{{$color4 ?? ''}}"></i></span>
                                                                                                            </div>
                                                                                                        </div>
                                                                                                        <div class="col-md-4 input-group my-colorpicker5">
                                                                                                            <label class="mr-3">5</label>
                                                                                                            <input type="text" value="{{$color5 ?? ''}}" name='color5' class="form-control">

                                                                                                            <div class="input-group-append">
                                                                                                                <span class="input-group-text"><i class="fas fa-square" style="color:{{$color5 ?? ''}}"></i></span>
                                                                                                            </div>
                                                                                                        </div>
                                                                                                        <div class="col-md-4 input-group my-colorpicker6">
                                                                                                            <label class="mr-3">6</label>
                                                                                                            <input type="text" value="{{$color6 ?? ''}}" name='color6' class="form-control">

                                                                                                            <div class="input-group-append">
                                                                                                                <span class="input-group-text"><i class="fas fa-square" style="color:{{$color6 ?? ''}}"></i></span>
                                                                                                            </div>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                    <!-- /.input group -->
                                                                                                </div>
                                                                                            @endif
                                                                                            @if($atname=='size')
                                                                                            <input type="hidden"   name='sizeid' value="{{$attribute->id}}" class="form-control">
                                                                                                <div class="form-group">
                                                                                                    <label>Let users pick from general sizes. Set the available sizes if applicable: </label>
                                                                                                    <div class="form-group">
                                                                                                        <div class="selectgroup selectgroup-pills">
                                                                                                            @foreach ($product->values as $v )

                                                                                                                @if ($v->attribute_id == $attribute->id)
                                                                                                                    @php
                                                                                                                        $sizes = explode(',',$v->value);
                                                                                                                        $checked1 ='';
                                                                                                                        $checked2 ='';
                                                                                                                        $checked3 ='';
                                                                                                                        $checked4 ='';
                                                                                                                        if ( in_array('s',$sizes)){
                                                                                                                            $checked1 = 'checked';
                                                                                                                        }
                                                                                                                        if ( in_array('m',$sizes)){
                                                                                                                            $checked2 = 'checked';
                                                                                                                        }
                                                                                                                        if ( in_array('l',$sizes)){
                                                                                                                            $checked3 = 'checked';
                                                                                                                        }
                                                                                                                        if ( in_array('xl',$sizes)){
                                                                                                                            $checked4 = 'checked';
                                                                                                                        }
                                                                                                                    @endphp

                                                                                                                @endif

                                                                                                            @endforeach

                                                                                                            <label class="selectgroup-item">
                                                                                                                <input type="checkbox" name="sizes" value="s" class="selectgroup-input" {{$checked1}}>
                                                                                                                <span class="selectgroup-button">S</span>
                                                                                                            </label>
                                                                                                            <label class="selectgroup-item">
                                                                                                                <input type="checkbox" name="sizem" value="m" class="selectgroup-input" {{$checked2}}>
                                                                                                                <span class="selectgroup-button">M</span>
                                                                                                            </label>
                                                                                                            <label class="selectgroup-item">
                                                                                                                <input type="checkbox" name="sizel" value="l" class="selectgroup-input" {{$checked3}}>
                                                                                                                <span class="selectgroup-button">L</span>
                                                                                                            </label>
                                                                                                            <label class="selectgroup-item">
                                                                                                                <input type="checkbox" name="sizexl" value="xl" class="selectgroup-input" {{$checked4}}>
                                                                                                                <span class="selectgroup-button">XL</span>
                                                                                                            </label>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                    <!-- /.input group -->
                                                                                                </div>
                                                                                            @endif
                                                                                            @if($atname=='numbersize')
                                                                                            <input type="hidden"   name='numbersizeid' value="{{$attribute->id}}" class="form-control">
                                                                                                <div class="form-group">
                                                                                                    <label>Allow user to specify size as number. </label>
                                                                                                </div>
                                                                                                @foreach ($product->values as $v )

                                                                                                    @if ($v->attribute_id == $attribute->id)
                                                                                                        @php
                                                                                                            $numsizes = $v->value;
                                                                                                        @endphp
                                                                                                    @endif
                                                                                                @endforeach
                                                                                                <div class="col-md-12">
                                                                                                    <div class="form-group ">
                                                                                                        <label>Enter the available sizes. Enter comma after each size.</label>
                                                                                                        <input id="input-sizes" value="{{$numsizes ?? '0'}}" name="numbersize" autocomplete="off"  multiple placeholder="Enter a comma after each size.">
                                                                                                    </div>
                                                                                                </div>
                                                                                            @endif

                                                                                            <div class="form-check">
                                                                                                <label class="form-check-label">
                                                                                                    <input class="form-check-input" type="checkbox" name="{{'att'.$attribute->id}}" value="{{$attribute->id}}" {{$checked}}>
                                                                                                    <span class="form-check-sign">{{$attribute->name}}</span>
                                                                                                </label>
                                                                                            </div>


                                                                                    </div>
                                                                                @endforeach

                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>


                                    </div>
                                </div>
                                <div class="modal-footer no-bd">
                                    <button type="submit" id="addRowButton" class="btn btn-success">Save</button>
                                    <a href="{{route('shop.products')}}" class="btn btn-danger">Close</a>
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
        new TomSelect("#input-tags",{
            plugins: ['remove_button'],
            persist: false,
            createOnBlur: true,
            create: true
        });
    </script>
    <script>
        new TomSelect("#input-sizes",{
            plugins: ['remove_button'],
            persist: false,
            createOnBlur: true,
            create: true
        });
    </script>
    <script>
        new TomSelect("#select-state",{
            plugins: ['remove_button'],
            maxItems: 3
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
    <script src="{{asset('assets/js/core/jquery.min.js')}}"></script>







    </x-slot>
    <x-slot name="js">
        <!-- bootstrap color picker -->
        <script src="{{asset('assets/bootstrap-colorpicker/js/bootstrap-colorpicker.min.js')}}"></script>

        <script>
        $(function () {
            //color picker with addon
            $('.my-colorpicker1').colorpicker()

            $('.my-colorpicker1').on('colorpickerChange', function(event) {
            $('.my-colorpicker1 .fa-square').css('color', event.color.toString());
            });



            //color picker with addon
            $('.my-colorpicker2').colorpicker()

            $('.my-colorpicker2').on('colorpickerChange', function(event) {
            $('.my-colorpicker2 .fa-square').css('color', event.color.toString());
            });

            //color picker with addon
            $('.my-colorpicker3').colorpicker()

            $('.my-colorpicker3').on('colorpickerChange', function(event) {
            $('.my-colorpicker3 .fa-square').css('color', event.color.toString());
            });



            //color picker with addon
            $('.my-colorpicker4').colorpicker()

            $('.my-colorpicker4').on('colorpickerChange', function(event) {
            $('.my-colorpicker4 .fa-square').css('color', event.color.toString());
            });


            //color picker with addon
            $('.my-colorpicker5').colorpicker()

            $('.my-colorpicker5').on('colorpickerChange', function(event) {
            $('.my-colorpicker5 .fa-square').css('color', event.color.toString());
            });


            //color picker with addon
            $('.my-colorpicker6').colorpicker()

            $('.my-colorpicker6').on('colorpickerChange', function(event) {
            $('.my-colorpicker6 .fa-square').css('color', event.color.toString());
            });



        })
        </script>

    </x-slot>
</x-shop>
