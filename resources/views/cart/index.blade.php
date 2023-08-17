<x-home>
    <x-slot name="content">


        <div class="row">

            <div class="col-md-8 mt-4 ml-auto mr-auto">
                <div class=" full-height">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-header">
                                    <div class="card-title" style="color:rgb(214, 140, 3)"><h1>Cart Items</h1></div>
                                </div>



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
                                      <!-- /.col -->
                                    </div>
                                    <!-- /.row -->

                                    <!-- Table row -->



                                        <livewire:cart />
                                      <!-- /.col -->

                                    <!-- /.row -->

                                    <p class="lead">
                                        <a href="{{route('cart.index')}}">
                                        <button type="button" class="btn btn-link">
                                            <i class="fas fa-redo"></i>Refresh
                                        </button>
                                        </a>

                                    </p>
                                    <div class="row">
                                      <!-- accepted payments column -->

                                      <!-- /.col -->
                                      <div class="col-6">
                                        <p class="lead">Amount Due</p>

                                        <div class="table-responsive">
                                          <table class="table">
                                            <tr>
                                              <th style="width:50%">Subtotal:</th>
                                              <td>${{Cart::getSubTotal()}}</td>
                                            </tr>
                                            {{-- <tr>
                                              <th>Tax (9.3%)</th>
                                              <td>$10.34</td>
                                            </tr>
                                            <tr>
                                              <th>Shipping:</th>
                                              <td>$5.80</td>
                                            </tr> --}}
                                            <tr>
                                              <th>Total:</th>
                                              <td>${{Cart::getTotal()}}</td>
                                            </tr>
                                          </table>
                                        </div>
                                      </div>
                                      <!-- /.col -->
                                    </div>
                                    <!-- /.row -->

                                    <!-- this row will not appear when printing -->
                                    <div class="row no-print">
                                      <div class="col-12">
                                          @if(Cart::getSubTotal())
                                        <a href="{{route('order.deliveries')}}">
                                        <button type="button" class="btn btn-success float-right"><i class="far fa-credit-card"></i> Proceed
                                        </button></a>
                                        @endif
                                        <a href="{{route('home.home')}}">
                                            <button type="button" class="btn btn-info float-right" style="margin-right: 5px;">
                                            <i class="fas fa-home"></i> Back To Home
                                            </button>
                                        </a>
                                      </div>
                                    </div>
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
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </x-slot>



</x-home>
