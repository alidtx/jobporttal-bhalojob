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
                    <li> <span>Growth</span> </li>
                </ul>
            </div>
            <!-- END PAGE BAR -->
            <!-- BEGIN PAGE TITLE-->
            <h3 class="page-title">Company Growth <small>About</small> </h3>
            <!-- END PAGE TITLE-->
            <!-- END PAGE HEADER-->
            @include('flash::message')
            <div class="row">
                <div class="col-md-12">
                    <!-- Begin: life time stats -->
                    <div class="portlet light portlet-fit portlet-datatable bordered">
                        <div class="portlet-title">
                            <div class="caption"> <i class="icon-settings font-dark"></i> <span
                                    class="caption-subject font-dark sbold uppercase">About</span> </div>
                            <div class="actions"> <a href="{{ route('admin.growthCreate') }}"
                                    class="btn btn-xs btn-success"><i class="glyphicon glyphicon-plus"></i> Add New
                                    Company Growth</a> </div>
                        </div>
                        <div class="portlet-body">
                            <div class="table-container">
                                <table class="table table-bordered">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Short Title</th>
                                            <th>Title</th>
                                            <th>Left Image</th>
                                            <th>Right Image</th>
                                            <th>Status</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @php
                                            $i = 1;
                                        @endphp
                                        @foreach ($allgrowth as $each)
                                            <tr>
                                                <th>{{ $i++ }}</th>
                                                <td>{{ $each->short_title }}</td>
                                                <td>{{ $each->title }}</td>
                                                <td><img width="50px" src="{{ asset('growth/' . $each->leftimage) }}"
                                                        alt=""></td>
                                                <td><img width="50px" src="{{ asset('growth/' . $each->rightimage) }}"
                                                        alt=""></td>
                                                <td>
                                                    @if ($each->status == '1')
                                                        {{ 'Active' }}
                                                    @else
                                                        {{ 'Inactive' }}
                                                    @endif
                                                </td>
                                                <td>
                                                    <a href="{{ url('admin/growthEdit/' . $each->id) }}"
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
                        f
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
