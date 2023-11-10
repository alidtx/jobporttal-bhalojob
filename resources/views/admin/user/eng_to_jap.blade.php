@extends('admin.layouts.admin_layout')
@section('content')
<div class="page-content-wrapper"> 
    <!-- BEGIN CONTENT BODY -->
    <div class="page-content"> 
        <!-- BEGIN PAGE HEADER--> 
        <!-- BEGIN PAGE BAR -->
        <div class="page-bar">
            <ul class="page-breadcrumb">
                <li> <a href="{{ route('admin.home') }}">Home</a> <i class="fa fa-circle"></i> </li>
                <li> <a href="{{ route('list.users') }}">Users</a> <i class="fa fa-circle"></i> </li>
                <li> <span>Edit User</span> </li>
            </ul>
        </div>
        <!-- END PAGE BAR --> 
        <!-- BEGIN PAGE TITLE-->
        <!--<h3 class="page-title">Edit User <small>Users</small> </h3>-->
        <!-- END PAGE TITLE--> 
        <!-- END PAGE HEADER-->
        <br />
        @include('flash::message')
        <div class="row">
            <div class="col-md-12">
                <div class="portlet light bordered">
                    <div class="portlet-title">
                        <div class="caption font-red-sunglo"> <i class="icon-settings font-red-sunglo"></i> <span class="caption-subject bold uppercase">User Form</span> </div>            
                    </div>
                    <div class="portlet-body form">   

                        <ul class="nav nav-tabs">              
                            <li class="active"> <a href="#Details" data-toggle="tab" aria-expanded="false"> Personal Information </a> </li>
                            <li><a href="#Education" data-toggle="tab" aria-expanded="false"> Education History </a></li>
                            <li><a href="#Experience" data-toggle="tab" aria-expanded="false"> WORKING EXPERIENCE</a></li>
                            <li><a href="#Languages" data-toggle="tab" aria-expanded="false">LANGUAGE CERTIFICATION</a></li>
                            <li><a href="#Skills" data-toggle="tab" aria-expanded="false">OTHER CERTIFICATION</a></li>
                        </ul>
                        
                          <div class="tab-content">              
                            <div class="tab-pane fade active in" id="Details"> @include('admin.user.eng_to_jap_forms.form') </div>
                            <div class="tab-pane fade" id="Education"> @include('admin.user.eng_to_jap_forms.education.education') </div>
                            <div class="tab-pane fade" id="Experience"> @include('admin.user.eng_to_jap_forms.experience.experience') </div>
                            <div class="tab-pane fade" id="Languages"> @include('admin.user.eng_to_jap_forms.language.languages') </div>
                            <div class="tab-pane fade" id="Skills"> @include('admin.user.eng_to_jap_forms.skill.skills') </div>
                            <div class="tab-pane fade" id="CV"> @include('admin.user.eng_to_jap_forms.cv.cvs') </div>
                            <div class="tab-pane fade" id="Projects"> @include('admin.user.eng_to_jap_forms.project.projects') </div>
                         </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- END CONTENT BODY --> 
    </div>
    @endsection