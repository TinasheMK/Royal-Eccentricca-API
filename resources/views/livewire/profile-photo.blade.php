<div>
    <ul class="navbar-nav topbar-nav ml-md-auto align-items-center">
        <li class="nav-item dropdown hidden-caret">
            <a class="dropdown-toggle profile-pic" data-toggle="dropdown" href="#" aria-expanded="false">
                <div class="">

                    @php
                        $cover  = Auth::user()->profile_photo_path;
                        $cover = substr($cover, 1);
                        $cover = substr($cover, 1);
                        $cover = substr_replace($cover ,"",-1);
                        $cover = substr_replace($cover ,"",-1);
                    @endphp
                    <img src="{{asset('storage/uploads/'.Auth::user()->id.'/cache/'.$cover)}}" onerror="this.src='{{asset('assets/img/placeholderwhite.png')}}';" alt="..." class="avatar-img rounded-circle">
                </div>
            </a>
        </li>
        <li class="nav-item dropdown hidden-caret">
            <div class="form-group">
                <label for="exampleFormControlFile1">Change Profile Image</label>
                <input type="file" class="form-control-file" id="exampleFormControlFile1">
            </div>
        </li>
</div>
