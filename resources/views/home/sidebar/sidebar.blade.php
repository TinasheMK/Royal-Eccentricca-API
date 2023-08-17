<div class="sidebar sidebar-style-2">
    <div class="sidebar-wrapper scrollbar scrollbar-inner">
        <div class="sidebar-content">
            <div class="user">
                {{-- <div class="avatar-sm float-left mr-2">
                    <img src="../assets/img/profile.jpg" alt="..." class="avatar-img rounded-circle">
                </div> --}}
                {{-- <div class="info">
                    <a data-toggle="collapse" href="#collapseExample" aria-expanded="true">
                        <span>
                            Hizrian
                            <span class="user-level">Administrator</span>
                            <span class="caret"></span>
                        </span>
                    </a>
                    <div class="clearfix"></div>

                    <div class="collapse in" id="collapseExample">
                        <ul class="nav">
                            <li>
                                <a href="#profile">
                                    <span class="link-collapse">My Profile</span>
                                </a>
                            </li>
                            <li>
                                <a href="#edit">
                                    <span class="link-collapse">Edit Profile</span>
                                </a>
                            </li>
                            <li>
                                <a href="#settings">
                                    <span class="link-collapse">Settings</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div> --}}
            </div>
            <ul class="nav nav-primary">
                <li class="nav-item">
                    <a data-toggle="collapse" href="#dashboard" class="collapsed" aria-expanded="false">
                        <i class="fas fa-home"></i>
                        <p>Main Menu</p>
                        <span class="caret"></span>
                    </a>
                    <div class="collapse" id="dashboard">
                        <ul class="nav nav-collapse">
                            <li>
                                <a href="{{route('home.home')}}">
                                    <span class="sub-item">Home</span>
                                </a>
                            </li>
                            <li>
                                <a href="{{route('home.explore')}}">
                                    <span class="sub-item">Explore</span>
                                </a>
                            </li>
                            <li>
                                <a href="{{route('shops')}}">
                                    <span class="sub-item">Shops</span>
                                </a>
                            </li>
                            <li>
                                <a href="{{route('notifications')}}">
                                    <span class="sub-item">Notifications</span>
                                </a>
                            </li>
                            <li>
                                <a href="{{route('subscriptions')}}">
                                    <span class="sub-item">Subscriptions</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </li>
                <li class="nav-item active submenu">
                    <a data-toggle="collapse" href="#sidebarLayouts">
                        <i class="fas fa-th-list"></i>
                        <p>Categories</p>
                        <span class="caret"></span>
                    </a>
                    <div class="collapse " id="sidebarLayouts">
                        <ul class="nav nav-collapse">
                            @php
                                $allcategories3 = DB::select('select * from categories where parent_id IS NULL');
                            @endphp
                            @foreach ( $allcategories3 as $category )
                                @if($category->menu)
                                    <li class="nav-item">
                                        <a data-toggle="collapse" href="#submenu{{$category->id}}" style="overflow: auto">
                                            <p>{{$category->name}}</p>
                                            <span class="caret"></span>
                                        </a>
                                        <div class="collapse" id="submenu{{$category->id}}">
                                            <ul class="nav nav-collapse">
                                                @php
                                                    $children = DB::select('select * from categories where parent_id = :id', ['id' => $category->id]);
                                                @endphp
                                                @foreach ($children as $child)
                                                    <li>
                                                        <a  href="{{route('home.category', $child->id)}}">
                                                            <span class="sub-item">{{$child->name}}</span>
                                                            {{-- <span class="caret"></span> --}}
                                                        </a>
                                                    </li>
                                                @endforeach
                                            </ul>
                                        </div>
                                    </li>
                                @endif
                            @endforeach


                        </ul>
                    </div>
                </li>
            </ul>

            <ul class="nav nav-primary">
                <li class="nav-item">

                    <a  href="{{route('cart.index')}}" class="collapsed" aria-expanded="false">
                        <i class="fas fa-shopping-cart "></i>
                    <p>Cart</p>

                    </a>

                </li>
                <li class="nav-item">

                        <a  href="{{route('wishlist.index')}}" class="collapsed" aria-expanded="false">
                            <i class="fas fa-heart"></i>
                        <p>Wishlist</p>

                        </a>

                </li>
                <li class="nav-item">
                    @auth

                    @php
                        $shop = DB::select('select * from shops where user_id = :id', ['id'=> Auth::user()->id]);
                        // dd($shop);
                    @endphp

                    @if ($shop)
                        <a  href="{{route('shop.shop')}}" class="collapsed" aria-expanded="false">
                            <i class="fas fa-home"></i>
                        <p>My Shop</p>

                        </a>
                    @else
                        <a  href="{{route('shop.open')}}" class="collapsed" aria-expanded="false">
                            <i class="fas fa-home"></i>
                        <p>Open Shop</p>

                        </a>
                    @endif



                    @endauth
                </li>
                <li class="nav-item">

                        <a  href="{{route('wishlist.index')}}" class="collapsed" aria-expanded="false">

                        <p>Learn More</p>

                        </a>

                </li>
                <li class="nav-item">

                        <a  href="{{route('wishlist.index')}}" class="collapsed" aria-expanded="false">

                        <p>Feedback</p>

                        </a>

                </li>
                <li class="nav-item">

                        <a  href="{{route('wishlist.index')}}" class="collapsed" aria-expanded="false">

                        <p>Contact Support</p>

                        </a>

                </li>
            </ul>
        </div>
    </div>
</div>
