@extends('layouts.app')
@section('content')
<!-- Header start -->
@include('includes.header')
<!-- Header end -->


    <div class="authpages">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    @include('flash::message')

                    <div class="useraccountwrap">

                        <div class="userbtns">
                            <ul class="nav nav-tabs">
                                <?php
                                $c_or_e = old('candidate_or_employer', 'candidate');
                                ?>
                                <li class="nav-item"><a class="nav-link {{ $c_or_e == 'candidate' ? 'active' : '' }}"
                                        data-toggle="tab" href="#candidate" aria-expanded="true">Candidate Login</a>
                                </li>
                                {{-- {{ __('求職者') }} --}}
                                <li class="nav-item"><a class="nav-link {{ $c_or_e == 'employer' ? 'active' : '' }}"
                                        data-toggle="tab" href="#employer" aria-expanded="false">Employer Login</a>
                                </li>
                                {{-- {{ __('企業向け') }} --}}
                            </ul>
                        </div>
                        <div class="userccount whitebg">
                            <div class="tab-content">
                                <div id="candidate"
                                    class="formpanel mt-0 tab-pane {{ $c_or_e == 'candidate' ? 'active' : '' }}">
                                    <div class="condition">
                                        <article>
                                            <p> 
                                                仕事をお探しの方に対する様々な就職 仕事をお探しの方に対する様々な就職 
                                                仕事をお探しの方に対する様々な就職 仕事をお探しの方に対する様々な就職 
                                                仕事をお探しの方に対する様々な就職 仕事をお探しの方に対する様々な就職 
                                            </p>
                                        </article>
                                        <div class="condition-list">
                                            <button> <i class="fa fa-chevron-right" aria-hidden="true"></i> 様々な就職 仕事をお探しの方に対する様々な就職  </button>
                                            <button> <i class="fa fa-chevron-right" aria-hidden="true"></i> 様々な就職 仕事をお探しの方に対する様々な就職  </button>
                                        </div>
                                    </div>
                                    <!-- <div class="socialLogin">
                                        <h5>{{ __('Login with Social') }}</h5>
                                        <a href="{{ url('login/jobseeker/facebook') }}" class="bg-danger">
                                            <i class="fab fa-google" aria-hidden="true"></i></a>
                                        <a href="{{ url('login/jobseeker/facebook') }}" class="fb">
                                            <i class="fab fa-facebook" aria-hidden="true"></i></a>
                                        <a href="{{ url('login/jobseeker/yahoo') }}" class="tw">
                                            <i class="fab fa-yahoo" aria-hidden="true"></i>
                                        </a>
                                        <a href="{{ url('login/jobseeker/linkedin') }}" class="tw">
                                            <i class="fab fa-linkedin" aria-hidden="true"></i>
                                        </a>



                                    </div>

                                    <div class="divider-text-center"><span>{{ __('Or login with your account') }}</span>
                                    </div> -->


                                    <form class="form-horizontal" method="POST" action="{{ route('login') }}">
                                        {{ csrf_field() }}
                                        <input type="hidden" name="candidate_or_employer" value="candidate" />
                                        <div class="formpanel form-box">
                                            <div class="formrow{{ $errors->has('email') ? ' has-error' : '' }}">
                                                <input id="email" type="email" class="form-control" name="email"
                                                    value="{{ old('email') }}" required autofocus
                                                    placeholder="{{ __('Email Address') }}">
                                                @if ($errors->has('email'))
                                                    <span class="help-block">
                                                        <strong>{{ $errors->first('email') }}</strong>
                                                    </span>
                                                @endif
                                            </div>
                                            <div class="formrow{{ $errors->has('password') ? ' has-error' : '' }}">
                                                <input id="password" type="password" class="form-control" name="password"
                                                    value="" required placeholder="{{ __('Password') }}">
                                                @if ($errors->has('password'))
                                                    <span class="help-block">
                                                        <strong>{{ $errors->first('password') }}</strong>
                                                    </span>
                                                @endif
                                            </div>
                                            <!-- <div class="mb-3"><i class="fas fa-lock" aria-hidden="true"></i>
                                                {{ __('Forgot Your Password') }}? <a
                                                    href="{{ route('password.request') }}">{{ __('Click here') }}</a>
                                            </div> -->

                                            <div class="submit-button">
                                            <input type="submit" class="btn" value="{{ __('Login Now') }}">
                     </div>
                                            
                                        </div>
                                        <!-- login form  end-->
                                        <div class="form-group">
                                            <input type="checkbox" name="" id="">
                                            <label for=""> 様々な就職 仕事をお探しの方に対する様々な就職 </label>
                                        </div>
                                        <small> 様々な就職 仕事をお探しの方に対する様々な就職 </small>
                                        <div class="condition-list">
                                            <button> <i class="fa fa-chevron-right" aria-hidden="true"></i> 様々な就職 仕事をお探しの方に対する様々な就職  </button>
                                            <button> <i class="fa fa-chevron-right" aria-hidden="true"></i> 様々な就職 仕事をお探しの方に対する様々な就職  </button>
                                        </div>
                                    </form>
                                    <!-- sign up form -->
                                    <!-- <div class="newuser"><i class="fa fa-user" aria-hidden="true"></i>
                                        {{ __('New User') }}? <a
                                            href="{{ route('register') }}">{{ __('Register Here') }}</a></div> -->

                                    <!-- sign up form end-->

                                    
                                   

                                </div>
                                <div id="employer"
                                    class="formpanel mt-0 tab-pane fade {{ $c_or_e == 'employer' ? 'active' : '' }}">
                                    <!-- <div class="socialLogin">
                                        <h5>{{ __('Login with Social') }}</h5>
                                        <a href="{{ url('login/employer/facebook') }}" class="fb"><i
                                                class="fab fa-facebook" aria-hidden="true"></i></a> <a
                                            href="{{ url('login/employer/twitter') }}" class="tw"><i
                                                class="fab fa-twitter" aria-hidden="true"></i></a>
                                    </div>

                                    <div class="divider-text-center"><span>{{ __('Or login with your account') }}</span>
                                    </div> -->
                                    <div class="condition">
                                        <article>
                                            <p> 
                                                仕事をお探しの方に対する様々な就職 仕事をお探しの方に対する様々な就職 
                                                仕事をお探しの方に対する様々な就職 仕事をお探しの方に対する様々な就職 
                                                仕事をお探しの方に対する様々な就職 仕事をお探しの方に対する様々な就職 
                                            </p>
                                        </article>
                                        <div class="condition-list">
                                            <button> <i class="fa fa-chevron-right" aria-hidden="true"></i> 様々な就職 仕事をお探しの方に対する様々な就職  </button>
                                            <button> <i class="fa fa-chevron-right" aria-hidden="true"></i> 様々な就職 仕事をお探しの方に対する様々な就職  </button>
                                        </div>
                                    </div>

                                    <form class="form-horizontal" method="POST" action="{{ route('company.login') }}">
                                        {{ csrf_field() }}
                                        <input type="hidden" name="candidate_or_employer" value="employer" />
                                        <div class="formpanel form-box">
                                            <div class="formrow{{ $errors->has('email') ? ' has-error' : '' }}">
                                                <input id="email" type="email" class="form-control" name="email"
                                                    value="{{ old('email') }}" required autofocus
                                                    placeholder="{{ __('Email Address') }}">
                                                @if ($errors->has('email'))
                                                    <span class="help-block">
                                                        <strong>{{ $errors->first('email') }}</strong>
                                                    </span>
                                                @endif
                                            </div>
                                            <div class="formrow{{ $errors->has('password') ? ' has-error' : '' }}">
                                                <input id="password" type="password" class="form-control"
                                                    name="password" value="" required
                                                    placeholder="{{ __('Password') }}">
                                                @if ($errors->has('password'))
                                                    <span class="help-block">
                                                        <strong>{{ $errors->first('password') }}</strong>
                                                    </span>
                                                @endif
                                            </div>
                                            <!-- <div class="mb-3"><i class="fas fa-lock" aria-hidden="true"></i>
                                                {{ __('Forgot Your Password') }}? <a
                                                    href="{{ route('company.password.request') }}">{{ __('Click here') }}</a>
                                            </div> -->

                                            <div class="submit-button">
                                            <input type="submit" class="btn" value="Login Now">
                                            {{-- {{ __(' ログイン') }} --}}
                                            </div>

                                            
                                        </div>
                                        <!-- login form  end-->
                                        <div class="form-group">
                                            <input type="checkbox" name="" id="">
                                            <label for=""> 様々な就職 仕事をお探しの方に対する様々な就職 </label>
                                        </div>
                                        <small> 様々な就職 仕事をお探しの方に対する様々な就職 </small>
                                        <div class="condition-list">
                                            <button> <i class="fa fa-chevron-right" aria-hidden="true"></i> 様々な就職 仕事をお探しの方に対する様々な就職  </button>
                                            <button> <i class="fa fa-chevron-right" aria-hidden="true"></i> 様々な就職 仕事をお探しの方に対する様々な就職  </button>
                                        </div>
                                    </form>
                                    <!-- sign up form -->
                                    <!-- <div class="newuser"><i class="fas fa-user" aria-hidden="true"></i>
                                        {{ __('New User') }}? <a
                                            href="{{ route('register') }}">{{ __('Register Here') }}</a></div> -->

                                    <!-- sign up form end-->
                                    
                                    
                                </div>
                            </div>
                            <!-- login form -->



                        </div>
                    </div>
                </div>

            </div>

        </div>
    </div>


    @include('includes.footer')
@endsection
