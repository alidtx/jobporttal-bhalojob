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

                 <li class="nav-item"><a class="nav-link {{($c_or_e == 'candidate')? 'active':''}}" data-toggle="tab" href="#candidate" aria-expanded="true">Candidate Registration</a></li>
                  {{-- {{__('求職者')}} --}}
                 <li class="nav-item"><a class="nav-link {{($c_or_e == 'employer')? 'active':''}}" data-toggle="tab" href="#employer" aria-expanded="false">Employer Registration</a></li>
                 {{-- {{__('企業向け')}} --}}

             </ul>

         </div>

     <div class="userccount whitebg">
         <div class="tab-content">
             <div id="candidate" class="formpanel mt-0 tab-pane {{($c_or_e == 'candidate')? 'active':''}}">
                <div class="header-title">
                    <h4>Register With Bhalojobs</h4>
                    <small> Register with the account bellow</small>
                </div>
                <div class="socialLogin">
                    <p> 仕事をお探しの方に対する様々な就職 仕事をお探しの方に対する様々な就職
                    仕事をお探しの方に対する様々な就職 仕事をお探しの方に対する様々な就職 </p>

                    {{-- <div class="social-login">
                        <div class="icon">
                        <a href="{{url('login/jobseeker/google')}}" class="bg-danger">
                            <i class="fab fa-google" aria-hidden="true"></i>
                            <span> Google </span>
                        </a>
                        </div>
                        <div class="icon">
                        <a href="{{ url('login/jobseeker/facebook') }}" class="fb">
                            <i class="fab fa-facebook" aria-hidden="true"></i>
                            <span> Facebook </span>
                        </a>
                        </div>
                        <!-- <div class="icon">
                        <a href="#" class="tw">
                            <i class="fab fa-yahoo" aria-hidden="true"></i>
                            <span> Yahoo </span>
                        </a>
                        </div>
                        <div class="icon">
                        <a href="#" class="tw">
                            <i class="fab fa-linkedin" aria-hidden="true"></i>
                            <span> Linkedin </span>
                        </a>
                        </div> -->
                    </div> --}}
                </div>

{{--                 <a href="{{ url('login/jobseeker/facebook')}}" class="fb"><i class="fab fa-facebook" aria-hidden="true"></i>asasasas</a>--}}

                 <form action="{{ route('register') }}" class="form-horizontal" method="POST" >
                     {{ csrf_field() }}

                 <article>
                    <p> Register with your email address </p>
                 </article>


                     <input type="hidden" name="candidate_or_employer" value="candidate" />



                         <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text" id="email"> <i class="fa fa-envelope" aria-hidden="true"></i> </span>
                            </div>
                            <input type="email" name="email" class="form-control" placeholder="email" aria-label="Username" aria-describedby="email">
                        </div>



                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text" > <i class="fa fa-unlock-alt" aria-hidden="true"></i> </span>
                            </div>
                            <input type="password" name="password" class="form-control" placeholder="{{__('Password')}}"  required="required" aria-label="Username" aria-describedby="{{__('Password')}}" value="">

                        </div>
                     <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text" > <i class="fa fa-unlock-alt" aria-hidden="true"></i> </span>
                            </div>

                         <input type="password" name="password_confirmation" class="form-control" required="required" placeholder="{{__('Password Confirmation')}}" value="">
                        </div>

                     <div class="submit-button">
                        <input type="submit" class="btn" value="Submit">
                     </div>
                  {{-- {{__('無料会員登録')}} --}}
                 </form>

             </div>

             <div id="employer" class="formpanel mt-0 tab-pane fade {{($c_or_e == 'employer')? 'active':''}}">

             <div class="header-title">
                    <h4> Register With Bhalojobs</h4>
                    <small> Register with the account bellow </small>
                </div>
                <div class="socialLogin">
                    <p> 仕事をお探しの方に対する様々な就職 仕事をお探しの方に対する様々な就職
                    仕事をお探しの方に対する様々な就職 仕事をお探しの方に対する様々な就職 </p>

                    {{-- <div class="social-login">
                        <div class="icon">
                        <a href="{{ url('login/employer/google')}}" class="bg-danger">
                            <i class="fab fa-google" aria-hidden="true"></i>
                            <span> Google </span>
                        </a>
                        </div>
                        <div class="icon">
                        <a href="{{ url('login/employer/facebook')}}" class="fb">
                            <i class="fab fa-facebook" aria-hidden="true"></i>
                            <span> Facebook </span>
                        </a>
                        </div>
                      
                    </div> --}}
                </div>

                 <form action="{{ route('company.register') }}" class="form-horizontal" method="POST" >
                     {{ csrf_field() }}

                     <article>
                         <p> Register with your email address </p>
                     </article>


                     <input type="hidden" name="candidate_or_employer" value="employer" />



                     <div class="input-group mb-3">
                         <div class="input-group-prepend">
                             <span class="input-group-text" id="email"> <i class="fa fa-envelope" aria-hidden="true"></i> </span>
                         </div>
                         <input type="email" name="email" class="form-control" placeholder="email" aria-label="Username" aria-describedby="email">
                     </div>



                     <div class="input-group mb-3">
                         <div class="input-group-prepend">
                             <span class="input-group-text" > <i class="fa fa-unlock-alt" aria-hidden="true"></i> </span>
                         </div>
                         <input type="password" name="password" class="form-control" placeholder="{{__('Password')}}"  required="required" aria-label="Username" aria-describedby="{{__('Password')}}" value="">

                     </div>
                     <div class="input-group mb-3">
                         <div class="input-group-prepend">
                             <span class="input-group-text" > <i class="fa fa-unlock-alt" aria-hidden="true"></i> </span>
                         </div>

                         <input type="password" name="password_confirmation" class="form-control" required="required" placeholder="{{__('Password Confirmation')}}" value="">
                     </div>

                     <div class="submit-button">
                         <input type="submit" class="btn" value="Submit">
                         {{-- {{__('無料会員登録')}} --}}
                     </div>

                 </form>
                        </div>
                    </div>
                </div>
            </div>
            </div>
        </div>

        <!-- <div class="col-lg-7">
        <div class="loginpageimg"><img src="{{asset('/')}}images/login-page-banner.png" alt=""></div>
        </div> -->

       </div>



    </div>

</div>

@include('includes.footer')

@endsection