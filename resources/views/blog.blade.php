@extends('layouts.app')
@section('content')
    <!-- Header start -->
    @include('includes.header')
    <!-- Header end -->
    <!-- Inner Page Title start -->
    @include('includes.inner_page_title', ['page_title'=>__('Blog')])
    <!-- Inner Page Title end -->
    <div class="listpgWraper">
        <section id="blog-content">
            <div class="container">
                <!-- Blog start -->
                <div class="row">
                    @include('includes.blog_search')
                    <div class="col-lg-12">
                        <!-- Blog List start -->
                        <div class="blogwrapper">
                            <ul class="blogList row">
                                @if(null!==($blogs))
                                        <?php
                                        $count = 1;
                                        ?>
                                    @foreach($blogs as $blog)
                                            <?php
                                            $cate_ids = explode(",", $blog->cate_id);
                                            $data = DB::table('blog_categories')->whereIn('id', $cate_ids)->get();
                                            $cate_array = array();
                                            foreach ($data as $cat) {
                                                $cate_array[] = "<a href='" . url('/blog/category/') . "/" . $cat->slug . "'>$cat->heading</a>";
                                            }
                                            ?>
                                        <li class="col-lg-3">
                                            <div class="bloginner">
                                                <div class="post-header">
                                                    <h4><a href="{{route('blog-detail',$blog->slug)}}">{{$blog->heading}}</a></h4>
                                                    {{--                                                    <div class="postmeta">Category : {!!implode(', ',$cate_array)!!}--}}
                                                    {{--                                                    </div>--}}
                                                </div>
                                                <div class="postimg">{{$blog->printBlogImage()}}</div>
{{--                                                <p>{!! \Illuminate\Support\Str::limit($blog->content, $limit = 150, $end = '...') !!}</p>--}}
                                            </div>
                                        </li>
                                            <?php $count++; ?>
                                    @endforeach
                                @endif
                            </ul>
                        </div>
                        <!-- Pagination -->
                        <div class="pagiWrap">
                            <nav aria-label="Page navigation example">
                                @if(isset($blogs) && count($blogs))
                                    {{ $blogs->appends(request()->query())->links() }} @endif
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>


    @include('includes.footer')
@endsection
@push('styles')
    <style>
        .plus-minus-input {
            -webkit-align-items: center;
            -ms-flex-align: center;
            align-items: center;
        }

        .plus-minus-input .input-group-field {
            text-align: center;
            margin-left: 0.5rem;
            margin-right: 0.5rem;
            padding: 0rem;
        }

        .plus-minus-input .input-group-field::-webkit-inner-spin-button,
        .plus-minus-input .input-group-field ::-webkit-outer-spin-button {
            -webkit-appearance: none;
            appearance: none;
        }

        .plus-minus-input .input-group-button .circle {
            border-radius: 50%;
            padding: 0.25em 0.8em;
        }
    </style>
@endpush
@push('scripts')
    @include('includes.immediate_available_btn')
    <script>
    </script>
@endpush