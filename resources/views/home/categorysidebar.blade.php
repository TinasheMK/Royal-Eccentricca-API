
@foreach ($allcategories as $category )
    <li>
        <a href="#"><img alt="" src="assets/img/icon-img/5.png">{{$category->name}} <i class="pe-7s-angle-right"></i></a>
        @php
            $children = DB::select('select * from categories where parent_id = :id', ['id' => $category->id]);
        @endphp

        {{-- @if ($children->isEmpty()) --}}
        <div class="category-menu-dropdown">
            <div class="category-dropdown-style category-common4 mb-40">
                    @foreach ($children as $child)
                        <h4 class="categories-subtitle">{{$child->name}}</h4>
                        @php
                            $grandchild = DB::select('select * from categories where parent_id = :id', ['id' => $child->id]);
                        @endphp
                        {{-- @if ($grandchild->isNotEmpty()) --}}
                            <ul>
                                @foreach ($grandchild as $g)
                                    <li><a href="#"> {{$g->name}}</a></li>
                                @endforeach
                            </ul>
                        {{-- @endif --}}
                    @endforeach
            </div>
            <div class="mega-banner-img">
                <a href="single-product.html">
                    <img src="assets/img/banner/18.jpg" alt="">
                </a>
            </div>
        </div>
        {{-- @endif --}}

    </li>
@endforeach

