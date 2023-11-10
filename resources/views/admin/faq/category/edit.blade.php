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
                    <li> <a href="{{ route('admin.aboutIndex') }}">FAQ Category</a> <i class="fa fa-circle"></i> </li>
                    <li> <span>Edit FAQ Category</span> </li>
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
                                    class="caption-subject bold uppercase">FAQ Category Form</span> </div>
                        </div>
                        <div class="portlet-body form">
                            <form action="{{ route('admin.faqcUpdate') }}" method="post" enctype="multipart/form-data">
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
                                        <label for="inputEmail4">Category Name</label>
                                        <input type="text" name="category_name" value="{{ $oldjsdata->category_name }}"
                                            class="form-control" placeholder="Category Name">
                                        <input type="hidden" name="oldid" value="{{ $oldjsdata->id }}">
                                    </div>
                                    <div class="form-group col-md-3">
                                        <label for="inputEmail4">Image</label>
                                        <input type="file" name="image" value="{{ $oldjsdata->category_name }}"
                                            class="form-control">
                                        <input type="hidden" name="oldid" value="{{ $oldjsdata->id }}">
                                        <input type="hidden" name="oldimage" value="{{ $oldjsdata->image }}">
                                    </div>
                                    <div class="form-group col-md-1" style="margin-top:10px">
                                        <img width="60px" src="{{ asset('faq/' . $oldjsdata->image) }}" alt="">
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
