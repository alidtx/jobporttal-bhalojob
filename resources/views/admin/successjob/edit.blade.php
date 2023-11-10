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
                    <li> <a href="{{ route('admin.successIndex') }}">Success job</a> <i class="fa fa-circle"></i> </li>
                    <li> <span>Edit Success job</span> </li>
                </ul>
            </div>
            <!-- END PAGE BAR -->
            <!-- END PAGE HEADER-->
            <br />
            @if ($errors->any())
                <div class="alert alert-danger">
                    <ul>
                        @foreach ($errors->all() as $error)
                            <li>{{ $error }}</li>
                        @endforeach
                    </ul>
                </div>
            @endif
            <div class="row">
                <div class="col-md-12">
                    <div class="portlet light bordered">
                        <div class="portlet-title">
                            <div class="caption font-red-sunglo"> <i class="icon-settings font-red-sunglo"></i> <span
                                    class="caption-subject bold uppercase">Success job Form</span> </div>
                        </div>
                        <div class="portlet-body form">
                            <form action="{{ route('admin.successUpdate') }}" method="post" enctype="multipart/form-data">
                                @csrf
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="inputEmail4">Name</label>
                                        <input type="text" name="name" value="{{ $olduserdata->name }}"
                                            class="form-control" placeholder="Student Name">
                                        <input type="hidden" name="oldId" value="{{ $olduserdata->id }}">
                                        <input type="hidden" name="oldImage" value="{{ $olduserdata->image }}">
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="inputPassword4">Age</label>
                                        <input type="number" name="age" value="{{ $olduserdata->age }}"
                                            class="form-control" id="" placeholder="Student Age">
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="inputState">Privious Position</label>
                                        <input type="text" name="pri_position" value="{{ $olduserdata->pri_position }}"
                                            placeholder="Privious Position" class="form-control">
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="inputState">Current Position</label>
                                        <input type="text" name="curr_position" value="{{ $olduserdata->curr_position }}"
                                            placeholder="Current Position" class="form-control">
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-12">
                                        <label for="inputCity">Description</label>
                                        <textarea type="text" id="description" rows="1" name="description" class="form-control" placeholder="Short Description"
                                            id="inputCity">{{ $olduserdata->description }}</textarea>
                                    </div>
                                    <div class="form-group col-md-8">
                                        <label for="inputCity">Image</label>
                                        <input type="file" name="image" class="form-control">
                                    </div>
                                    <div class="form-group col-md-4" style="margin-top : 13px">
                                        <img width="50px" src="{{ asset('successjob/' . $olduserdata->image) }}"
                                            alt="">
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="inputState">Gender</label>
                                        <input type="radio" name="gender"
                                            {{ $olduserdata->gender == 'Male' ? 'checked' : '' }} value="Male">
                                        Male
                                        <input type="radio" name="gender"
                                            {{ $olduserdata->gender == 'Female' ? 'checked' : '' }} value="Female"> Female
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="inputState">Is Feature</label>
                                        <input type="radio" name="is_feature"
                                            {{ $olduserdata->is_feature == '1' ? 'checked' : '' }} value="1"> Yes
                                        <input type="radio" name="is_feature"
                                            {{ $olduserdata->is_feature == '0' ? 'checked' : '' }} value="0"> No
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-12">
                                        <label for="inputState">Status</label>
                                        <input type="radio" name="is_active"
                                            {{ $olduserdata->is_active == '1' ? 'checked' : '' }} value="1"> Yes
                                        <input type="radio" name="is_active"
                                            {{ $olduserdata->is_active == '0' ? 'checked' : '' }} value="0"> No
                                    </div>
                                </div>
                                <br>
                                <button type="submit" style="margin-left: 13px" class=" btn btn-primary">UPDATE</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <!-- END CONTENT BODY -->
        </div>
        @include('admin.shared.tinyMCEFront')
    @endsection
