<div class="row row-card-no-pd mt--2" style="padding: 0">
    <div class="col-sm-3 col-md-3 col-3 col-lg-3 " id="twilla">
        <div class="card card-stats card-round">
            <div class="card-body " style="padding: 0.8rem">
                <div class="row justify-content-center">
                    <a href="{{route('home.home')}}">
                        <div class="col-7 col-stats">
                            <div class="numbers ">

                                <h4 class="card-title">Home </h4>
                            </div>
                        </div>
                    </a>
                </div>
            </div>
        </div>
    </div>
    <div class="col-sm-3 col-md-3 col-3 col-lg-3 " id="twilla">
        <div class="card card-stats card-round">
            <div class="card-body " style="padding: 0.8rem">
                <div class="row justify-content-center">
                    <a href="{{route('home.explore')}}">
                        <div class="col-7 col-stats">
                            <div class="numbers">
                                <h4 class="card-title">Explore</h4>
                            </div>
                        </div>
                    </a>
                </div>
            </div>
        </div>
    </div>
    <div class="col-sm-3 col-md-3 col-3 col-lg-3 " id="twilla">
        <div class="card card-stats card-round">
            <div class="card-body" style="padding: 0.8rem">
                <div class="row justify-content-center">
                    <a href="{{route('notifications')}}">
                        <div class="col-7 col-stats">
                            <div class="numbers">
                                <h4 class="card-title">Notifications</h4>
                            </div>
                        </div>
                    </a>
                </div>
            </div>
        </div>
    </div>
    <div class="col-sm-3 col-md-3 col-3 col-lg-3 " id="twilla">
        <div class="card card-stats card-round">
            <div class="card-body" style="padding: 0.8rem">
                <div class="row justify-content-center">
                    <a href="{{route('profile')}}">
                        <div class="col-7 col-stats">
                            <div class="numbers">
                                <h4 class="card-title">Account</h4>
                            </div>
                        </div>
                    </a>
                </div>
            </div>
        </div>
    </div>

            {{-- Wiwi Sports --}}

    <div class="col-sm-3 col-md-3 col-3 col-lg-3 " id="twisto">
        <div class="card  card-round">
            <div class="card-body " style="padding: 0">
                <div class="row justify-content-center">
                    <a href="{{route('home.home')}}">
                        <div class="col-7 col-stats">
                            <div class="numbers ">
                                <button class="btn btn-link">
                                    <span class="btn-label">
                                        <i class=" icon-home"></i>
                                    </span>
                                </button>


                            </div>
                        </div>
                    </a>
                </div>
            </div>
        </div>
    </div>
    <div class="col-sm-3 col-md-3 col-3 col-lg-3 " id="twisto">
        <div class="card card-round">
            <div class="card-body " style="padding: 0">
                <div class="row justify-content-center">
                    <a href="{{route('home.explore')}}">
                        <div class="col-7 col-stats">
                            <div class="numbers">
                                <button class="btn btn-link">
                                    <span class="btn-label">
                                        <i class="  icon-compass"></i>
                                    </span>
                                </button>
                            </div>
                        </div>
                    </a>
                </div>
            </div>
        </div>
    </div>
    <div class="col-sm-3 col-md-3 col-3 col-lg-3 " id="twisto">
        <div class="card  card-round">
            <div class="card-body" style="padding: 0">
                <div class="row justify-content-center">
                    <a href="{{route('notifications')}}">
                        <div class="col-7 col-stats">
                            <div class="numbers">
                                <button class="btn btn-link">
                                    <span class="btn-label">
                                        <i class="     icon-bell"></i>
                                    </span>
                                </button>
                            </div>
                        </div>
                    </a>
                </div>
            </div>
        </div>
    </div>
    <div class="col-sm-3 col-md-3 col-3 col-lg-3 " id="twisto">
        <div class="card card-round">
            <div class="card-body" style="padding: 0">
                <div class="row justify-content-center">
                    <a href="{{route('profile')}}">
                        <div class="col-7 col-stats">
                            <div class="numbers">
                                <button class="btn btn-link">
                                    <span class="btn-label">
                                        <i class="icon-user"></i>
                                    </span>
                                </button>
                            </div>
                        </div>
                    </a>
                </div>
            </div>
        </div>
    </div>

</div>
<div id="twisto">
    <form action="{{route('home.search')}}" method="GET">
        <div class="form-group">
            <label for="email2">Search for Products and Shops.</label>

            <div class="input-icon">
                <input type="text" name="query" class="form-control" placeholder="Search for...">
                <span class="input-icon-addon">
                    <i class="fa fa-search"></i>
                </span>
            </div>
        </div>
    </form>
</div>


