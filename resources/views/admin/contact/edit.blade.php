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
                    <li> <a href="{{ route('admin.aboutIndex') }}">About</a> <i class="fa fa-circle"></i> </li>
                    <li> <span>Edit About</span> </li>
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
                                    class="caption-subject bold uppercase">About Form</span> </div>
                        </div>
                        <div class="portlet-body form">
                            <form action="{{ route('admin.aboutUpdate') }}" method="post" enctype="multipart/form-data">
                                @csrf
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="inputEmail4">Title</label>
                                        <input type="text" name="title" class="form-control"
                                            value="{{ $olduserdata->title }}" placeholder="About Title">

                                        <input type="hidden" name="oldId" value="{{ $olduserdata->id }}">
                                        <input type="hidden" name="leftoldImage" value="{{ $olduserdata->lfetimage }}">
                                        <input type="hidden" name="rightoldImage" value="{{ $olduserdata->rightimage }}">
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="inputCity">Description</label>
                                        <textarea type="text" placeholder="About Details" name="description" class="form-control">{{ $olduserdata->description }}</textarea>
                                    </div>
                                </div>

                                <div class="form-row">
                                    <div class="form-group col-md-4">
                                        <label for="inputCity">Left Image</label>
                                        <input type="file" name="lfetimage" class="form-control">
                                    </div>
                                    <div class="form-group col-md-2">
                                        <img style="margin-top: 25px" width="50px"
                                            src="{{ asset('about/' . $olduserdata->lfetimage) }}" alt="">
                                    </div>
                                    <div class="form-group col-md-4">
                                        <label for="inputCity">Right Image</label>
                                        <input type="file" name="rightimage" class="form-control">
                                    </div>
                                    <div class="form-group col-md-2">
                                        <img style="margin-top: 25px" width="50px"
                                            src="{{ asset('about/' . $olduserdata->rightimage) }}" alt="">
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
