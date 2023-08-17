<div>
    @foreach ($comments as $comment )
        <div class="item-list">

            <div class="info-user ml-3">
                <div class=""><p>{{$comment->user->name}}: {{$comment->comment}}</p></div>


                    <div class="status"></div>


            </div>
        </div>
    @endforeach

</div>


