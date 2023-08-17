<x-home>
    <x-slot name="content">
        <div class="row">

            <div class="col-md-6 mt-4 ml-auto mr-auto">
                <div class=" full-height">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-header">
                                    <div class="card-title">Add Funds </div>
                                </div>
                                <form action="{{route('wallet.pay')}}" method="post" enctype="multipart/form-data">
                                    @csrf
                                    <div class="card-body">
                                        <div class="row">

                                            <div class="col-md-12 col-lg-12">
                                                <label class="mt-3 mb-3"><b>Account Holder: {{Auth::user()->name}}</b></label>

                                                <div class="form-group">
                                                    <label for="InfoInput">Amount To Add:  </label>
                                                    <div class="input-group mb-3">
                                                        <div class="input-group-prepend">
                                                            <span class="input-group-text" id="basic-addon1"><b>ZWL</b></span>
                                                        </div>
                                                        <input type="number" class="form-control" name="amount" placeholder="minimum $300" aria-label="Username" aria-describedby="basic-addon1">
                                                    </div>
                                                </div>
                                                {{-- <div class="form-group">
                                                    <label for="InfoInput">Do you have a voucher ?  </label>
                                                    <div class="input-group mb-3">
                                                        <div class="input-group-prepend">
                                                            <span class="input-group-text" id="basic-addon1"><b>Gift card number:</b></span>
                                                        </div>
                                                        <input type="number" class="form-control" name="amount" placeholder="minimum $300" aria-label="Username" aria-describedby="basic-addon1">
                                                    </div>
                                                </div> --}}
                                            </div>

                                        </div>
                                    </div>
                                    <div class="card-action">
                                        <button class="btn btn-success" type="submit">Make Payment</button>
                                        <a href="{{route('home.home')}}"><button class="btn btn-danger">Cancel</button></a>
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
