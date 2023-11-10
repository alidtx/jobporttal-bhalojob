<?php



$user_id = Auth::user()->id;
$education = App\ProfileEducation::find($user_id);
$Experience = App\ProfileExperience::find($user_id);
$langauge = App\ProfileLanguage::where('user_id', $user_id)->first();
$user = App\User::where('id', $user_id)->first();

// @dd($langauge); 

 function profilePercentageCalculatio($user, $education, $Experience, $langauge)
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
 $total= intval(profilePercentageCalculatio($user, $education, $Experience, $langauge));

?>

<style>
    .pcom{
    margin-bottom: 8px;
    font-size: 17px;
    color: black;
    font-weight: bold;
    }
</style>

<div class="col-lg-3"> 
  <p class="pcom">Your Profile Completed</p> 
<div class="progress">
  <div class="progress-bar bg-danger" role="progressbar" style="width: {{@$total}}%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">{{@$total}}%</div>
</div>    
	<div class="usernavwrap">

    <div class="switchbox">
        <div class="txtlbl">{{__('Immediate Available')}} <i class="fas fa-info-circle" data-toggle="popover" data-trigger="hover" data-placement="top" data-content="{{__('Are you immediate available')}}?" data-original-title="{{__('Are you immediate available')}}?" title="{{__('Are you immediate available')}}?"></i>
        </div>
        <div class="">
            <label class="switch switch-green"> @php
                $checked = ((bool)Auth::user()->is_immediate_available)? 'checked="checked"':'';
                @endphp
                <input type="checkbox" name="is_immediate_available" id="is_immediate_available" class="switch-input" {{$checked}} onchange="changeImmediateAvailableStatus({{Auth::user()->id}}, {{Auth::user()->is_immediate_available}});">
                <span class="switch-label" data-on="On" data-off="Off"></span> <span class="switch-handle"></span> </label>
        </div>
        <div class="clearfix"></div>
    </div>
    <ul class="usernavdash">
        <li class="{{ Request::url() == route('home') ? 'active' : '' }}"><a href="{{route('home')}}"><i class="fas fa-tachometer" aria-hidden="true"></i> {{__('Dashboard')}}</a>
        </li>
        <li class="{{ Request::url() == route('my.profile') ? 'active' : '' }}"><a href="{{ route('my.profile') }}"><i class="fas fa-pencil" aria-hidden="true"></i> {{__('Edit Profile')}}</a></li>
        <li><a href="{{ route('resume', Auth::user()->id) }}"><i class="fa fa-print" aria-hidden="true"></i> {{__('Print Resume')}}</a></li>
        <li><a href="{{ route('view.public.profile', Auth::user()->id) }}"><i class="fas fa-eye" aria-hidden="true"></i> {{__('View Public Profile')}}</a></li>
        <li class="{{ Request::url() == route('my.job.applications') ? 'active' : '' }}"><a href="{{ route('my.job.applications') }}"><i class="fas fa-desktop" aria-hidden="true"></i> {{__('My Job Applications')}}</a></li> 
        <li class="{{ Request::url() == route('my.favourite.jobs') ? 'active' : '' }}"><a href="{{ route('my.favourite.jobs') }}"><i class="fas fa-heart" aria-hidden="true"></i> {{__('My Favourite Jobs')}}</a></li>
        {{-- <li class="{{ Request::url() == route('my-alerts') ? 'active' : '' }}"><a href="{{ route('my-alerts') }}"><i class="fas fa-bullhorn" aria-hidden="true"></i> {{__('My Job Alerts')}}</a></li>  --}}
        <li><a href="{{url('my-profile#cvs')}}"><i class="fas fa-file" aria-hidden="true"></i> {{__('Manage Resume')}}</a></li>
         {{-- <li class="{{ Request::url() == route('my.messages') ? 'active' : '' }}"><a href="{{route('my.messages')}}"><i class="fas fa-envelope" aria-hidden="true"></i> {{__('My Messages')}}</a></li>  --}}
        <li class="{{ Request::url() == route('my.followings') ? 'active' : '' }}"><a href="{{route('my.followings')}}"><i class="fas fa-user" aria-hidden="true"></i> {{__('My Followings')}}</a></li>
        <li><a href="{{ route('logout') }}" onclick="event.preventDefault(); document.getElementById('logout-form').submit();"><i class="fas fa-sign-out" aria-hidden="true"></i> {{__('Logout')}}</a>
            <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                {{ csrf_field() }}
            </form>
        </li>
    </ul>
		</div>

    <!-- <div class="row">
        <div class="col-md-12">{!! $siteSetting->dashboard_page_ad !!}</div>
    </div> -->
		
</div>

<!-- <div class="modal fade mt-5" id="myModal" role="dialog">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header border-bottom-0">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body mt-5 mb-5 convocation">
                <a href="#" target="_blank"><p>Please complete your Profile</p></a>
            </div>
        </div>
    </div>
</div>

<script>
    $(function(){
        $('#myModal').modal('show');
    })    
</script> -->