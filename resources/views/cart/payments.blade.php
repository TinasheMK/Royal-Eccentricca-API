<x-home>
    <x-slot name="content">


        <div class="row">

            <div class="col-md-12 mt-4 p-4 ml-auto mr-auto">
                <div class=" full-height">
                    <div class="card">
                        <div class=" pl-4 card-header">
                            <div class="card-title pl-4" style="color:rgb(214, 140, 3)"><h1>Checkout</h1></div>
                        </div>
                        <div class="row p-4">
                            <div class="col-lg-7 p-4">





                                    <div class="invoice p-3 mb-3">
                                        <!-- title row -->
                                        <div class="row">
                                        <div class="col-12">
                                            <h4>
                                            <i class="fas fa-globe"></i> Kamusika
                                            <small class="float-right">Date: {{date('Y-m-d')}}</small>
                                            </h4>
                                        </div>
                                        <!-- /.col -->
                                        </div>
                                        <!-- info row -->
                                        <div class="row invoice-info">
                                        <div class="col-sm-4 invoice-col">
                                            From
                                            <address>
                                            <strong>Kamusika Shopping</strong><br>
                                            Phone: +263 777 198 848<br>
                                            Email: info@kamusika.com
                                            </address>
                                        </div>
                                        <!-- /.col -->
                                        <div class="col-sm-4 invoice-col">
                                            To
                                            <address>
                                            <strong>{{Auth::user()->name}}</strong><br>
                                            {{Auth::user()->email}}<br>
                                            </address>
                                        </div>
                                        <!-- /.col -->
                                        <div class="col-sm-4 invoice-col">
                                            {{-- <b>Invoice #007612</b><br> --}}
                                            <b>Delivery Method:</b> Pickup<br>
                                            <b>Pickup Point:</b> {{$pickup->name}}<br>
                                        </div>
                                        <!-- /.col -->
                                        </div>
                                        <!-- /.row -->

                                        <!-- Table row -->



                                            <livewire:cart />
                                        <!-- /.col -->

                                        <!-- /.row -->
                                        <p class="lead mt-4">Order Total Price</p>

                                        <div class="table-responsive">
                                        <table class="table">
                                            <tr>
                                            <th>Total:</th>
                                            <td>${{Cart::getTotal()}}</td>
                                            </tr>
                                        </table>
                                        </div>
                                        <p class="lead">
                                            <a href="{{route('cart.index')}}">
                                            <button type="button" class="btn btn-link">
                                                <i class="fas fa-redo"></i>Refresh
                                            </button>
                                            </a>

                                        </p>

                                        <!-- /.row -->

                                        <!-- this row will not appear when printing -->

                                    </div>

                                    <div class=" p-2 invoice-col">
                                        {{-- Please note, clicking proceed will send your order request to ascociated shops only.
                                        No transaction will be initiated by this action. You may communicate with shops in the
                                        messages panel after proceeding. Payment and shipping arrangements with shops
                                        are made at your own risk. --}}
                                    {{-- <b>Invoice #007612</b><br>
                                    <br>
                                    <b>Order ID:</b> 4F3S8J<br>
                                    <b>Payment Due:</b> 2/22/2014<br>
                                    <b>Account:</b> 968-34567 --}}


                                </div>

                            </div>
                            <div class="col-lg-5 p-4" style="    background-color: rgb(245, 229, 209);">

                                <form action="{{route('order.done')}}" method="post">
                                    @csrf
                                    @php
                                        $user = Auth::user();
                                    @endphp
                                    <p class="lead ">User Details</p>
                                    <div class="form-group has-info">
                                        <label for="InfoInput">Order Description</label>
                                        <input id="notes" class="form-control" type="text" name="notes" value="Default"  />
                                    </div>
                                    <div class="form-group has-info">
                                        <label for="InfoInput">Address</label>
                                        <input id="address" class="form-control" type="text" name="address" value="{{$user->address}}" required autofocus autocomplete="address" />
                                    </div>
                                    <div class="form-group has-info">
                                        <label for="InfoInput">City</label>
                                        <input id="city" class="form-control" type="text" name="city" value="{{$user->city}}" required autofocus autocomplete="city" />
                                    </div>
                                    <div class="form-group has-info">
                                        <label for="InfoInput">Country</label>
                                        <input id="country" class="form-control" type="text" name="country" value="{{$user->country}}" required autofocus autocomplete="coutry" />
                                    </div>
                                    <div class="form-group">
                                        <label for="InfoInput">Phone Number</label>
                                        <div class="input-group mb-3">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text" id="basic-addon1"><b>+</b></span>
                                            </div>
                                            <input type="number" class="form-control" name="phone" value="{{$user->phone}}" aria-label="Username" aria-describedby="basic-addon1" required autofocus autocomplete="number">
                                            <input type="hidden" name="pickup" value="{{$pickup->id}}">
                                        </div>
                                    </div>

                                    <p class="lead mt-4">Amount Due Today</p>

                                    <div class="table-responsive">
                                    <table class="table">
                                        <tr>
                                        <th style="width:50%">Pickup Fee:</th>
                                        <td>$100 ZWL</td>
                                        </tr>
                                    </table>
                                    </div>
                                    <div class="row ">
                                        <div class="col-12">


                                        </div>
                                        <div class="col-12 mt-2">

                                        </div>
                                    </div>
                                    <div class="form-check">
                                        <label class="form-label">Payment Methods</label>
                                        Balance in wallet: ${{Auth::user()->balance}}</p>

                                        <div class="w-100">
                                            <label class="form-radio-label">
                                                <input type="radio" name="method" value="wallet" class="form-radio-input" required checked="">
                                                <span class="form-radio-sign">Kamusika Wallet</span>
                                            </label>
                                            <label class="form-radio-label">
                                                <input type="radio" name="method" value="paynow" class="form-radio-input" >
                                                <span class="form-radio-sign">Ecocash / One-Wallet payout</span>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="row no-print">
                                        <div class="col-12">
                                                <input type="hidden" name="pickup" value="{{$pickup->id}}">
                                                <button type="submit" class="btn btn-success float-right"><i class="far fa-credit-card"></i> Make Payment
                                                </button></a>
                                                <a href="{{route('home.home')}}" type="button" class="btn btn-danger float-right" style="margin-right: 5px;">
                                                    <i class="fas fa-home"></i> Cancel
                                                </a>
                                                </a>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </x-slot>



</x-home>
