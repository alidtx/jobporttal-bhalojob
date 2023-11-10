<div class="header">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="header-top">
                    <div class="logo">
                        <a href="{{url('/')}}"><img src="{{ asset('/') }}sitesetting_images/thumb/{{ @$siteSetting->site_logo }}" alt="{{ @$siteSetting->site_name }}" /></a>
                    </div>
                    <div class="authentication">
                        <ul>
                            @if(Auth::check())
                            <li class="nav-item dropdown userbtn"><div class="login-user-images">{{Auth::user()->printUserImage()}}</div>
                                <ul class="dropdown-menu">
                                    <li class="nav-item"><a href="{{route('home')}}" class="nav-link"><i class="fa fa-tachometer" aria-hidden="true"></i> {{__('Dashboard')}}</a> </li>
                                    <li class="nav-item"><a href="{{ route('my.profile') }}" class="nav-link"><i class="fa fa-user" aria-hidden="true"></i> {{__('My Profile')}}</a> </li>
                                    <li class="nav-item"><a href="{{ route('view.public.profile', Auth::user()->id) }}" class="nav-link"><i class="fa fa-eye" aria-hidden="true"></i> {{__('View Public Profile')}}</a> </li>
                                    <li><a href="{{ route('my.job.applications') }}" class="nav-link"><i class="fa fa-desktop" aria-hidden="true"></i> {{__('My Job Applications')}}</a> </li>
                                    <li class="nav-item"><a href="{{ route('logout') }}" onclick="event.preventDefault(); document.getElementById('logout-form-header').submit();" class="nav-link"><i class="fa fa-sign-out" aria-hidden="true"></i> {{__('Logout')}}</a> </li>
                                    <form id="logout-form-header" action="{{ route('logout') }}" method="POST" style="display: none;">
                                        {{ csrf_field() }}
                                    </form>
                                </ul>
                            </li>
                            @endif @if(Auth::guard('company')->check())
                            <li class="nav-item postjob"><a href="{{route('post.job')}}" class="nav-link register">{{__('Post a job')}}</a> </li>
                            <li class="nav-item dropdown userbtn"><a href="{{route('company.home')}}">{{Auth::guard('company')->user()->printCompanyImage()}}</a>
                                <ul class="dropdown-menu">
                                    <li class="nav-item"><a href="{{route('company.home')}}" class="nav-link"><i class="fa fa-tachometer" aria-hidden="true"></i> {{__('Dashboard')}}</a> </li>
                                    <li class="nav-item"><a href="{{ route('company.profile') }}" class="nav-link"><i class="fa fa-user" aria-hidden="true"></i> {{__('Company Profile')}}</a></li>
                                    <li class="nav-item"><a href="{{ route('post.job') }}" class="nav-link"><i class="fa fa-desktop" aria-hidden="true"></i> {{__('Post Job')}}</a></li>
                                    <li class="nav-item"><a href="{{route('company.messages')}}" class="nav-link"><i class="fa fa-envelope-o" aria-hidden="true"></i> {{__('Company Messages')}}</a></li>
                                    <li class="nav-item"><a href="{{ route('company.logout') }}" onclick="event.preventDefault(); document.getElementById('logout-form-header1').submit();" class="nav-link"><i class="fa fa-sign-out" aria-hidden="true"></i> {{__('Logout')}}</a> </li>
                                    <form id="logout-form-header1" action="{{ route('company.logout') }}" method="POST" style="display: none;">
                                        {{ csrf_field() }}
                                    </form>
                                </ul>
                            </li>
                            @endif @if(!Auth::user() && !Auth::guard('company')->user())
                            <!-- <li class="nav-item"><a href="{{route('login')}}" class="nav-link">{{__('ログイン')}}</a> </li> -->
                            <li class="nav-item"><a href="{{route('login')}}" class="nav-link">Login Now</a> </li>
							<!-- <li class="nav-item register"><a href="{{route('register')}}" class="nav-link ">{{__('無料会員登録')}}  </a> </li> -->
							<li class="nav-item register"><a href="{{route('register')}}" class="nav-link ">Register Now</a> </li>
                            @endif
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="main-navbar">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-12">
                    <div id="menu-icon" class='menu'>
                        <span class='bar1'></span>
                        <span class='bar2'></span>
                        <span class='bar3'></span>
                    </div>
                    <div class="clearfix"></div>
                    <!-- Nav start -->
                    <nav class="navbar navbar-expand-lg navbar-light" id="nav-main">

                        <div class="navbar-collapse" >
                            <ul class="navbar-nav m-auto">
                                <li class="nav-item {{ Request::url() == route('index') ? 'active' : '' }}"><a href="{{url('/')}}" class="nav-link">
                                    <p> ホーム </p>
                                <p> {{__('Home')}} </p>
                                </a> </li>


                                @auth
                                    @if(Auth::guard('company')->check())
                                        <li class="nav-item"><a href="{{url('/job-seekers')}}" class="nav-link">
                                            <p> {{__('Seekers')}} </p>
                                        </a> </li>
                                    @else
                                        <li class="nav-item"><a href="{{url('/jobs')}}" class="nav-link">
                                            <p> 求人 </p>
                                            <p> {{__('Jobs')}} </p>
                                        </a> </li>
                                    @endif

                                @else
                                    <li class="nav-item"><a  class="nav-link login_alart">
                                    <p> 求人 </p>
                                            <p> {{__('Jobs')}} </p>
                                    </a> </li>

                                @endauth

                                <li class="nav-item {{ Request::url()}}"><a href="{{url('/companies')}}" class="nav-link">
                                    <p> 企業 </p>
                                    <p> {{__('company')}} </p>
                                    
                                </a> </li>
                                {{-- @foreach($show_in_top_menu as $top_menu) @php $cmsContent = App\CmsContent::getContentBySlug($top_menu->page_slug); @endphp
                                <li class="nav-item {{ Request::url() == route('cms', $top_menu->page_slug) ? 'active' : '' }}"><a href="{{ route('cms', $top_menu->page_slug) }}" class="nav-link"> 
                                <p> 会社概要 </p>
                                <p> {{ $cmsContent->page_title }} </p>
                                </a> </li>
                                @endforeach --}}
                                <li class="nav-item {{ Request::url() == route('blogs') ? 'active' : '' }}"><a href="{{ route('blogs') }}" class="nav-link">
                                    <p> ブログ </p>
                                    <p> {{__('Blog')}} </p>
                                    
                                </a> </li>
                                <li class="nav-item {{ Request::url() == route('contact.us') ? 'active' : '' }}"><a href="{{ route('contact.us') }}" class="nav-link">
                                <P> お問い合わせ </P>
                                <p> {{__('Contact Us')}} </p>

                                </a> </li>


                            </ul>
                        </div>
                        <div class="clearfix"></div>
                    </nav>
                </div>
            </div>
        </div>
    </div>
</div>
