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
                    <li> <a href="{{ route('admin.jiIndex') }}">Industry</a> <i class="fa fa-circle"></i> </li>
                    <li> <span>Add Industry</span> </li>

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
                                <span class="caption-subject bold uppercase">Industry Form</span>
                            </div>

                            <div class="actions">
                                <a href="{{ route('admin.jscIndex') }}" class="btn btn-xs btn-success"><i
                                        class="glyphicon glyphicon-plus"></i> All
                                    Industry</a>
                            </div>
                        </div>
                        <div class="portlet-body form">
                            <form action="{{ route('admin.jiSave') }}" method="post" enctype="multipart/form-data">
                                @csrf
                                <div class="form-row">
                                    <div class="form-group col-md-3">
                                        <label for="inputEmail4">Language</label>
                                        <select name="lan" id="" class="form-control">
                                            <option selected disabled>Select</option>
                                            @foreach ($language as $el)
                                                <option value="{{ $el->native }}">{{ $el->lang }} -
                                                    {{ $el->native }}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                    <div class="form-group col-md-3">
                                        <label for="inputEmail4">Category</label>
                                        <select name="category_id" id="category_id" class="form-control">
                                            <option selected disabled>Select</option>
                                            @foreach ($jobcategory as $cat)
                                                <option value="{{ $cat->id }}">{{ $cat->name }}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                    <div class="form-group col-md-3">
                                        <label for="inputEmail4">Sub Category</label>
                                        <span id="default_sub_category_dd">
                                        <select name="sub_category_id" id="" class="form-control">
                                            <option selected disabled>Select</option>

                                        </select>
                                        </span>
                                    </div>
                                    <div class="form-group col-md-3">
                                        <label for="inputEmail4">Industry</label>
                                        <select name="industry_id" id="" class="form-control">
                                            <option selected disabled>Select</option>
                                            @foreach ($inds as $in)
                                                <option value="{{ $in->id }}">{{ $in->industry }}</option>
                                            @endforeach
                                        </select>
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

@push('scripts')

    <script type="text/javascript">
        $(document).ready(function() {



            $('#category_id').on('change', function(e) {
                //alert(32)
                e.preventDefault();
                filterDefaultSubCategory(0);
            });


            filterDefaultSubCategory(<?php echo old('sub_category_id', isset($job) ? $job->sub_category_id : 0); ?>);


        });





        function filterDefaultSubCategory(sub_category_id) {
            var category_id = $('#category_id').val();
            if (category_id != '') {
                $.post("{{ route('filter.default.sub.category.dropdown') }}", {
                    category_id: category_id,
                    sub_category_id: sub_category_id,

                    _method: 'POST',
                    _token: '{{ csrf_token() }}'
                })
                    .done(function(response) {
                        // console.log(response);
                        $('#default_sub_category_dd').html(response);
                    });
            }
        }
    </script>
@endpush
