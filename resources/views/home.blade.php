
<!-- Add Bootstrap CSS (Use the latest version) -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.5.0/dist/css/bootstrap.min.css">

<style>
    .content-alert-box{
        border-radius: 1.3rem !important;
        height:100px;
    }
    .alert-title{
        text-align:center;
        margin-top:-78px;
        font-weight: bold;
        font-size: 20px;
    }

</style>
<?php

$user_id = Auth::user()->id;
$education = App\ProfileEducation::find($user_id);
$Experience = App\ProfileExperience::find($user_id);
$langauge = App\ProfileLanguage::where('user_id', $user_id)->first();
$user = App\User::where('id', $user_id)->first();

// @dd($langauge); 


 function profilePercentageCalculation($user, $education, $Experience, $langauge)
 {    
    $totalFields = 45;
    // user/////////////////
    $filledFields=$user->first_name ? 1:0;
    $filledFields+=$user->last_name ? 1:0; 
    $filledFields+=$user->gender_id ? 1:0; 
    $filledFields+=$user->marital_status_id ? 1:0; 
    $filledFields+=$user->prefecture ? 1:0; 
    $filledFields+=$user->state_id_bd ? 1:0; 
    $filledFields+=$user->city_id_bd ? 1:0; 
    $filledFields+=$user->bd_postal_code ? 1:0; 
    $filledFields+=$user->bd_address ? 1:0; 
    $filledFields+=$user->bd_children ? 1:0; 
    $filledFields+=$user->jp_city ? 1:0; 
    $filledFields+=$user->bd_cell_phone ? 1:0; 
    $filledFields+=$user->jp_visa_expiry_year ? 1:0; 
    $filledFields+=$user->jp_visa_expiry_month ? 1:0; 
    $filledFields+=$user->jp_visa_expiry_day ? 1:0; 
    $filledFields+=$user->emergency_cell_phone ? 1:0; 
    $filledFields+=$user->current_visa_status_id ? 1:0; 
    $filledFields+=$user->emergency_contact_jp ? 1:0; 
    $filledFields+=$user->jp_cell_phone ? 1:0; 
    $filledFields+=$user->birth_year ? 1:0; 
    $filledFields+=$user->birth_month ? 1:0; 
    $filledFields+=$user->birth_day ? 1:0; 

   // Education Profile/////////////////

   $filledFields+=$education->entrance_year ? 1:0; 
   $filledFields+=$education->entrance_month ? 1:0; 
   $filledFields+=$education->pass_year ? 1:0; 
   $filledFields+=$education->pass_month ? 1:0; 
   $filledFields+=$education->institution_name ? 1:0; 

   // Experience  Profile/////////////////

   $filledFields+=$Experience->title ? 1:0; 
   $filledFields+=$Experience->company ? 1:0; 
   $filledFields+=$Experience->country_id ? 1:0; 
   $filledFields+=$Experience->state_id ? 1:0; 
   $filledFields+=$Experience->city_id ? 1:0; 
   $filledFields+=$Experience->entrance_year ? 1:0; 
   $filledFields+=$Experience->entrance_month ? 1:0; 
   $filledFields+=$Experience->pass_year ? 1:0; 
   $filledFields+=$Experience->pass_month ? 1:0; 
   $filledFields+=$Experience->is_currently_working ? 1:0; 
   $filledFields+=$Experience->description ? 1:0; 

// Experience  Profile/////////////////

    $filledFields+=@$langauge->pass_year ? 1:0; 
    $filledFields+=@$langauge->pass_month ? 1:0; 
    $filledFields+=@$langauge->entrance_year ? 1:0; 
    $filledFields+=@$langauge->entrance_month ? 1:0; 
    $filledFields+=@$langauge->language_id ? 1:0; 
    $filledFields+=@$langauge->language_type_id ? 1:0; 
    $filledFields+=@$langauge->language_level_id ? 1:0; 

$percentage = $filledFields / $totalFields * 100;

    return $percentage;
 }     
 $total= intval(profilePercentageCalculation($user, $education, $Experience, $langauge));
?>

  @if( $total < 100)  
  <div class="modal fade mt-5 " id="myModal" role="dialog">
    <div class="modal-dialog modal-lg">
        <div class="modal-content content-alert-box">
            <div class="modal-header border-bottom-0">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body mt-5 mb-5 alert-box">
                <p class="alert-title"> You have completed {{$total}}% of your Profile!!!! Please complete it.</p>
            </div>
        </div>
    </div>
</div>
  @endif 



<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.5.0/dist/js/bootstrap.min.js"></script>


<script>
     $(document).ready(function() {
        $(function(){
        $('#myModal').modal('show');
        })   
        });
</script>

@extends('layouts.app')

@section('content')

    <!-- Header start -->

    @include('includes.header')

    <!-- Header end -->

    <!-- Inner Page Title start -->
    {{--@include('includes.inner_top_search')--}}
    @include('job.inc.main_job_search')


    <!-- Inner Page Title end -->
 

    <div class="listpgWraper">

        <div class="container">@include('flash::message')

            <div class="row"> @include('includes.user_dashboard_menu')

                <div class="col-lg-9">


                    <div class="profileban">

                        <div class="abtuser">

                            <div class="row">

                                <div class="col-lg-2 col-md-2">

                                    <div class="uavatar">{{auth()->user()->printUserImage()}}</div>

                                </div>

                                <div class="col-lg-10 col-md-10">

                                    <div class="row">

                                        <div class="col-lg-7">

                                            <h4>{{auth()->user()->name}}</h4>

                                            <h6><i class="fas fa-map-marker"
                                                   aria-hidden="true"></i> {{Auth::user()->getLocation()}}</h6>

                                        </div>

                                        <div class="col-lg-5">
                                            <div class="editbtbn"><a href="{{ route('my.profile') }}"><i
                                                            class="fas fa-pencil-alt" aria-hidden="true"></i> Edit
                                                    Profile</a>

                                            </div>
                                        </div>

                                    </div>


                                    <ul class="row userdata">

                                        <li class="col-lg-6 col-md-6"><i class="fas fa-phone"
                                                                         aria-hidden="true"></i> {{auth()->user()->phone}}
                                        </li>

                                        <li class="col-lg-6 col-md-6"><i class="fas fa-envelope"
                                                                         aria-hidden="true"></i> {{auth()->user()->email}}
                                        </li>

                                    </ul>


                                </div>

                            </div>

                        </div>

                    </div>


                    @include('includes.user_dashboard_stats')

                    @if((bool)config('jobseeker.is_jobseeker_package_active'))

                        @php

                            $packages = App\Package::where('package_for', 'like', 'job_seeker')->get();

                            $package = Auth::user()->getPackage();

                            if(null !== $package){

                            $packages = App\Package::where('package_for', 'like', 'job_seeker')->where('id', '<>', $package->id)->where('package_price', '>=', $package->package_price)->get();

                            }

                        @endphp



                        @if(null !== $package)

                            @include('includes.user_package_msg')

                            @include('includes.user_packages_upgrade')

                        @else

                            @if(null !== $packages)

                                @include('includes.user_packages_new')

                            @endif

                        @endif

                    @endif


                    <div class="row">

                        <div class="col-lg-7">

                            <div class="profbox">

                                <h3><i class="fab fa-black-tie"></i> Recommended Jobs</h3>

                                <ul class="recomndjobs">

                                    @if(null!==($matchingJobs))
                                        @foreach($matchingJobs as $match)

                                            <li>

                                                <h4>
                                                    <a href="{{route('job.detail', [$match->slug])}}">{{$match->title}}</a>
                                                </h4>

                                                <p>{{$match->getCompany()->name ?? ''}}</p>

                                            </li>

                                        @endforeach
                                    @endif

                                </ul>

                            </div>

                        </div>


                        <div class="col-lg-5">

                            <div class="profbox followbox">

                                <h3><i class="fas fa-users"></i> My Followings</h3>


                                <ul class="followinglist">

                                    @if(isset($followers) && null!==($followers))
                                        @foreach($followers as $follow)
                                            @php $company = DB::table('companies')->where('slug',$follow->company_slug)->where('is_active',1)->first(); @endphp
                                            @if(isset($company))
                                                <li>

                                                    <span>{{$company->name}}</span>

                                                    <p>{{$company->location}}</p>

                                                    <a href="{{route('company.detail',$company->slug)}}">{{__('View Details')}}</a>

                                                </li>
                                            @endif
                                        @endforeach
                                    @endif


                                </ul>


                                <div class="allbtn"><a href="{{route('my.followings')}}"><i class="fas fa-users"></i>
                                        View All</a>

                                </div>

                            </div>

                        </div>


                    </div>


                </div>


            </div>

        </div>

    </div>



<!-- <script>
    alert("dd");
      
</script> -->



@include('includes.footer')

@endsection

@push('scripts')

    @include('includes.immediate_available_btn')

@endpush

