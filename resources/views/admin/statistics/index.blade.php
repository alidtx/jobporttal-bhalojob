@extends('admin.layouts.admin_layout')
@section('content')
    <style type="text/css">
        .table td,
        .table th {
            font-size: 12px;
            line-height: 2.42857 !important;
        }
    </style>
    <div class="page-content-wrapper">
        <!-- BEGIN CONTENT BODY -->
        <div class="page-content">
            <!-- BEGIN PAGE HEADER-->
            <!-- BEGIN PAGE BAR -->
            <div class="page-bar">
                <ul class="page-breadcrumb">
                    <li> <a href="{{ route('admin.home') }}">Home</a> <i class="fa fa-circle"></i> </li>
                    <li> <span>Service</span> </li>
                </ul>
            </div>
            <!-- END PAGE BAR -->
            <!-- BEGIN PAGE TITLE-->
            <h3 class="page-title">Manage  <small>Statistics</small> </h3>
            <!-- END PAGE TITLE-->
            <!-- END PAGE HEADER-->
            @include('flash::message')
            <div class="row">
                <div class="col-md-12">
                    <!-- Begin: life time stats -->
                    <div class="portlet light portlet-fit portlet-datatable bordered">
                        <div class="portlet-title">
                            <div class="caption"> <i class="icon-settings font-dark"></i> <span
                                        class="caption-subject font-dark sbold uppercase">Statistics</span> </div>
                            <div class="actions"> <a href="{{ route('admin.stCreate') }}" class="btn btn-xs btn-success"><i
                                            class="glyphicon glyphicon-plus"></i> Add New
                                    Service</a> </div>
                        </div>
                        <div class="portlet-body">
                            <div class="table-container">
                                <table class="table table-bordered">
                                    <thead>
                                    <tr>
                                        <th>#</th>

                                        <th>Title</th>
                                        <th>statistics ratio</th>
                                        <th>Description</th>
                                        <th>Status</th>
                                        <th>Action</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    @php
                                        $i = 1;
                                    @endphp
                                    @foreach ($statistics as $item)
                                        <tr>
                                            <th>{{ $i++ }}</th>
                                            <td> {{ $item->title }} </td>
                                            <td> {{ $item->statistics_ratio }} </td>


                                            <td><?php echo  $item->description ?></td>
                                            <td>
                                                @if ($item->status == 1)
                                                    {{ 'Active' }}
                                                @else
                                                    {{ 'Inactive' }}
                                                @endif
                                            </td>
                                            <td>
                                                <a href="{{ url('admin/stEdit/' . $item->id) }}"
                                                   class="btn btn-info btn-xs">EDIT</a>
                                            </td>
                                        </tr>
                                    @endforeach
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- END CONTENT BODY -->
    </div>
@endsection
@push('scripts')

@endpush
