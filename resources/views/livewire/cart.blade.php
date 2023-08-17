<div>
    <div class="row">
    {{-- Because she competes with no one, no one can compete with her. --}}
    <div class="col-12 table-responsive">
        <table class="table table-striped">
            <thead>
            <tr>
                <th>Qty</th>
                <th>Product</th>
                <th>Specifications<br><small class="text-muted">Color,Size</small></th>
                <th>Unit Price</th>
                <th>Price</th>
                <th style="width: 10%"></th>
            </tr>
            </thead>
            <tbody>
                {{-- {{dd($allcartitems)}} --}}
            @foreach ($allcartitems as $item )
                <tr>
                    <td>
                        <livewire:cartform :item="$item">

                    </td>


                <td>{{$item->name}}</td>
                <td>
                    <i class="fas fa-clone" style="color: {{$item->attributes->color ?? '#ffffff00'}}"></i> {{strtoupper($item->attributes->size)}} {{strtoupper($item->attributes->numbersize)}}

                </td>
                <td>${{$item->price}}</td>
                <td>${{$item->price*$item->quantity}}</td>
                <td>
                    <div class="form-button-action">

                        <a href="{{route('cart.delete',$item->associatedModel->id)}}">
                            <button type="submit"  title="" class="btn btn-link btn-danger" title="Remove">
                                <i class="fa fa-times"></i>
                            </button>
                        </a>
                    </div>
                </td>
            </tr>
            @endforeach


            </tbody>
        </table>
      </div>
    </div>
</div>
