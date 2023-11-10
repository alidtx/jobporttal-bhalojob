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
                    <li> <a href="{{ route('admin.growthIndex') }}">Growth</a> <i class="fa fa-circle"></i> </li>
                    <li> <span>Edit Growth</span> </li>
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
                            <form action="{{ route('admin.growthUpdate') }}" method="post" enctype="multipart/form-data">
                                @csrf
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="inputEmail4">Short Title</label>
                                        <input type="text" name="short_title" value="{{ $oldgrowthdata->short_title }}"
                                            class="form-control" placeholder="Growth Short Title">
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="inputCity">Title</label>
                                        <input type="text" placeholder="Growth Title" value="{{ $oldgrowthdata->title }}"
                                            name="title" class="form-control">


                                        <input type="hidden" name="oldId" value="{{ $oldgrowthdata->id }}">
                                        <input type="hidden" name="oldleftimage" value="{{ $oldgrowthdata->leftimage }}">
                                        <input type="hidden" name="oldrightimage" value="{{ $oldgrowthdata->rightimage }}">
                                    </div>
                                </div>

                                <div class="form-row">
                                    <div class="form-group col-md-4">
                                        <label for="inputCity">Left Image</label>
                                        <input type="file" name="leftimage" class="form-control">
                                    </div>
                                    <div class="form-group col-md-2">
                                        <img style="margin-top: 25px" width="50px"
                                            src="{{ asset('growth/' . $oldgrowthdata->leftimage) }}" alt="">
                                    </div>
                                    <div class="form-group col-md-4">
                                        <label for="inputCity">Right Image</label>
                                        <input type="file" name="rightimage" class="form-control">
                                    </div>
                                    <div class="form-group col-md-2">
                                        <img style="margin-top: 25px" width="50px"
                                            src="{{ asset('growth/' . $oldgrowthdata->rightimage) }}" alt="">
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-12">
                                        <label for="inputCity">Note</label>
                                        <textarea type="text" name="note" placeholder="Important note" class="form-control">{{ $oldgrowthdata->note }}</textarea>
                                    </div>
                                </div>
                                <div class="form-row">

                                    <div class="form-group col-md-12">
                                        <label for="inputState">Status</label> <br>
                                        <input type="radio" name="status"
                                            {{ $oldgrowthdata->status == '1' ? 'checked' : '' }} value="1"> Yes
                                        <input type="radio" name="status"
                                            {{ $oldgrowthdata->status == '0' ? 'checked' : '' }} value="0"> No
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
