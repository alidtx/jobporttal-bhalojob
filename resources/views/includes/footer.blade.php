<footer>


    <?php

    $jobcategoryJob = App\Models\jobSubCategory::select('id', 'sub_name as name')->where("category_id", 1)->get();
    $jobcategoryStudent = App\Models\jobSubCategory::select('id', 'sub_name as name')->where("category_id", 2)->get();
    $jobcategoryEmployee = App\Models\jobSubCategory::select('id', 'sub_name as name')->where("category_id", 3)->get();
    $citys = App\City::select('id', 'city as name')->limit(5)->get(5);


    ?>

    <div class="footer-top">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-md-6">
                    <div class="section-title">
                        <h4> <a href="service-list" style="color:white!important"> 日本企業・日本教育機関へのサポート一覧 </a></h4>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="join-us-button">
                        <button class="btn"><a href="service-list" > 国内・海外にいる外国人材へのサポート一覧</a></button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="container">
        <div class="row">
            <div class="col-md-4">
                <div class="footer-content">
                    <div class="section-title">
                        <h4>  求職者  </h4>
                    </div>
                    <ul>
                        @foreach($jobcategoryJob as $key => $eachJob)
                            <li><a href="#"> {{$eachJob->name}} </a></li>
                        @endforeach

                    </ul>
                </div>
            </div>

            <div class="col-md-4">
                <div class="footer-content">
                    <div class="section-title">
                        <h4>  学生  </h4>
                    </div>
                    <ul>
                        @foreach($jobcategoryStudent as $key => $eachStudent)
                            <li><a href="#"> {{$eachStudent->name }} </a></li>
                        @endforeach

                    </ul>
                </div>
            </div>

            <div class="col-md-4">
                <div class="footer-content">
                    <div class="section-title">
                        <h4>  企業向け
                             </h4>
                    </div>
                    <ul>
                        @foreach($jobcategoryEmployee as $key => $eachStudent)
                            <li><a href="#"> {{$eachStudent->name }} </a></li>
                        @endforeach
                    </ul>
                </div>
            </div>

            <div class="col-md-4">
                <div class="footer-content">
                    <div class="section-title">
                        <h4> Service Location </h4>
                    </div>
                    <ul >
                        @foreach($citys as $key => $eachcity)
                            <li><a href="#">{{$eachcity->name}} </a></li>
                        @endforeach

                    </ul>
                </div>
            </div>

            <div class="col-md-4">
                <div class="footer-content">
                    <div class="section-title">
                        <h4> Job By Industries </h4>
                    </div>
                    <ul>
                        @php
                            $industries = App\Industry::getUsingIndustries(6);
                        @endphp
                        @foreach ($industries as $industry)
                            <li><a
                                        href="{{ route('job.list', ['industry_id[]' => $industry->industry_id]) }}">{{ $industry->industry }}</a>
                            </li>
                        @endforeach

                    </ul>
                </div>
            </div>
            <div class="col-md-4">
                <div class="footer-content">
                    <div class="section-title">
                        <h4> Job Category</h4>
                    </div>
                    <ul>
                        <li><a href="{{ route('index') }}">{{ __('Home') }}</a></li>
                        <li><a href="{{ route('contact.us') }}">{{ __('お問い合わせ（Contact Us)') }}</a></li>
                        @auth
                            <li class="postad"><a href="{{ route('post.job') }}">{{ __('Post a Job') }}</a></li>
                        @else
                            <li class="postad"><a class="login_alart">{{ __('Post a Job') }}</a></li>
                        @endauth
                        <li><a href="{{ route('faqlist') }}">{{ __('FAQs') }}</a></li>
                        {{-- @foreach ($show_in_footer_menu as $footer_menu)
                            @php
                                $cmsContent = App\CmsContent::getContentBySlug($footer_menu->page_slug);
                            @endphp

                            <li class="{{ Request::url() == route('cms', $footer_menu->page_slug) ? 'active' : '' }}"><a
                                        href="{{ route('cms', $footer_menu->page_slug) }}">{{ $cmsContent->page_title }}</a>
                            </li>
                        @endforeach --}}

                    </ul>
                </div>
            </div>


        </div>
    </div>
</footer>

<div class="copyright">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <p> @2023 <a href="#"> Bhalo Job </a> All rights reserved </p>
            </div>
        </div>
    </div>
</div>
