<x-home>
    <x-slot name="content">


        <div class="row">

            <div class="col-md-8 mt-4 ml-auto mr-auto">
                <div class=" full-height">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-header">
                                    <div class="card-title" style="color:rgb(214, 140, 3)"><h1>Please Select Pick Up Point </h1></div>
                                </div>

                                <div class="invoice p-3 mb-3">
                                    <form action="{{route('order.payment')}}" method="get">
                                        <div class=" ">
                                            <p class="lead">Select a pickup point close to you 😊🤔</p>

                                            <div class="table-responsive">
                                                <div class="form-group form-floating-label">
                                                    <select class="form-control input-border-bottom" id="selectFloatingLabel" required name="pickup">
                                                        <option value="">&nbsp;</option>
                                                        @foreach ($pickups as $pickup )
                                                            <option value="{{$pickup->id}}">{{$pickup->name}}</option>
                                                        @endforeach
                                                    </select>
                                                    <label for="selectFloatingLabel" class="placeholder">Select Pickup Point</label>
                                                </div>

                                            </div>
                                        </div>

                                        <div class="row">

                                        <div class="col-6 mt-4">
                                            <p class="lead">Pickup Fee</p>

                                            <div class="table-responsive">
                                            <table class="table">
                                                <tr>
                                                <th style="width:50%">Fee:</th>
                                                <td>$99 ZWL</td>
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
                                            {{-- <a href="invoice-print.html" target="_blank" class="btn btn-default"><i class="fas fa-print"></i> Print</a> --}}
                                            <button type="submit" class="btn btn-success float-right"><i class="far fa-credit-card"></i> Proceed
                                            </button>
                                            <a href="{{route('cart.index')}}">
                                                <button type="button" class="btn btn-info float-right" style="margin-right: 5px;">
                                                <i class="fas fa-home"></i> Back To Cart
                                                </button>
                                            </a>
                                        </div>
                                        </div>
                                    </form>
                                  </div>
                                  <div class=" p-2 invoice-col">
                                    Please note, payments for the products ordered are made on pickup. You will only be charged for the pickup fee after proceeding.
                                    This pickup fee serves as a commitment on your part for the products you have ordered. This helps us prevent fake orders and support
                                    the Kamusika team. This pick up fee is non refundable.<br>
                                    After proceeding you products will be ready for pickup after 1-4 days.
                                    We will notify you when it is ready.
                                    Visit <a href="#">Orders Info</a> for more information.<br>Thank you.

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
