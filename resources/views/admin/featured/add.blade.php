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
                    <li> <a href="{{ route('admin.fiIndex') }}">Featured</a> <i class="fa fa-circle"></i> </li>
                    <li> <span>Add Featured</span> </li>
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
                            <div class="caption font-red-sunglo">
                                <i class="icon-settings font-red-sunglo"></i>
                                <span class="caption-subject bold uppercase">Featured Form</span>
                            </div>
                            <div class="actions">
                                <a href="{{ route('admin.fiIndex') }}" class="btn btn-xs btn-success"><i
                                        class="glyphicon glyphicon-plus"></i> All
                                    Featured</a>
                            </div>
                        </div>
                        <div class="portlet-body form">
                            <form action="{{ route('admin.fiSave') }}" method="post" enctype="multipart/form-data">
                                @csrf
                                <div class="form-row">
                                    <div class="form-group col-md-4">
                                        <label for="inputEmail4">Institute</label>
                                        <select name="institute" id="" class="form-control">
                                            <option selected disabled>Select</option>
                                            <option value="1">Top Companies</option>
                                            <option value="2">Top Colleges</option>
                                            <option value="3">Top Japanese Language School</option>

                                        </select>
                                    </div>
                                    <div class="form-group col-md-4">
                                        <label for="inputEmail4">Company Name</label>
                                        <input type="text" name="name" class="form-control"
                                            placeholder="Company Name">
                                    </div>
                                    <div class="form-group col-md-4">
                                        <label for="inputEmail4">Logo</label>
                                        <input type="file" name="logo" class="form-control">
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
@endsection
