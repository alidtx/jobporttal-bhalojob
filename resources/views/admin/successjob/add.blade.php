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
                    <li> <a href="{{ route('admin.successIndex') }}">Success Job</a> <i class="fa fa-circle"></i> </li>
                    <li> <span>Add Success Job</span> </li>
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
                                    class="caption-subject bold uppercase">Success Job Form</span> </div>
                        </div>
                        <div class="portlet-body form">
                            <form action="{{ route('admin.successSave') }}" method="post" enctype="multipart/form-data">
                                @csrf
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="inputEmail4">Name</label>
                                        <input type="text" name="name" class="form-control"
                                            placeholder="Student Name">
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="inputPassword4">Age</label>
                                        <input type="number" name="age" class="form-control" id=""
                                            placeholder="Student Age">
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="inputState">Privious Position</label>
                                        <input type="text" name="pri_position" placeholder="Privious Position"
                                            class="form-control">
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="inputState">Current Position</label>
                                        <input type="text" name="curr_position" placeholder="Current Position"
                                            class="form-control">
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-12">
                                        <label for="inputCity">Description</label>
                                        <textarea type="text" rows="1"  id="description" name="description" class="form-control" placeholder="Short Description"
                                            id="inputCity"></textarea>
                                    </div>
                                 
                                </div>
                                <div class="form-row">

                                <div class="form-group col-md-12">
                                        <label for="inputCity">Image</label>
                                        <input type="file" name="image" class="form-control">
                                    </div>

                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="inputState">Gender</label>
                                        <input type="radio" name="gender" value="Male" checked> Male
                                        <input type="radio" name="gender" value="Female"> Female
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="inputState">Is Feature</label>
                                        <input type="radio" name="is_feature" value="1" checked> Yes
                                        <input type="radio" name="is_feature" value="0"> No
                                    </div>
                                </div>
                                <button type="submit" style="margin-left: 13px" class=" btn btn-primary">SAVE</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- END CONTENT BODY -->
    </div>
    @include('admin.shared.tinyMCEFront')
@endsection
