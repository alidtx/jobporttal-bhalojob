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
                    <li> <span>Contact</span> </li>
                </ul>
            </div>
            <!-- END PAGE BAR -->
            <!-- BEGIN PAGE TITLE-->
            <h3 class="page-title">Manage Contact Us <small>Contact</small> </h3>
            <!-- END PAGE TITLE-->
            <!-- END PAGE HEADER-->
            @include('flash::message')
            <div class="row">
                <div class="col-md-12">
                    <!-- Begin: life time stats -->
                    <div class="portlet light portlet-fit portlet-datatable bordered">
                        <div class="portlet-title">
                            <div class="caption"> <i class="icon-settings font-dark"></i> <span
                                    class="caption-subject font-dark sbold uppercase">Contact</span> </div>
                            <!-- <div class="actions"> <a href="{{ route('admin.aboutCreate') }}"
                                    class="btn btn-xs btn-success"><i class="glyphicon glyphicon-plus"></i> Add New
                                    About</a> </div> -->
                        </div>
                        <div class="portlet-body">
                            <div class="table-container">
                                <table class="table table-bordered">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Name</th>
                                            <th>Phone</th>
                                            <th>Email</th>
                                            <th>Address</th>
                                            <th>Date</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @php
                                            $i = 1;
                                        @endphp
                                        @foreach ($allcontactdata as $each)
                                            <tr>
                                                <th>{{ $i++ }}</th>
                                                <td>{{ $each->full_name }}</td>
                                                <td>{{ $each->phone }}</td>
                                                <td>{{ $each->email }}</td>
                                                <td>{{ $each->address }}</td>
                                                <td>{{ $each->created_at }}</td>
                                                <td> <a href="{{route('admin.downloadexcel')}}">Download CSV</a></td>
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
    <script>
        $(function() {
            var oTable = $('#testimonialDatatableAjax').DataTable({
                processing: true,
                serverSide: true,
                stateSave: true,
                searching: false,
                /*		
                 "order": [[1, "asc"]],            
                 paging: true,
                 info: true,
                 */
                ajax: {
                    url: '{!! route('fetch.data.testimonials') !!}',
                    data: function(d) {
                        d.lang = $('#lang').val();
                        d.testimonial_by = $('#testimonial_by').val();
                        d.testimonial = $('#testimonial').val();
                        d.is_active = $('#is_active').val();
                    }
                },
                columns: [{
                        data: 'lang',
                        name: 'lang'
                    },
                    {
                        data: 'testimonial_by',
                        name: 'testimonial_by'
                    },
                    {
                        data: 'testimonial',
                        name: 'testimonial'
                    },
                    {
                        data: 'action',
                        name: 'action',
                        orderable: false,
                        searchable: false
                    }
                ]
            });
            $('#testimonial-search-form').on('submit', function(e) {
                oTable.draw();
                e.preventDefault();
            });
            $('#lang').on('change', function(e) {
                oTable.draw();
                e.preventDefault();
            });
            $('#testimonial_by').on('keyup', function(e) {
                oTable.draw();
                e.preventDefault();
            });
            $('#testimonial').on('keyup', function(e) {
                oTable.draw();
                e.preventDefault();
            });
            $('#is_active').on('change', function(e) {
                oTable.draw();
                e.preventDefault();
            });
        });

        function deleteTestimonial(id, is_default) {
            var msg = 'Are you sure?';
            if (is_default == 1) {
                msg =
                    'Are you sure? You are going to delete default Testimonial, all other non default Testimonials will be deleted too!';
            }
            if (confirm(msg)) {
                $.post("{{ route('delete.testimonial') }}", {
                        id: id,
                        _method: 'DELETE',
                        _token: '{{ csrf_token() }}'
                    }, null, 'text')
                    .done(function(response) {
                        if (response == 'ok') {
                            var table = $('#testimonialDatatableAjax').DataTable();
                            table.row('testimonialDtRow' + id).remove().draw(false);
                        } else {
                            alert('Request Failed!');
                        }
                    });
            }
        }

        function makeActive(id) {
            $.post("{{ route('make.active.testimonial') }}", {
                    id: id,
                    _method: 'PUT',
                    _token: '{{ csrf_token() }}'
                })
                .done(function(response) {
                    if (response == 'ok') {
                        var table = $('#testimonialDatatableAjax').DataTable();
                        table.row('testimonialDtRow' + id).remove().draw(false);
                    } else {
                        alert('Request Failed!');
                    }
                });
        }

        function makeNotActive(id) {
            $.post("{{ route('make.not.active.testimonial') }}", {
                    id: id,
                    _method: 'PUT',
                    _token: '{{ csrf_token() }}'
                })
                .done(function(response) {
                    if (response == 'ok') {
                        var table = $('#testimonialDatatableAjax').DataTable();
                        table.row('testimonialDtRow' + id).remove().draw(false);
                    } else {
                        alert('Request Failed!');
                    }
                });
        }
    </script>
@endpush
