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
                    <li> <a href="{{ route('admin.caseIndex') }}">Case</a> <i class="fa fa-circle"></i> </li>
                    <li> <span>Edit Case</span> </li>
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
                                    class="caption-subject bold uppercase">Case Form</span> </div>
                        </div>
                        <div class="portlet-body form">
                            <form action="{{ route('admin.caseUpdate') }}" method="post" enctype="multipart/form-data">
                                @csrf
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="inputEmail4">Company</label>
                                        <select name="company_id" id="" class="form-control">
                                            <option value="" selected disabled>Select Company</option>

                                            @foreach ($company as $each)
                                                <option @if ($oldData->company_id === $each->id) selected='selected' @endif
                                                    value="{{ $each->id }}">{{ $each->name }} </option>
                                            @endforeach

                                        </select>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="inputPassword4">Title</label>
                                        <input type="text" name="title" value="{{ $oldData->title }}"
                                            class="form-control" id="" placeholder="Title here">

                                        <input type="hidden" name="oldId" value="{{ $oldData->id }}">
                                        <input type="hidden" name="oldImage" value="{{ $oldData->image }}">
                                    </div>
                                </div>

                                <div class="form-row">

                                    <div class="form-group col-md-4">
                                        <label for="inputCity">Image</label>
                                        <input type="file" name="image" class="form-control">
                                    </div>
                                    <div class="form-group col-md-2" style="margin-top : 25px">
                                        <img width="50px" src="{{ asset('case/' . $oldData->image) }}" alt="">
                                    </div>

                                    <div class="form-group col-md-6">
                                        <label for="inputState">Image Title</label>
                                        <input type="text" value="{{ $oldData->image_title }}" name="image_title"
                                            placeholder="Image title here" class="form-control">
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-12">
                                        <label for="inputState">Status</label>
                                        <input type="radio" name="is_active"
                                            {{ $oldData->is_active == '1' ? 'checked' : '' }} value="1"> Yes
                                        <input type="radio" name="is_active"
                                            {{ $oldData->is_active == '0' ? 'checked' : '' }} value="0"> No
                                    </div>
                                </div>


                                <button type="submit" style="margin-left: 13px" class=" btn btn-primary">UPDATE</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <!-- END CONTENT BODY -->
        </div>
    @endsection
