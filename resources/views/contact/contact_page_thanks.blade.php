@extends('layouts.app')
@section('content')
<!-- Header start -->
@include('includes.header')
<!-- Header end --> 
<!-- Inner Page Title start -->
@include('includes.inner_page_title', ['page_title'=>__('Contact Us')])
    
<!-- Inner Page Title end -->
<style>
       .title h2{
             font-size: 40px !important;
             line-height: 64.5px;
             margin-bottom: 20px !important;
             display: inline-block;
             color: white !important;
             background: #ca371b;
             color: white;
             color: #292929;
             padding: 23px 33px;
             line-height: 39.5px;
       }
      
       .title p{
            font-size: 24px;
            line-height: 37.5px !important;
            font-weight: bold;
            font-family: sans-serif;
            color:#736363;
       }
       .title .imgbox {
          margin-top: 10px;
       }
       .link a {
        font-size: 18px;
       }

</style>
<div class="inner-page">
    <div class="container">
        <div class="contact-wrap">
            <div class="title"> <span>&nbsp;</span>
                <h2>আপনার নিবন্ধন সপল হয়েছে <p style="color: white;">Registration Successful</p></h2>
                <p>২৪ ঘন্টার মধ্য আমাদের প্রতিনিধি আপনার সাথে যোগাযোগ করবে।<br>প্রয়োজনে কল করুনঃ ০১৭০০৭০২৬৪৪ </p>
                 <div class="imgbox"> <img src="{{ asset('success-img/japan.png') }}" alt=""> </div>
                  <p class="link"><i class="fa-brands fa-facebook"></i> <a href="https://www.facebook.com/JBBRAbd">আমাদের ফেসবুক পেজ</a></p>
                  <p class="link"><i class="fa-brands fa-whatsapp"></i> <a href="https://business.whatsapp.com/">আমাদের ওয়াটশাপে যোগাযোগ করুন</a></p>
              
                <!-- <p>{{__('We have received your message and would like to thank you for writing to us.  we will reply by email as soon as possible')}}<br /><br /> -->
                    <!-- {{__('Talk to you soon')}}<br /> -->
                 
                    <!-- {{-- {{ $siteSetting->site_name }}</p> --}} -->
                    <br>
                 
            </div>      
        </div>
    </div>
</div>
@include('includes.footer')
@endsection