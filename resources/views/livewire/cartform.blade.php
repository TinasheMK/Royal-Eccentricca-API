<div>


        <small style="text-align: center">

            <form wire:submit.prevent="upcart">
                <button type="submit" class="btn btn-link" style=" padding: 0;">
                    <i class="fas fa-angle-up"></i><br>
                </button>

            </form>
            <form >
                <button  class="btn " style=" padding: 0;">
                    {{$quantity}}<br>
                </button>

            </form>





            <form wire:submit.prevent="downcart" >
                <button type="submit" class="btn btn-link" style=" padding: 0;">
                    <i class="fas fa-angle-down"></i>

                </button>

            </form>

        </small>





</div>
