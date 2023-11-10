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
                    <li> <a href="{{ route('admin.growthIndex') }}">Comapny Growth</a> <i class="fa fa-circle"></i> </li>
                    <li> <span>Add Comapny Growth</span> </li>
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
                                    class="caption-subject bold uppercase">Growth Form</span> </div>
                        </div>
                        <div class="portlet-body form">
                            <form action="{{ route('admin.growthSave') }}" method="post" enctype="multipart/form-data">
                                @csrf
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="inputEmail4">Short Title</label>
                                        <input type="text" name="short_title" class="form-control"
                                            placeholder="Growth Short Title">
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="inputCity">Title</label>
                                        <input type="text" placeholder="Growth Title" name="title"
                                            class="form-control">
                                    </div>
                                </div>

                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="inputCity">Left Image</label>
                                        <input type="file" name="leftimage" class="form-control">
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="inputCity">Right Image</label>
                                        <input type="file" name="rightimage" class="form-control">
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-12">
                                        <label for="inputCity">Note</label>
                                        <textarea type="text" name="note" placeholder="Important note" class="form-control"></textarea>
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
