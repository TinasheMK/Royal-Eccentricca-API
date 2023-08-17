<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>Shop Backyard | Kamusika</title>
    <meta content='width=device-width, initial-scale=1.0, shrink-to-fit=no' name='viewport' />
    <link rel="icon" href="{{asset('/assets/img/icon.png')}}" type="image/x-icon"/>
    <link rel="stylesheet" href="{{asset('assets/js/summernote/summernote-bs4.css')}}">

    <!-- Fonts and icons -->
    <script src="{{asset('assets/js/plugin/webfont/webfont.min.js')}}"></script>
    <script>
        WebFont.load({
            google: {"families":["Lato:300,400,700,900"]},
            custom: {"families":["Flaticon", "Font Awesome 5 Solid", "Font Awesome 5 Regular", "Font Awesome 5 Brands", "simple-line-icons"], urls: ['../assets/css/fonts.min.css']},
            active: function() {
                sessionStorage.fonts = true;
            }
        });
    </script>
    <link rel="stylesheet" href="{{asset('assets/css/fonts.min.css')}}" media="all">

    <!-- CSS Files -->
    <link rel="stylesheet" href="{{asset('/assets/css/bootstrap.min.css')}}">
    <link rel="stylesheet" href="{{asset('/assets/css/atlantis.min.css')}}">

    <!-- CSS Just for demo purpose, don't include it in your project -->
    <link rel="stylesheet" href="{{asset('/assets/css/demo.css')}}">
</head>
<body>
    <div class="wrapper">
        <div class="main-header">
            <!-- Logo Header -->
            <div class="logo-header" data-background-color="dark">

                <a href="{{route('home.home')}}" class="logo">
                    <img class="card-img-top pb-1 pr-4" style="    max-height: 50px;" src="{{asset('assets/img/logo.svg')}}" alt="Kamusika" class="navbar-brand">
                </a>
                <button class="navbar-toggler sidenav-toggler ml-auto" type="button" data-toggle="collapse" data-target="collapse" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon">
                        <i class="icon-menu"></i>
                    </span>
                </button>
                <button class="topbar-toggler more"></button>
                <div class="nav-toggle">
                    <button class="btn btn-toggle sidenav-overlay-toggler">

                    </button>
                </div>
            </div>
            <!-- End Logo Header -->

        <!-- Navbar Header -->
        <nav class="navbar navbar-header navbar-expand-lg" data-background-color="dark">

            <div class="container-fluid">
                {{-- <div class="collapse" id="search-nav">

                    <form class="navbar-left navbar-form nav-search mr-md-3" action="{{route('home.search')}}" method="GET">
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <button type="submit" class="btn btn-search pr-1">
                                    <i class="fa fa-search search-icon"></i>
                                </button>
                            </div>
                            <input type="text" name="query" placeholder="Search ..." class="form-control">
                        </div>
                    </form>

                </div> --}}
                <ul class="navbar-nav topbar-nav ml-md-auto align-items-center">
                    <li class="nav-item toggle-nav-search hidden-caret">
                        <a class="nav-link" data-toggle="collapse" href="#search-nav" role="button" aria-expanded="false" aria-controls="search-nav">
                            <i class="fa fa-search"></i>
                        </a>
                    </li>
                    <li class="nav-item dropdown hidden-caret">
                        <a class="nav-link dropdown-toggle" href="#" id="notifDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fas fa-shopping-cart"></i>
                            @php
                                $cartitems2 = [];
                            @endphp
                            @auth
                            <span class="notification">{{Cart::session(Auth::user()->id)->getContent()->count()}}</span>
                            @php
                                $cartitems2 = Cart::session(Auth::user()->id)->getContent();
                            @endphp
                            @endauth
                        </a>
                        <ul class="dropdown-menu notif-box animated fadeIn" aria-labelledby="notifDropdown">
                            <li>
                                @auth

                                <div class="dropdown-title">You have {{Cart::session(Auth::user()->id)->getContent()->count()}} Cart items</div>
                                @endauth
                            </li>
                            <li>
                                <div class="notif-scroll scrollbar-outer">
                                    <div class="notif-center">
                                        @foreach ( $cartitems2 as $item2)
                                            <a href="{{route('home.product',$item2->id)}}">
                                                <div class="notif-icon notif-primary"> <i class="fa fa-user-plus"></i> </div>
                                                <div class="notif-content">
                                                    <span class="block">
                                                        {{$item2->name}}
                                                    </span>
                                                    <span class="time">$ {{$item2->price}}</span>
                                                </div>
                                            </a>
                                        @endforeach

                                    </div>
                                </div>
                            </li>
                            <li>
                                <a class="see-all" href="{{route('cart.index')}}">Proceed<i class="fa fa-angle-right"></i> </a>
                            </li>
                        </ul>
                    </li>
                    <li class="nav-item dropdown hidden-caret">
                        <a class="nav-link dropdown-toggle" href="{{route('notifications')}}" id="messageDropdown" role="button"  aria-haspopup="true" aria-expanded="false">
                            <i class="fa fa-envelope"></i>
                        </a>
                        {{-- <a class="nav-link dropdown-toggle" href="#" id="messageDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fa fa-envelope"></i>
                        </a> --}}
                        <ul class="dropdown-menu messages-notif-box animated fadeIn" aria-labelledby="messageDropdown">
                            <li>
                                <div class="dropdown-title d-flex justify-content-between align-items-center">
                                    Messages
                                    <a href="#" class="small">Mark all as read</a>
                                </div>
                            </li>
                            <li>
                                <div class="message-notif-scroll scrollbar-outer">
                                    <div class="notif-center">
                                        <a href="#">
                                            <div class="notif-img">
                                                <img src="../assets/img/jm_denis.jpg" alt="Img Profile">
                                            </div>
                                            <div class="notif-content">
                                                <span class="subject">Jimmy Denis</span>
                                                <span class="block">
                                                    How are you ?
                                                </span>
                                                <span class="time">5 minutes ago</span>
                                            </div>
                                        </a>
                                        <a href="#">
                                            <div class="notif-img">
                                                <img src="../assets/img/chadengle.jpg" alt="Img Profile">
                                            </div>
                                            <div class="notif-content">
                                                <span class="subject">Chad</span>
                                                <span class="block">
                                                    Ok, Thanks !
                                                </span>
                                                <span class="time">12 minutes ago</span>
                                            </div>
                                        </a>
                                        <a href="#">
                                            <div class="notif-img">
                                                <img src="../assets/img/mlane.jpg" alt="Img Profile">
                                            </div>
                                            <div class="notif-content">
                                                <span class="subject">Jhon Doe</span>
                                                <span class="block">
                                                    Ready for the meeting today...
                                                </span>
                                                <span class="time">12 minutes ago</span>
                                            </div>
                                        </a>
                                        <a href="#">
                                            <div class="notif-img">
                                                <img src="../assets/img/talha.jpg" alt="Img Profile">
                                            </div>
                                            <div class="notif-content">
                                                <span class="subject">Talha</span>
                                                <span class="block">
                                                    Hi, Apa Kabar ?
                                                </span>
                                                <span class="time">17 minutes ago</span>
                                            </div>
                                        </a>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <a class="see-all" href="{{route('notifications')}}">See all messages<i class="fa fa-angle-right"></i> </a>
                            </li>
                        </ul>
                    </li>
                    {{-- <li class="nav-item dropdown hidden-caret">
                        <a class="nav-link dropdown-toggle" href="#" id="notifDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fa fa-bell"></i>
                            <span class="notification">4</span>
                        </a>
                        <ul class="dropdown-menu notif-box animated fadeIn" aria-labelledby="notifDropdown">
                            <li>
                                <div class="dropdown-title">You have 4 new notification</div>
                            </li>
                            <li>
                                <div class="notif-scroll scrollbar-outer">
                                    <div class="notif-center">
                                        <a href="#">
                                            <div class="notif-icon notif-primary"> <i class="fa fa-user-plus"></i> </div>
                                            <div class="notif-content">
                                                <span class="block">
                                                    New user registered
                                                </span>
                                                <span class="time">5 minutes ago</span>
                                            </div>
                                        </a>
                                        <a href="#">
                                            <div class="notif-icon notif-success"> <i class="fa fa-comment"></i> </div>
                                            <div class="notif-content">
                                                <span class="block">
                                                    Rahmad commented on Admin
                                                </span>
                                                <span class="time">12 minutes ago</span>
                                            </div>
                                        </a>
                                        <a href="#">
                                            <div class="notif-img">
                                                <img src="../assets/img/profile2.jpg" alt="Img Profile">
                                            </div>
                                            <div class="notif-content">
                                                <span class="block">
                                                    Reza send messages to you
                                                </span>
                                                <span class="time">12 minutes ago</span>
                                            </div>
                                        </a>
                                        <a href="#">
                                            <div class="notif-icon notif-danger"> <i class="fa fa-heart"></i> </div>
                                            <div class="notif-content">
                                                <span class="block">
                                                    Farrah liked Admin
                                                </span>
                                                <span class="time">17 minutes ago</span>
                                            </div>
                                        </a>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <a class="see-all" href="{{route('notifications')}}">See all notifications<i class="fa fa-angle-right"></i> </a>
                            </li>
                        </ul>
                    </li> --}}
                    <li class="nav-item dropdown hidden-caret">
                        <a class="nav-link" data-toggle="dropdown" href="#" aria-expanded="false">
                            <i class="fas fa-layer-group"></i>
                        </a>
                        <div class="dropdown-menu quick-actions quick-actions-info animated fadeIn">
                            <div class="quick-actions-header">
                                <span class="title mb-1">Shop Actions</span>
                                <span class="subtitle op-8">Shortcuts</span>
                            </div>
                            <div class="quick-actions-scroll scrollbar-outer">
                                <div class="quick-actions-items">
                                    <div class="row m-0">
                                        <a class="col-6 col-md-4 p-0" href="#">
                                            <div class="quick-actions-item">
                                                <i class="flaticon-file-1"></i>
                                                <span class="text">Create Post</span>
                                            </div>
                                        </a>
                                        <a class="col-6 col-md-4 p-0" href="{{route('shop.products')}}">
                                            <div class="quick-actions-item">
                                                <i class="flaticon-database"></i>
                                                <span class="text">Add Product</span>
                                            </div>
                                        </a>
                                        <a class="col-6 col-md-4 p-0" href="{{route('shop.orders')}}">
                                            <div class="quick-actions-item">
                                                <i class="flaticon-pen"></i>
                                                <span class="text">View Orders</span>
                                            </div>
                                        </a>
                                        <a class="col-6 col-md-4 p-0" href="#">
                                            <div class="quick-actions-item">
                                                <i class="flaticon-interface-1"></i>
                                                <span class="text">Edit Shop</span>
                                            </div>
                                        </a>
                                        <a class="col-6 col-md-4 p-0" href="{{route('shop.shop')}} ">
                                            <div class="quick-actions-item">
                                                <i class="flaticon-list"></i>
                                                <span class="text">View Stats</span>
                                            </div>
                                        </a>
                                        <a class="col-6 col-md-4 p-0" href="#">
                                            <div class="quick-actions-item">
                                                <i class="flaticon-file"></i>
                                                <span class="text">Featured Products</span>
                                            </div>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </li>
                    @if (Auth::user())
                        <span class="p-2 text-white ">{{ Auth::user()->name }}</span>
                        <li class="nav-item dropdown hidden-caret">
                            <a class="dropdown-toggle profile-pic" data-toggle="dropdown"  aria-expanded="false">
                                <div class="avatar-sm">

                                    {{-- @php
                                        $cover  = Auth::user()->profile_photo_path;
                                        $cover = substr($cover, 1);
                                        $cover = substr($cover, 1);
                                        $cover = substr_replace($cover ,"",-1);
                                        $cover = substr_replace($cover ,"",-1);
                                    @endphp
                                    <img src="{{asset('storage/uploads/'.Auth::user()->id.'/cache/'.$cover)}}" onerror="this.src='{{asset('assets/img/placeholderwhite.png')}}';" alt="..." class="avatar-img rounded-circle">
                                 --}}



                                 @if (Laravel\Jetstream\Jetstream::managesProfilePhotos())
                                                <img class="avatar-img rounded-circle" src="{{ Auth::user()->profile_photo_url }}" alt="{{ Auth::user()->name }}" />
                                        @else
                                            <span class="inline-flex rounded-md">
                                                <button type="button" class="inline-flex items-center px-3 py-2 border border-transparent text-sm leading-4 font-medium rounded-md text-gray-500 bg-white hover:text-gray-700 focus:outline-none transition ease-in-out duration-150">
                                                    {{ Auth::user()->name }}

                                                    <svg class="ml-2 -mr-0.5 h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor">
                                                        <path fill-rule="evenodd" d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z" clip-rule="evenodd" />
                                                    </svg>
                                                </button>
                                            </span>
                                        @endif
                                </div>
                            </a>
                            <ul class="dropdown-menu dropdown-user animated fadeIn">
                                <div class="dropdown-user-scroll scrollbar-outer">
                                    <li>
                                        <div class="user-box">
                                            <div class="u-text">
                                                <h4>{{ Auth::user()->name }}</h4>
                                                <h5 class="text-muted">{{ Auth::user()->email }}</h5>
                                                <a href="{{route('profile')}}" class="btn btn-xs btn-secondary btn-sm">View Profile</a>
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="dropdown-divider"></div>
                                        <a class="dropdown-item" href="{{route('subscriptions')}}">Notifications</a>
                                        <a class="dropdown-item" href="{{route('profile.show')}}">Account Setting</a>
                                        <div class="dropdown-divider"></div>
                                        <!-- Authentication -->
                                        <form method="POST" action="{{ route('logout') }}">
                                            @csrf
                                            <x-jet-responsive-nav-link class=" p-2"  href="{{ route('logout') }}"
                                                           onclick="event.preventDefault();
                                                            this.closest('form').submit();">
                                                 <p class="dropdown-item">Logout</p>
                                            </x-jet-responsive-nav-link>
                                        </form>
                                    </li>
                                </div>
                            </ul>
                        </li>
                    @else

                        @if (Route::has('login'))
                            <div class="hidden fixed top-0 right-0 px-6 sm:block">
                                @auth
                                    <a class="text-white" href="{{ url('/home') }}" class="text-sm text-gray-700 underline">Dashboard</a>
                                @else
                                    <a class="text-white pl-2 pr-2 pt-1 pb-1 btn btn-white btn-border btn-round" href="{{ route('login') }}" class="text-sm text-gray-700 underline">Login</a>

                                    @if (Route::has('register'))
                                        <a class="text-white pl-2 pr-2 pt-1 pb-1 btn btn-white btn-border btn-round" href="{{ route('register') }}" class="ml-4 text-sm text-gray-700 underline">Register</a>
                                    @endif
                                @endauth
                            </div>
                        @endif

                    @endif
                </ul>
            </div>
        </nav>
        <!-- End Navbar -->
        </div>


        <div class="">
            <div class="content">
                <div class="col-10 ml-auto mr-auto">
                    <img class="card-img-top mt-4 pb-1  pt-4 pr-4"  src="{{asset('assets/img/kamusika_dark_logo.svg')}}" alt="Kamusika" class="navbar-brand">
                </div>
                <h1 style="color: orange; text-align: center;">Congratulations. You opened a shop on Kamusika. 🎉🎉🎉</h1>
                <p  style=" text-align: center;"> We haven't approved your shop yet, we will be done in a short while.
                     Meanwhile you can learn more about Kamusika <a href="https://community.kamusika.com"> here.</a> Good day.<p>
            </div>
        </div>


    </div>



</body>
</html>
