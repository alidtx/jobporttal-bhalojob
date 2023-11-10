@extends('layouts.app')
@section('content')
    <!-- Header start -->
    @include('includes.header')
    <!-- Header end -->
    <!-- Inner Page Title start -->
    @include('includes.inner_page_title', ['page_title' => __('Frequently asked questions')])
    <!-- Inner Page Title end -->
    <!-- Page Title End -->
    <div class="listpgWraper">
        <div class="container">
            <!--Question-->
            <div class="row">
                @include('includes.faq_search')
                <div class="col-md-12">
                    <div class="row">
                        @foreach($faqcategories as $faqcategory)
                        <div class="col-md-3">
                            <div class="card faq-category">
                                <div class="images">
                                    <img src="{{ asset('faqlist/' . $faqcategory->image) }}" alt="">
                                </div>
                                <div class="content">
                                    <a href="{{route('faq_view',$faqcategory->id)}}"> {{$faqcategory->category_name}} <i class="fa fa-chevron-right" aria-hidden="true"></i> </a>
                                </div>
                            </div>
                        </div>
                        @endforeach
                    </div>

                </div>

            </div>
        </div>
    </div>
@endsection
