<!DOCTYPE html>
<html lang="en">
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<title>Shop</title>
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

    <!-- Styles -->
    <link rel="stylesheet" href="{{ mix('css/app.css') }}">

    <link rel="stylesheet" href="{{asset('assets/css/fonts.min.css')}}" media="all">

	<!-- CSS Files -->
	<link rel="stylesheet" href="{{asset('/assets/css/bootstrap.min.css')}}">
	<link rel="stylesheet" href="{{asset('/assets/css/atlantis.min.css')}}">

	<!-- CSS Just for demo purpose, don't include it in your project -->
	<link rel="stylesheet" href="{{asset('/assets/css/demo.css')}}">
</head>
<body data-background-color="dark">
	<div class="wrapper">
		<div class="main-header">
			<!-- Logo Header -->
			<div class="logo-header" data-background-color="dark">

				<a href="{{route('home.home')}}" class="logo">
					{{-- <img src="../assets/img/kamusika_light_logo.svg" alt="Kamusika" class="navbar-brand"> --}}
					<img class="card-img-top twisto " style="   " src="{{asset('assets/img/logo.png')}}" alt="Kamusika" class="navbar-brand">
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

                <ul class="navbar-nav topbar-nav ml-md-auto align-items-center">
                    <li class="nav-item toggle-nav-search hidden-caret">
                        <a class="nav-link" data-toggle="collapse" href="#search-nav" role="button" aria-expanded="false" aria-controls="search-nav">
                            <i class="fa fa-search"></i>
                        </a>
                    </li>
                    <li class="nav-item dropdown hidden-caret">
                        <p class="nav-link text-white mt-auto mb-auto dropdown-toggle"  id="messageDropdown" role="button"  aria-haspopup="true" aria-expanded="false">
                            Admin Access
                        </p>
                    </li>
                    <li class="nav-item dropdown hidden-caret">
                        <a class="nav-link" data-toggle="dropdown" href="#" aria-expanded="false">
                            <i class="fas fa-layer-group"></i>
                        </a>
                        <div class="dropdown-menu quick-actions quick-actions-default animated fadeIn">
                            <div class="quick-actions-header">
                                <span class="title mb-1">Admin Actions</span>
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
                                        <a class="col-6 col-md-4 p-0" href="{{route('admin.products')}}">
                                            <div class="quick-actions-item">
                                                <i class="flaticon-database"></i>
                                                <span class="text">Add Product</span>
                                            </div>
                                        </a>
                                        <a class="col-6 col-md-4 p-0" href="{{route('admin.orders')}}">
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
                                        <a class="col-6 col-md-4 p-0" href="{{route('admin.shop')}} ">
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
                            <a class="dropdown-toggle profile-pic" data-toggle="dropdown" href="#" aria-expanded="false">
                                <div class="avatar-sm">


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
                                        <a class="dropdown-item" href="{{route('contacts')}}">Contacts</a>
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

		<!-- Sidebar -->
		<div class="sidebar sidebar-style-2" style="    background-color: #1a2035;">
			<div class="sidebar-wrapper scrollbar scrollbar-inner">
				<div class="sidebar-content">
					<ul class="nav nav-warning " >
						<li class="nav-item active" >
							<a href="#dashboard" class="collapse" >
								<i class="fas fa-layer-group"></i>
								<p>Menu</p>

							</a>

						</li>
						<li class="nav-item">
							<a data-toggle="collapse" href="#base">
								<i class="fas fa-home"></i>
								<p>Dashboard</p>
								<span class="caret"></span>
							</a>
							<div class="collapse" id="base">
								<ul class="nav nav-collapse">

									<li>
										<a href="{{route('admin.shop')}}">
											<span class="sub-item">Dashboard</span>
										</a>
									</li>

								</ul>
							</div>
						</li>

						<li class="nav-item">
							<a data-toggle="collapse" href="#sidebarLayouts">
								<i class="fas fa-cart-arrow-down"></i>
								<p>Orders</p>
								<span class="caret"></span>
							</a>
							<div class="collapse" id="sidebarLayouts">
								<ul class="nav nav-collapse">
									<li>
										<a href="{{route('admin.orders')}}">
											<span class="sub-item">Pending Orders</span>
										</a>
									</li>
									<li>
										<a href="{{route('admin.history')}}">
											<span class="sub-item">Order History</span>
										</a>
									</li>

								</ul>
							</div>
						</li>
                        <li class="nav-item">
							<a data-toggle="collapse" href="#sidebarLayouts2">
								<i class=" fas fa-shopping-basket"></i>
								<p>Products</p>
								<span class="caret"></span>
							</a>
							<div class="collapse" id="sidebarLayouts2">
								<ul class="nav nav-collapse">
									<li>
										<a href="{{route('admin.products')}}">
											<span class="sub-item">All Products</span>
										</a>
									</li>

								</ul>
							</div>
						</li>
                        {{-- <li class="nav-item">
							<a data-toggle="collapse" href="#sidebarLayouts5">
								<i class="far fa-newspaper"></i>
								<p>Posts</p>
								<span class="caret"></span>
							</a>
							<div class="collapse" id="sidebarLayouts5">
								<ul class="nav nav-collapse">
									<li>
										<a href="{{route('admin.posts')}}">
											<span class="sub-item">All Posts</span>
										</a>
									</li>

								</ul>
							</div>
						</li> --}}
                        <li class="nav-item">
							<a data-toggle="collapse" href="#sidebarLayouts5">
								<i class="far fa-newspaper"></i>
								<p>Users</p>
								<span class="caret"></span>
							</a>
							<div class="collapse" id="sidebarLayouts5">
								<ul class="nav nav-collapse">
									<li>
										<a href="{{route('admin.users')}}">
											<span class="sub-item">All Users</span>
										</a>
									</li>

								</ul>
							</div>
						</li>
                        <li class="nav-item">
							<a data-toggle="collapse" href="#sidebarLayouts5s">
								<i class="fas fa-tasks"></i>
								<p>Tasks</p>
								<span class="caret"></span>
							</a>
							<div class="collapse" id="sidebarLayouts5s">
								<ul class="nav nav-collapse">
									<li>
										<a href="{{route('admin.tasks')}}">
											<span class="sub-item">Department Tasks</span>
										</a>
									</li>

								</ul>
							</div>
						</li>
                        {{-- <li class="nav-item">
							<a data-toggle="collapse" href="#sidebarLayouts3">
								<i class="fas fa-toolbox"></i>
								<p>Settings</p>
								<span class="caret"></span>
							</a>
							<div class="collapse" id="sidebarLayouts3">
								<ul class="nav nav-collapse">
									<li>
										<a href="{{route('admin.settings')}}">
											<span class="sub-item">Settings</span>
										</a>
									</li>

								</ul>
							</div>
						</li> --}}

					</ul>
				</div>
			</div>
		</div>
		<!-- End Sidebar -->

		<div class="main-panel">
			<div class="content">


                {{$content}}


			</div>
			<footer class="footer">
                    Kamusika
			</footer>
		</div>


	</div>
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
	<script src="{{asset('assets/js/plugin/chart.js/chart.min.js')}}"></script>

	<!-- jQuery Sparkline -->
	<script src="{{asset('assets/js/plugin/jquery.sparkline/jquery.sparkline.min.js')}}"></script>

	<!-- Chart Circle -->
	<script src="{{asset('assets/js/plugin/chart-circle/circles.min.js')}}"></script>

	<!-- Datatables -->
	<script src="../assets/js/plugin/datatables/datatables.min.js')}}"></script>

	<!-- Bootstrap Notify -->
	<script src="../assets/js/plugin/bootstrap-notify/bootstrap-notify.min.js')}}"></script>

	<!-- jQuery Vector Maps -->
	<script src="{{asset('assets/js/plugin/jqvmap/jquery.vmap.min.js')}}"></script>
	<script src="{{asset('assets/js/plugin/jqvmap/maps/jquery.vmap.world.js')}}"></script>

	<!-- Sweet Alert -->
	<script src="{{asset('assets/js/plugin/sweetalert/sweetalert.min.js')}}"></script>

	<!-- Atlantis JS -->
	<script src="{{asset('assets/js/atlantis.min.js')}}"></script>

    <script src="{{asset('assets/js/summernote/summernote-bs4.min.js')}}"></script>
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
                        text: "This will mark the order as done. You won't be able to revert this!",
                        type: 'warning',
                        buttons:{
                            confirm: {
                                text : 'Yes,it is done!',
                                className : 'btn btn-success',

                            },
                            cancel: {
                                visible: true,
                                className: 'btn btn-danger'
                            }
                        }
                    }).then((Delete) => {
                        if (Delete) {
                            swal({
                                title: 'Done!',
                                text: 'The order is complete',
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
    <script>
        $(function () {
            //Add text editor
            $('#compose-textarea').summernote()
        })
    </script>

</body>
</html>
