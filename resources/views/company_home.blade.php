@extends('layouts.app')

@section('content') 

<!-- Header start --> 

@include('includes.header') 

<!-- Header end --> 






<!-- Inner Page Title start --> 

@include('includes.inner_page_title', ['page_title'=>__('Dashboard')]) 

<!-- Inner Page Title end -->
<div class="listpgWraper">
<div class="container">
@include('flash::message')  

  <div class="row">
  <div class="col-md-9 "> 
      @include('includes.company_dashboard_stats')
    
  </div>

   <div class="col-md-3"> 
       @include('includes.company_dashboard_menu')
    </div>
</div>
</div>
</div>



















@include('includes.footer')

@endsection

@push('scripts')

@include('includes.immediate_available_btn')

@endpush

