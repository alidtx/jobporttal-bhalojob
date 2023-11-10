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
                    <li> <a href="{{ route('admin.aboutIndex') }}">Service</a> <i class="fa fa-circle"></i> </li>
                    <li> <span>Edit Service</span> </li>
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
                                    class="caption-subject bold uppercase">Service Form</span> </div>
                        </div>
                        <div class="portlet-body form">
                            <form action="{{ route('admin.jsUpdate') }}" method="post" enctype="multipart/form-data">
                                @csrf
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="inputEmail4">Category</label>
                                        <select name="category_id" id="" class="form-control">
                                            <option selected disabled>Select</option>


                                            @foreach($serviceCategory as $key => $value)
                                            <option  @if ($oldjsdata->category_id == $value->id) selected='selected' @endif value="{{$value->id}}">{{$value->name}}</option>
                                            @endforeach
                                           

                                        </select>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="inputEmail4">Title</label>
                                        <input type="text" name="title" class="form-control"
                                            value="{{ $oldjsdata->title }}" placeholder="Service Title">
                                        <input type="hidden" name="oldId" value="{{ $oldjsdata->id }}">
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="inputEmail4">Icon</label>
                                        <input type="text" name="fa" class="form-control"
                                            value="{{ $oldjsdata->fa }}" placeholder="Service Icon">

                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="inputEmail4">Image</label>
                                        <input type="hidden" name="oldImage" value="{{ $oldjsdata->image }}">
                                        <input type="file" name="image" class="form-control"  placeholder="Service Title">

                                    </div>
                                  
                                </div>
                                <div class="form-row">
                                <div class="form-group col-md-12">
                                        <label for="inputCity">Description</label>
                                        <textarea type="text" placeholder="Service Details" id="description" name="description" class="form-control">{{ $oldjsdata->description }}</textarea>
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
    @include('admin.shared.tinyMCEFront')
@endsection
