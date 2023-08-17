<x-shop>

    <x-slot name="content">
        <div class="row">

            <div class="col-md-8 mt-4 ml-auto mr-auto">
                <div class=" full-height">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-header">
                                    <div class="card-title">Confirm Shop Deletion</div>
                                    <p>We hate to see you go. We hope to see you next time bye. 👋</p>
                                    
                                </div>
                                
                            </div>
                            <div class="card-action p-2">
                           
                                <p>This action is irreversible. This will delete all your shop data. Are you sure you want to delete your shop.</p>
                                <form action="{{route('shop.update')}}" method="post" enctype="multipart/form-data">
                                    @csrf
                             
                                    <input type="hidden" name="delete" type="checkbox" value="1">
                                                                  
                                    <button class="btn btn-danger" type="submit">Yes Delete Shop</button>
                                    
                                    <a href="{{route('shop.shop')}}"><span class="btn btn-success">Go Back To Shop</span></a>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </x-slot>
</x-shop>
