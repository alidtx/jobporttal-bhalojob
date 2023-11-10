@extends('layouts.app')
@section('content') 
<!-- Header start --> 
@include('includes.header') 
<!-- Header end --> 
<!-- Inner Page Title start --> 
@include('includes.inner_page_title', ['page_title'=>__('Company Profile')]) 
<!-- Inner Page Title end -->
<div class="listpgWraper employ-profile-edit">
    <div class="container">
         <div class="row">
                  <div class="col-md-9"> 
                  <div class="userccount">
                   <div class="formpanel mt0"> @include('flash::message') 
                     @include('company.inc.profile')
                  </div>
                  </div>
                  </div>

                  <div class="col-md-3"> 
                 @include('includes.company_dashboard_menu')
                  </div>

         </div>    
    </div>
</div>
@include('includes.footer')
@endsection
@push('styles')
<style type="text/css">
    .userccount p{ text-align:left !important;}
</style>
@endpush