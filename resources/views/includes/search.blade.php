@if ((bool) @$siteSetting->is_slider_active)


<style>
.banner-bg-img {
    background-position: center center!important;
    background-repeat: no-repeat!important;
    background-size: cover !important;
    background-size: 100% 100%!important;
   
}
</style>


    <div class="home-page-slider" >
        <div class="mian_slider">
        @foreach ($sliders as $slide)
            <div class="element">
                <div class="banner-bg-img"   style="background-image:url({{ asset('slider_images/' . $slide->slider_image) }})">
                    <div class="banner-content-wrapper container">
                        <div class="banner-button">
                            <!-- <h5> {{$slide->slider_heading}} </h5> -->
                            <a href="{{$slide->slider_link}}">
                                <button>Register Now<span> <i class="fa fa-chevron-right" aria-hidden="true"></i> </span> </button>
                            </a>
                            <!-- <article>
                                <p>
                            <?php echo $slide->slider_description; ?>     
                               </p>
                            </article> -->
                        </div>

                    </div>
                </div>
            </div>
            @endforeach
        </div>
    </div>

   
{{--    start main job search  --}}
    @include('job.inc.main_job_search')
{{--    end main job search--}}

    {{-- Bhalojob Service --}}

    {{-- ('jdc', $jdc)
    ->with('fop', $fop)
    ->with('fhrj', $fhrj)
    ->with('fsj', $fsj) --}}

    <div class="registration-information">
        <div class="container-fluid">
            <div class="row align-items-center">
                <div class="col-md-6">
                    <div class="section-content">
                        <p> 17 YEARS OF EXPERIENCE </p>
                        <h2> We supercharge <br>  your career to  <span> Japan </span> </h2>
                        <article>
                            <p> 
                            バロジョブ（bhalojob.com)は外国人ITエンジニア・システムエンジニア（SE)・技能実習生・特定技能（SSW)及び人材紹介・人材派遣から外国人求人・外国人の就職・転職情報及び日本へ留学（日本語学校・専門学校・大学）のワンストップサービスを提供.しているオンラインポータルサイトです。
                            </p>
                        </article>
                        <div class="read-more-btn">
                            <button class="btn"> read more <i class="fa fa-chevron-right" aria-hidden="true"></i> </button>
                        </div>
                    </div>
                </div>
                <div class="col-md-5">
                    <div class="section-img">
                        <img src="{{asset('merit/imageone.png')}}" alt="">
                    </div>
                </div>
                <div class="col-md-1"></div>
               
            </div>
        </div>
    </div>
  

    <div class="our-service">
        <div class="container-fluid">
            <div class="row">

                <div class="col-md-1"></div>
                <div class="col-md-10">
                    <div class="section-title">
                        <h4> 私たちの主<span>なサービス </span> </h4>
                        <p> バロジョブ（bhalojob.com)は外国人ITエンジニア・システムエンジニア（SE)・技能実習生・特定技能（SSW)及び人材紹介・人材派遣から外国人求人・外国人の就職・転職情報及び日本へ留学（日本語学校・専門学校・大学）のワンストップサービスを提供.しているオンラインポータルサイトです。技能実習生・特定技能外国人・外国人就職・外国人転職の‎資料請求・無料相談の登録はこちらへ  </p>
                    </div>
                </div>



                <div class="col-md-6">
                    <div class="service-left">
                        <div class="section-title">
                            <h4> 海外にいる<span>人材向け</span></h4>
                        </div>
                        <div class="row">
                            @foreach ($fop as $ejdc)
                                <div class="col-lg-4 col-md-12">
                                    <a href="{{route('service-view',$ejdc->id)}}">
                                    <div class="card">
                                        <div class="icon">
                                            <!-- <i class="{{ $ejdc->fa }}"></i> -->
                                            @if(!empty($ejdc->image))
                                            <img src="{{ asset('service/' . $ejdc->image) }}"  alt=""> 
                                            @else
                                            <img src="{{ asset('company_logos/dontdelete/nologo.png') }}"   alt="no logo">
                                            @endif
                                        </div>
                                        <div class="content">
                                            <h4> <?php echo $ejdc->title; ?> </h4>
                                            <article>
                                                <p>
                                                <?php echo  \Illuminate\Support\Str::limit($ejdc->description, $limit = 130, $end = '  read more →') ?>
                                               </p>
                                            </article>
                                        </div>
                                    </div>
                                    </a>
                                </div>
                            @endforeach
                        </div>
                        <div class="view-more-btn">
                            <a  href="{{route('service-list')}}" class="btn"> view more </a>
                        </div>
                    </div>
                </div>




                <div class="col-md-6">
                    <div class="service-right">
                        <div class="section-title">
                            <h4> 国内にいる<span>人材向け </span></h4>
                        </div>
                        <div class="row">
                            @foreach ($fhrj as $ejdce)
                                <div class="col-lg-4 col-md-12">
                                <a href="{{route('service-view',$ejdce->id)}}">
                                    <div class="card">
                                        <div class="icon">
                                        @if(!empty($ejdce->image))
                                            <img src="{{ asset('service/' . $ejdce->image) }}"  alt=""> 
                                            @else
                                            <img src="{{ asset('company_logos/dontdelete/nologo.png') }}"   alt="no logo">
                                            @endif
                                        </div>
                                        <div class="content">
                                            <h4><?php echo $ejdce->title ?> </h4>
                                            <article>
                                            <p>
                                            
                                           <?php echo  \Illuminate\Support\Str::limit($ejdce->description, $limit = 130, $end = '  read more →'); ?>
                                            
                                             </p>
                                               
                                            </article>
                                        </div>
                                    </div>
                                    </a>
                                </div>
                            @endforeach
                        </div>
                        <div class="view-more-btn">
                        <a  href="{{route('service-list')}}" class="btn"> view more </a>
                        </div>
                    </div>
                </div>
    </div>

    <div class="row">

                <div class="col-md-6">
                    <div class="service-left">
                        <div class="section-title">
                            <h4> 日本国<span>内企業 </span></h4>
                        </div>
                        <div class="row">
                            @foreach ($jdc as $ejdcd)
                                <div class="col-lg-4 col-md-12">
                                <a href="{{route('service-view',$ejdcd->id)}}">
                                    <div class="card">
                                        <div class="icon">
                                        @if(!empty($ejdcd->image))
                                            <img src="{{ asset('service/' . $ejdcd->image) }}"  alt=""> 
                                            @else
                                            <img src="{{ asset('company_logos/dontdelete/nologo.png') }}"   alt="no logo">
                                            @endif
                                        </div>
                                        <div class="content">
                                            <h4> <?php echo $ejdcd->title ?> </h4>
                                            <article>
                                                        <p>
                                                        
                                                    <?php echo  \Illuminate\Support\Str::limit($ejdcd->description, $limit = 130, $end = '  read more →'); ?>
                                                        
                                                    </p>
                                            </article>
                                        </div>
                                    </div>
                                    </a>
                                </div>
                            @endforeach
                        </div>
                        <div class="view-more-btn">
                        <a  href="{{route('service-list')}}" class="btn"> view more </a>
                        </div>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="service-right">
                        <div class="section-title">
                            <h4> 日本国内<span>学校向け </span></h4>
                        </div>
                        <div class="row">
                            @foreach ($fsj as $efsj)
                                <div class="col-lg-4 col-md-12">
                                <a href="{{route('service-view',$efsj->id)}}">
                                    <div class="card">
                                        <div class="icon">
                                        @if(!empty($efsj->image))
                                            <img src="{{ asset('service/' . $efsj->image) }}"  alt=""> 
                                            @else
                                            <img src="{{ asset('company_logos/dontdelete/nologo.png') }}"   alt="no logo">
                                            @endif
                                        </div>
                                        <div class="content">
                                            <h4> <?php echo $efsj->title ?> </h4>
                                            <article>
                                                <p>
                                                
                                                <?php echo  \Illuminate\Support\Str::limit($efsj->description, $limit = 130, $end = '  read more →') ?>
                                                
                                              
                                                </p>
                                            </article>
                                        </div>
                                    </div>
                                    </a>
                                </div>
                            @endforeach
                        </div>
                        <div class="view-more-btn">
                        <a  href="{{route('service-list')}}" class="btn"> view more </a>
                        </div>
                    </div>
                </div>




            </div>
        </div>
    </div>

    <div class="join-us">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="join-us-button">
                        <button class="btn"> バロジョブ利用者の声 </button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="section3">
        <div class="container">
            <div class="section3-items-box">
                <div class="row">
                    <div class="col-md-12">
                        <h4> 面談についてはWeb・お電話等を活用しバロジョブ利用者の声 </h4>
                    </div>
                </div>
                <div class="item-wapper">
                    <div class="row">
                        @foreach ($successJob as $each)
                            <div class="col-md-6 col-sm-12">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="user-profile">
                                            <div class="user-images">
                                                <img style="border-radius: 50%;"
                                                    src="{{ asset('successjob/' . $each->image) }}" alt="">
                                                {{-- <p> {{ $each->name }}</p> --}}
                                                <p> {{ $each->age . ' / ' . $each->gender }} </p>
                                            </div>
                                            <article>
                                                <p> <span> 前職 </span> {{ $each->pri_position }} </p>
                                                <p> <span> 現職種 </span> {{ $each->curr_position }} </p>
                                            </article>
                                        </div>
                                        <article>
                                            <p>{{ $each->description }} </p>
                                        </article>
                                    </div>
                                </div>
                            </div>
                        @endforeach
                    </div>
                </div>
                <div class="join-us">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="join-us-button">
                                <button class="btn"> バロジョブ利用者の声</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <div class="section4">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="section-title">
                        <h4> 全国から採用成功の声が多数 </h4>
                    </div>
                </div>
            </div>
            <div class="case-studies-wrapper">
                <div class="company_profile">
                @foreach ($casStudy as $cs)
                    <div>
                        <div class="row">
                            <div class="col-md-6 col-sm-12">
                              <br>                                
                                <div class="content-img">
                                    <img src="{{ asset('case/' . $cs->image) }}" alt="">
                                </div>
                                
                            </div>
                            <div class="col-md-6 col-sm-12">
                            <div class="content-left">
                                    <h4> {{ $cs->name }} </h4>
                                    <h5> 地域: </span> {{ $cs->location }} </h5>
                                    <article>
                                        <p> <span style="font-weight: bold">事業内容: </span> {{ $cs->osname }} </p>
                                        <p> <span style="font-weight: bold">従業員数 : </span> {{ $cs->no_of_employees }} </p>
                                    </article>
                                </div>
                                <div class="content-right">
                                    <h4> <?php echo $cs->title;?></h4>
                                </div>
                                <article>
                                    <p> <?php echo  $cs->description; ?></p>
                                </article>
                                <div class="join-us">
                                    <div class="row">
                                        
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                @endforeach
                </div>
            </div>
        </div>
    </div>






    <div class="section5">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="section-title">
                        <h4> 信頼のあるパートナー企業 </h4>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="companies">
                        @foreach ($company as $ecom)
                        <div>
                            <div class="card">
                                <div class="card-body companylogo">
                                    @if ($ecom->logo)
                                        <img src="{{ asset('featured/' . $ecom->logo) }}"
                                            alt="{{ $ecom->logo }}">
                                    @else
                                        <img src="{{ asset('company_logos/dontdelete/nologo.png') }}"
                                            alt="no logo">
                                    @endif

                                    <div class="company-name">
                                        <h4>{{ $ecom->name }} </h4>
                                    </div>
                                </div>
                            </div>
                        </div>
                        @endforeach
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="school">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="section-title">
                        <h4> 有望な教育機関（大学・専門学校） </h4>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="school_slider">
                        @foreach ($college as $eacha)
                        <div>
                            <div class="card">
                                <div class="card-body">
                                    @if ($eacha->logo)
                                        <img src="{{ asset('featured/' . $eacha->logo) }}"
                                            alt="{{ $eacha->logo }}">
                                    @else
                                        <img src="{{ asset('company_logos/dontdelete/nologo.png') }}"
                                            alt="no logo">
                                    @endif

                                    <div class="company-name">
                                        <h4>{{ $eacha->name }} </h4>
                                    </div>
                                </div>
                            </div>
                        </div>
                        @endforeach
                    </div>
                </div>
            </div>
        </div>
    </div>


    <div class="college">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="section-title">
                        <h4> 有望な日本語学校 </h4>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="college_slider">
                        @foreach ($school as $esc)
                        <div>
                            <div class="card">
                                <div class="card-body">
                                    @if ($esc->logo)
                                        <img src="{{ asset('featured/' . $esc->logo) }}"
                                            alt="{{ $esc->logo }}">
                                    @else
                                        <img src="{{ asset('company_logos/dontdelete/nologo.png') }}"
                                            alt="no logo">
                                    @endif

                                    <div class="company-name">
                                        <h4>{{ $esc->name }} </h4>
                                    </div>
                                </div>
                            </div>
                        </div>
                        @endforeach
                    </div>
                </div>
            </div>
        </div>
    </div>

    <style>
      *{
       margin:0;
       padding:0;
       box-sizing:border-box;
       max-height:100%


      }
</style>




    <div class="section7">
        <div class="container">
            <div class="background-border">
                <div class="row">
                    <div class="col-md-6">
                        <div class="single-item-wrapper">
                            <h4> バロジョブ・サポートは世界をつなぐ未来へのパートナー </h4>
                            
                            <a href="#">
                                <button type="button"　style="color:white!important" class="btn"><a href="register" style="color:white!important">無料会員登録 <span> <i
                                            class="fa fa-chevron-right" aria-hidden="true"></i> </span>
                                          </a>
                                        </button>
                            </a>
                            <article>
                            <h5> バロジョブ・アカウントへの登録 </h5>
                                <p> より速く、より簡単に自分に合った求人を探し未来への扉を開く鍵となる </p>
                            </article>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="single-item-wrapper">
                            <h4> ”外国人人材の多様性が企業のイノベーションを加速させます”</h4>
                            
                            <a href="#">
                                <button type="button" style="color:white!important" class="btn"><a href="register" style="color:white!important"> 無料会員登録 <span> <i class="fa fa-chevron-right" aria-hidden="true"></i> </span></a>
                                </button>
                            </a>
                            <article>
                            <h5> バロジョブ・アカウントへ登録 </h5>
                                <p> ”世界中の優秀な人材があなたの企業に興味を持っています”</p>
                            </article>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    @if ($siteSetting->user_reviews_title and $siteSetting->user_reviews_short_title)
        <div class="clients-area">
            <div class="container">
                <div class="clients-wrapper">
                    <div class="row">
                        <div class="col-md-２">
                        <div class="col-md-８">
                            <div class="section-title">
                                <p>  {{$siteSetting->user_reviews_short_title}} </p>
                                <h4>  {{$siteSetting->user_reviews_title}} </h4>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        @foreach($statistics as $statisticsItem)
                            <div class="col-md-4">
                                <div class="card">
                                    <div class="img">
                                        <img src="https://cdn3d.iconscout.com/3d/premium/thumb/diamond-shape-5617600-4693542.png"
                                             alt="">
                                    </div>
                                    <div class="content">
                                        <h4>  {{$statisticsItem->title}}</h4>
                                        <p>  {{$statisticsItem->short_title}} </p>
                                        <h3>   {{$statisticsItem->statistics_ratio}}</h3>
                                        <small>  {{$statisticsItem->description}}</small>
                                    </div>
                                </div>
                            </div>
                        @endforeach

                    </div>

                </div>
            </div>
        </div>


        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
    @endif
@endif
