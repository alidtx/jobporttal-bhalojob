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
                    <li> <a href="{{ route('admin.jscIndex') }}">Sub Category</a> <i class="fa fa-circle"></i> </li>
                    <li> <span>Edit Sub Category</span> </li>
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
                                    class="caption-subject bold uppercase">Sub Category Form</span> </div>
                        </div>
                        <div class="portlet-body form">
                            <form action="{{ route('admin.jscUpdate') }}" method="post" enctype="multipart/form-data">
                                @csrf
                                <div class="form-row">
                                    <div class="form-group col-md-4">
                                        <label for="inputEmail4">Language</label>
                                        <select name="lan" id="" class="form-control">
                                            <option selected disabled>Select</option>
                                            @foreach ($language as $el)
                                                <option @if ($oldjsdata->lan === $el->native) selected='selected' @endif
                                                    value="{{ $el->native }}">{{ $el->lang }} -
                                                    {{ $el->native }}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                    <div class="form-group col-md-4">
                                        <label for="inputEmail4">Category</label>
                                        <select name="category_id" id="" class="form-control">
                                            <option selected disabled>Select</option>
                                            @foreach ($allcat as $cat)
                                                <option @if ($oldjsdata->category_id === $cat->id) selected='selected' @endif
                                                    value="{{ $cat->id }}">{{ $cat->name }}</option>
                                            @endforeach
                                        </select>
                                    </div>

                                    <div class="form-group col-md-4">
                                        <label for="inputEmail4">Sub Category Name</label>
                                        <input type="text" name="sub_name" value="{{ $oldjsdata->sub_name }}"
                                            class="form-control" placeholder="Category Name">
                                        <input type="hidden" name="oldid" value="{{ $oldjsdata->id }}">
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
