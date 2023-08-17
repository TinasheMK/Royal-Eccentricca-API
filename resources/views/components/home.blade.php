<!DOCTYPE html>
<html lang="en">
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<title>Kamusika Online Shopping</title>
	<meta content='width=device-width, initial-scale=1.0, shrink-to-fit=no' name='viewport' />
        <!-- Page Head -->
    <link rel="icon" href="{{asset('/assets/img/icon.png')}}" type="image/x-icon"/>

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
        <!-- Styles -->

        @if (isset($css))
                    {{ $css}}
            @endif
    <link rel="stylesheet" href="{{asset('assets/css/fonts.min.css')}}" media="all">


    <!--Import Google Icon Font-->
    <link rel="preconnect" href="https://fonts.gstatic.com" />
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Raleway:500&display=swap" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.gstatic.com" />
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300&display=swap" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.gstatic.com" />
    <link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet">
    <!--Import Font Awesome Icon Font-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha256-eZrrJcwDc/3uDhsdt61sL2oOBY362qM3lon1gyExkL0=" crossorigin="anonymous">

	<!-- CSS Files -->



	<link rel="stylesheet" href="{{asset('assets/css/bootstrap.min.css')}}">
	<link rel="stylesheet" href="{{asset('assets/sass/atlantis.css')}}">
	<link rel="stylesheet" href="{{asset('assets/css/owl.carousel.min.css')}}">

    <link rel="stylesheet" href="{{asset('assets/assets/css/style.css')}}">
    <link rel="stylesheet" href="{{asset('assets/assets/css/responsive.css')}}">
    <link rel="stylesheet" href="{{asset('/assets/css/demo.css')}}">






    <style type="text/css">
        .custom-back{
            background-color: #3f3f3f;
            background-image: url("{{asset('assets/img/756.jpg')}}");
            background-size: cover;
            background-attachment: scroll;
            background-blend-mode: soft-light;
            background-position-y: bottom;
        }

        #twisto {
            display: none;
        }


        @media (max-width: 991px) {
            #twilla    { display: none; }
            #twisto{ display: block; }
            .custom-back{
            background-image:none;
            background: #084e8b !important;
            background: linear-gradient(
            348degcart
            , #48abf7, #15054d) !important;
            /*background-color: #125fc3;*/
            background-size: contain;
            background-attachment: fixed;
            }
        }

    </style>

    <!--Import materialize.css-->
    {{-- <link rel="stylesheet" type="text/css" href="{{asset('static/css/materialize.min.css')}}"> --}}
    <!--Main css-->
    <link rel="stylesheet" type="text/css" href="{{asset('static/css/style.css')}}" />



@livewireStyles

    @if (isset($head))

                {{ $head }}

    @endif
<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-195340643-1">
</script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-195340643-1');
</script>
</head>
@if (isset($bodytag))
{{$bodytag}}
@else
<body>
@endif

	<div class="wrapper overlay-sidebar mb-3" style="margin-bottom: 40px">
		<div class="main-header">
			<!-- Logo Header -->
			<div class="logo-header" data-background-color="blue2">

				<a href="{{route('home.home')}}" class="logo" style="padding-left: 0 !important">
					{{-- <img src="../assets/img/kamusika_light_logo.png" alt="Kamusika" class="navbar-brand"> --}}
					<img class="card-img-top twisto" style="    max-height: 50px;" src="{{asset('assets/img/logo.png')}}" alt="Kamusika" class="navbar-brand">
				</a>
				<button class="navbar-toggler sidenav-toggler ml-auto" type="button" data-toggle="collapse" data-target="collapse" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon">
						<i class="icon-menu"></i>
					</span>
				</button>
				<button class="topbar-toggler more"><i class="icon-options-vertical"></i></button>
				<div class="nav-toggle">
					<button class="btn btn-toggle sidenav-overlay-toggler">
						<i class="icon-menu"></i>
					</button>
				</div>
			</div>
			<!-- End Logo Header -->

			<!-- Navbar Header -->
			<nav class="navbar navbar-header navbar-expand-lg" data-background-color="blue2">

				<div class="container-fluid">
					<div class="collapse" id="search-nav">

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

					</div>
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
                                                    <div class="notif-icon "> <i class="fas fa-tag " style="color: rgb(73, 108, 160) "></i> </div>
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
							<a href="{{route('wishlist.index')}}" class="nav-link dropdown-toggle">
								<i class="fas fa-heart" title="Wishlist"></i>

							</a>
						</li>
						<li class="nav-item dropdown hidden-caret">
							<a class="nav-link dropdown-toggle" href="{{route('notifications')}}" id="messageDropdown" role="button"  aria-haspopup="true" aria-expanded="false">
								<i class=" fas fa-bell"></i>
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
									<a class="see-all" href="{{route('notifications')}}">See all notifications<i class="fa fa-angle-right"></i> </a>
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

                        @auth

                        @php
                            $shop = DB::select('select * from shops where user_id = :id', ['id'=> Auth::user()->id]);
                            // dd($shop);
                        @endphp

                        @if ($shop)
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
                                                <a class="col-6 col-md-4 p-0" href="{{route('shop.posts')}}">
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
                                                <a class="col-6 col-md-4 p-0" href="{{route('shop.settings')}}">
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
|                       @endif
                        @endauth
						@if (Auth::user())
							<span class="p-2 text-white ">{{ Auth::user()->name }}</span>
							<li class="nav-item dropdown hidden-caret">
								<a class="dropdown-toggle profile-pic" data-toggle="dropdown" href="#" aria-expanded="false">
									<div class="avatar-sm">

                                        {{-- @php
                                            $cover  = Auth::user()->profile_photo_path;
                                            $cover = substr($cover, 1);
                                            $cover = substr($cover, 1);
                                            $cover = substr_replace($cover ,"",-1);
                                            $cover = substr_replace($cover ,"",-1);
                                        @endphp
                                        <img src="{{asset('storage/profile_photos/'.Auth::user()->id.'/cache/'.$cover)}}" onerror="this.src='{{asset('assets/img/placeholderwhite.png')}}';" alt="..." class="avatar-img rounded-circle"> --}}


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
                        	                        <a href="{{route('profile')}}" class="btn btn-xs btn-danger btn-sm">Balance : ${{Auth::user()->balance}}</a>
												</div>
											</div>
										<li>
											<div class="dropdown-divider"></div>
											<a class="dropdown-item" href="{{route('profile')}}">View Profile</a>
											<a class="dropdown-item" href="{{route('subscriptions')}}">Subscriptions</a>
											<a class="dropdown-item" href="{{route('profile.show')}}">Account Settings</a>
											<div class="dropdown-divider"></div>
                        	                <!-- Authentication -->
                        	                <form method="POST" action="{{ route('logout') }}">
                        	                    @csrf
                        	                    <a class=" "  href="{{ route('logout') }}"
                        	                                   onclick="event.preventDefault();
                        	                                    this.closest('form').submit();">
                        	                         <p class="dropdown-item">Logout</p>
                                            </a>
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

		<!-- Sidebar -->
		@include('home.sidebar.sidebar')
		<!-- End Sidebar -->

		<div class="main-panel">
			<div class="content" style="margin-bottom: 40px">


                {{ $content }}


			</div>
			<footer class="footer" >

                <!--chatbot widget -->
                <div class="widget">
                    <div class="chat_header">
                    <!--Add the name of the bot here -->
                    <span class="chat_header_title">AI Assistant</span>
                    {{-- <span class="dropdown-trigger" href="#" data-target="dropdown1">
                        <i class="material-icons"> more_vert </i>
                    </span> --}}


                    <span class=" dropdown-trigger" href="#" id="dropdown1" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <i class="material-icons"> more_vert </i>
                    </span>

                    <!-- Dropdown menu-->
                    <ul id="dropdown1" class="dropdown-menu notif-box animated fadeIn " style="padding: 10px !important" aria-labelledby="dropdown1">
                        <li><a href="#" id="clear">Clear</a></li>
                        <li><a href="#" id="restart">Restart</a></li>
                        <li><a href="#" id="close">Close</a></li>
                        <li>
                            <div class="notif-scroll scrollbar-outer">
                                <div class="notif-center">
                                    @foreach ( $cartitems2 as $item2)
                                        <a href="{{route('home.product',$item2->id)}}">
                                            <div class="notif-icon "> <i class="fas fa-tag " style="color: rgb(73, 108, 160) "></i> </div>
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
                    </ul>





                    </div>

                    <!--Chatbot contents goes here -->
                    <div class="chats" id="chats">
                    <div class="clearfix"></div>
                    </div>

                    <!--keypad for user to type the message -->
                    <div class="keypad">
                    <textarea
                        id="userInput"
                        placeholder="Type a message..."
                        class="usrInput"
                    ></textarea>
                    <div id="sendButton">
                        <i class="fa fa-paper-plane" aria-hidden="true"></i>
                    </div>
                    </div>
                </div>

                <!--bot profile-->
                <div class="profile_div" id="profile_div">
                    <img class="imgProfile" src="{{asset('static/img/botAvatar.png')}}" />
                </div>

			</footer>
		</div>



	</div>




    <link rel="stylesheet" href="{{asset('assets/css/style.css')}}">
	<!--   Core JS Files   -->
	<script src="{{asset('assets/js/core/jquery.3.2.1.min.js')}}"></script>
	<script src="{{asset('assets/js/core/popper.min.js')}}"></script>
	<script src="{{asset('assets/js/core/bootstrap.min.js')}}"></script>

	<!-- jQuery UI -->
	<script src="{{asset('assets/js/plugin/jquery-ui-1.12.1.custom/jquery-ui.min.js')}}"></script>
	<script src="{{asset('assets/js/plugin/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js')}}"></script>

	<!-- jQuery Scrollbar -->
	<script src="{{asset('assets/js/plugin/jquery-scrollbar/jquery.scrollbar.min.js')}}"></script>


	<!-- Chart JS -->
	{{-- <script src="{{asset('assets/js/plugin/chart.js/chart.min.js')}}"></script> --}}

	<!-- jQuery Sparkline -->
	<script src="{{asset('assets/js/plugin/jquery.sparkline/jquery.sparkline.min.js')}}"></script>

	<!-- Chart Circle -->
	<script src="{{asset('assets/js/plugin/chart-circle/circles.min.js')}}"></script>

	<!-- Datatables -->
	<script src="{{asset('assets/js/plugin/datatables/datatables.min.js')}}"></script>

	<!-- Bootstrap Notify -->
	<script src="{{asset('assets/js/plugin/bootstrap-notify/bootstrap-notify.min.js')}}"></script>

	<!-- jQuery Vector Maps -->
	<script src="{{asset('assets/js/plugin/jqvmap/jquery.vmap.min.js')}}"></script>
	<script src="{{asset('assets/js/plugin/jqvmap/maps/jquery.vmap.world.js')}}"></script>

	<!-- Sweet Alert -->
	<script src="{{asset('assets/js/plugin/sweetalert/sweetalert.min.js')}}"></script>

	<!-- Atlantis JS -->
	<script src="{{asset('assets/js/atlantis.min.js')}}"></script>


	<!--Etc-->
	<script src="{{asset('assets/js/owl.carousel.min.js')}}">
    </script>

    <script>
        //== Class definition
        var SweetAlert2Demo = function() {

            //== Demos
            var initDemos = function() {
                //== Sweetalert Demo 1
                $('#alert_demo_1').click(function(e) {
                    swal('Good job!', {
                        buttons: {
                            confirm: {
                                className : 'btn btn-success'
                            }
                        },
                    });
                });

                //== Sweetalert Demo 2
                $('#alert_demo_2').click(function(e) {
                    swal("Here's the title!", "...and here's the text!", {
                        buttons: {
                            confirm: {
                                className : 'btn btn-success'
                            }
                        },
                    });
                });

                //== Sweetalert Demo 3
                $('#alert_demo_3_1').click(function(e) {
                    swal("Good job!", "You clicked the button!", {
                        icon : "warning",
                        buttons: {
                            confirm: {
                                className : 'btn btn-warning'
                            }
                        },
                    });
                });

                $('#alert_demo_3_2').click(function(e) {
                    swal("Good job!", "You clicked the button!", {
                        icon : "error",
                        buttons: {
                            confirm: {
                                className : 'btn btn-danger'
                            }
                        },
                    });
                });

                $('#alert_demo_3_3').click(function(e) {
                    swal("Good job!", "You clicked the button!", {
                        icon : "success",
                        buttons: {
                            confirm: {
                                className : 'btn btn-success'
                            }
                        },
                    });
                });

                $('#alert_demo_3_4').click(function(e) {
                    swal("Good job!", "You clicked the button!", {
                        icon : "info",
                        buttons: {
                            confirm: {
                                className : 'btn btn-info'
                            }
                        },
                    });
                });

                //== Sweetalert Demo 4
                $('#alert_demo_4').click(function(e) {
                    swal({
                        title: "Good job!",
                        text: "You clicked the button!",
                        icon: "success",
                        buttons: {
                            confirm: {
                                text: "Confirm Me",
                                value: true,
                                visible: true,
                                className: "btn btn-success",
                                closeModal: true
                            }
                        }
                    });
                });

                $('#alert_demo_5').click(function(e){
                    swal({
                        title: 'Input Something',
                        html: '<br><input class="form-control" placeholder="Input Something" id="input-field">',
                        content: {
                            element: "input",
                            attributes: {
                                placeholder: "Input Something",
                                type: "text",
                                id: "input-field",
                                className: "form-control"
                            },
                        },
                        buttons: {
                            cancel: {
                                visible: true,
                                className: 'btn btn-danger'
                            },
                            confirm: {
                                className : 'btn btn-success'
                            }
                        },
                    }).then(
                    function() {
                        swal("", "You entered : " + $('#input-field').val(), "success");
                    }
                    );
                });

                $('#alert_demo_6').click(function(e) {
                    swal("This modal will disappear soon!", {
                        buttons: false,
                        timer: 3000,
                    });
                });

                $('#alert_demo_7').click(function(e) {
                    swal({
                        title: 'Are you sure?',
                        text: "You won't be able to revert this!",
                        type: 'warning',
                        buttons:{
                            confirm: {
                                text : 'Yes, delete it!',
                                className : 'btn btn-success'
                            },
                            cancel: {
                                visible: true,
                                className: 'btn btn-danger'
                            }
                        }
                    }).then((Delete) => {
                        if (Delete) {
                            swal({
                                title: 'Deleted!',
                                text: 'Your file has been deleted.',
                                type: 'success',
                                buttons : {
                                    confirm: {
                                        className : 'btn btn-success'
                                    }
                                }
                            });
                        } else {
                            swal.close();
                        }
                    });
                });

                $('#alert_demo_8').click(function(e) {
                    swal({
                        title: 'Are you sure?',
                        text: "You won't be able to revert this!",
                        type: 'warning',
                        buttons:{
                            cancel: {
                                visible: true,
                                text : 'No, cancel!',
                                className: 'btn btn-danger'
                            },
                            confirm: {
                                text : 'Yes, delete it!',
                                className : 'btn btn-success'
                            }
                        }
                    }).then((willDelete) => {
                        if (willDelete) {
                            swal("Poof! Your imaginary file has been deleted!", {
                                icon: "success",
                                buttons : {
                                    confirm : {
                                        className: 'btn btn-success'
                                    }
                                }
                            });
                        } else {
                            swal("Your imaginary file is safe!", {
                                buttons : {
                                    confirm : {
                                        className: 'btn btn-success'
                                    }
                                }
                            });
                        }
                    });
                })

            };

            return {
                //== Init
                init: function() {
                    initDemos();
                },
            };
        }();

        //== Class Initialization
        jQuery(document).ready(function() {
            SweetAlert2Demo.init();
        });
    </script>



    <!-- Page Heading -->
    @if (isset($foot))
        <header class="bg-white shadow">
            <div class="max-w-7xl mx-auto py-6 px-4 sm:px-6 lg:px-8">
                {{ $foot }}
            </div>
        </header>
    @endif
    @livewireScripts
    {{-- <script type="text/javascript">
        window.onscroll = function(ev) {
            if ((window.innerHeight + window.scrollY) >= document.body.offsetHeight) {
                window.livewire.emit('load-more');
            }
        };
    </script> --}}
    <script>
        document.getElementById("load").addEventListener("click", function(){
            window.livewire.emit('load-more');
        });
    </script>


        {{-- Chatbot widget --}}
    {{-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script type="text/javascript">
        var jQuery_3_3_1 = $.noConflict(true);
    </script> --}}
    <script  type="text/javascript"  src="{{asset('static/js/lib/materialize.min.js')}}"></script>
    <script src="{{asset('static/js/lib/uuid.min.js')}}"></script>
    <!--Main Script -->
    <script type="text/javascript" src="{{asset('static/js/script.js')}}"></script>

    <!--Chart.js Script -->
    <script type="text/javascript" src="{{asset('static/js/lib/chart.min.js')}}"></script>
    <script type="text/javascript" src="{{asset('static/js/lib/showdown.min.js')}}"></script>

</body>
</html>
