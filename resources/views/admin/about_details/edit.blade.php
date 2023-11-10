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
                    <li> <a href="{{ route('admin.aboutDetailsIndex') }}">About Details</a> <i class="fa fa-circle"></i> </li>
                    <li> <span>Edit About Details</span> </li>
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
                                    class="caption-subject bold uppercase">About Details Form</span> </div>
                        </div>
                        <div class="portlet-body form">
                            <form action="{{ route('admin.aboutDetailsUpdate') }}" method="post"
                                enctype="multipart/form-data">
                                @csrf

                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="inputEmail4">About</label>
                                        <select name="about_id" id="" class="form-control">
                                            <option value="" selected disabled>Select</option>
                                            @foreach ($alldetails as $each)
                                                <option @if ($olduserdata->about_id === $each->id) selected='selected' @endif
                                                    value="{{ $each->id }}">{{ $each->title }}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="inputEmail4">Date</label>
                                        <input type="date" value="{{ $olduserdata->date }}" name="date"
                                            class="form-control datepicker" placeholder="About Title">

                                        <input type="hidden" name="oldId" value="{{ $olduserdata->id }}">
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-12">
                                        <label for="inputEmail4">Details</label>
                                        <textarea type="text" name="details" class="form-control" placeholder="Merit Details ">{{ $olduserdata->details }}</textarea>
                                    </div>
                                </div>

                                <button type="submit" class="btn btn-primary">UPDATE</button>


                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <!-- END CONTENT BODY -->
        </div>
    </div>
@endsection
