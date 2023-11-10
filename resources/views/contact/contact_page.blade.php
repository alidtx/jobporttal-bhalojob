@extends('layouts.app')
@section('content')
<!-- Header start -->
@include('includes.header')
<!-- Header end --> 
<!-- Inner Page Title start -->

@include('includes.inner_page_title', ['page_title'=>__('Contact Us')])
<!-- Inner Page Title end -->
<style>
        .contact-form input,
        .contact-form textarea,.contact-form select{
        font-size: 15px;
        }

        .information{
        font-size:15px
        }
.contact-now{
        margin-top: -35px;
}

    .common{
        height: 52px;
    }
    .contact{
        min-height: 172px  !important;
    }
    .inner-page .title h2{
         color: white;
         font-size: 50px;
         background: #ca371b;
         display: inline-block;        
         padding: 10px 74px;
         margin-top: -31px;
    }

    .inner-page .title h2 p{
         color: white;
         font-size: 50px;
         font-size: 23px;        
    }


    .inner-page .title p{
    line-height: 31px;
    font-size: 25px;
    color: #ca371b;
    margin-top: 3px;
    }
    .inner-page .title span{
      color: #ca371b !important;
    }

    .contact-form button{
       
        border-radius: 22px 22px
}

    @media screen and (max-width: 657px) {

        .inner-page .title  p{
            font-size: 20px;
            color: #ca371b;
            
        }

        .header .header-top .authentication ul li a{
            font-size: 12px;
        }
        .contact-form button{
            border-radius: 36px;
            font-size: 21px;
            padding: 10px 32px;
        }

.contact-form input,
.contact-form textarea,.contact-form select {
    font-size: 22px;

}

.contact{
   font-size: 11px !important; 
}

    }

    *{
       margin:0;
       padding:0;
       box-sizing:border-box;
       max-height:100%


      }


</style>
<div class="inner-page"> 
    <!-- About -->
    <div class="container">
        <div class="contact-wrap">
            <div class="title"> 
                <h2>নিবন্ধন করুন <p>CONTACT US</p></h2>
                 <p>( জাপানিজ ভাষা শিখা এবং জাপানে চাকরি জন্য ) </span></p>
            </div>  
                 
                <!-- Contact Info -->
                <div class="contact-now">
				<div class="row"> 
                @php 

                $services = DB::table('job_services')->get();
                @endphp

                <!-- Contact form -->
               
                <div class="col-lg-8 column">
                <div class="contact-form">
                <div id="message"></div>
                <!-- Step1 Start -->
                <div id="step1">
                <form id="step1Form">
            <div class="row">
            <div class="row" id="fullForm">

     <div class="col-md-6">                  
   <input type="text" name="full_name" id="full_name" value="" placeholder="নাম/Name *" >
   <p id="full_name_error"></p>
</div>

<div class="col-md-6">                  
<input type="text" name="phone" id="phone" placeholder="মোবাইল নং/Mobile No *" value="" >
<p class="phone_error"></p>
</div>

<div class="col-md-6">                     
<input type="email" class="common" id="email" name="email" placeholder="Email/ইমেইল আইডি (যদি থাকে)">
</div>

<div class="col-md-6">                  
        <select name="gender" id="gender" class="common">
                <option value="">লিঙ্গ/Gender</option>
                <option value="male">পুরুষ/Male</option>
                <option value="female">মহিলা/Female</option>
        </select>
       
</div>
<div class="col-md-6">                     
        <select name="age" id="age" class="common">
                <option value="">বয়স/Age</option>
                <option value="18-25">১৮-২৫ বছর/18-25 Year</option>
                <option value="25-30">২৫-৩০ বছর/25-30 Year</option>
                <option value="30-35">৩০-৩৫ বছর/30-35 Year</option>
        </select>
</div>

<div class="col-md-6">                    
        <select name="marritual_status" id="marritual_status" class="common">
                <option value="">বৈবাহিক অবস্থা/Marital Status</option>
                <option value="married">বিবাহিত/Married</option>
                <option value="unmarried">অবিবাহিত/Unmarried</option>
                <option value="divorced">ডিভোর্স/Divorced</option>
        </select>
</div>

<div class="col-md-6">                       
        <select name="children" id="children" class="common">
                <option value="">ছেলে মেয়ে/Children</option>
                <option value="0 child">নাই/None</option>
                <option value="1 child">১ জন/1 Child</option>
                <option value="2 child">২ জন/2 Child</option>
                <option value="more than 2">২ এর অধিক/More than 2</option>
        </select>
</div>
<div class="col-md-6">                      
        <select name="education" id="education" class="common">
                <option value="">শিক্ষাগত যোগ্যতা/Education</option>
                <option value="primary">প্রাথমিক/Primary</option>
                <option value="secoundery">মাধ্যমিক/Secoundary</option>
                <option value="higher secoundery">উচ্চ মাধ্যমিক/Higher Secoundary</option>
                <option value="university">বিশ্ববিদ্যালয়/University</option>
        </select>
</div>

<div class="col-md-6">                       
        <select name="passport" id="passport" class="common">
                <option value="">পাসপোর্ট/Passport</option>
                <option value="yes">আছে/Yes</option>
                <option value="no">নাই/No</option>
        </select>
</div>

<div class="col-md-6">                       
        <select name="abroad_work_experience" id="abroad_work_experience" class="common">
                <option value="">দেশের বাইরে কাজের অভিজ্ঞতা/Working Experience Abroad</option>
                <option value="yes">আছে/Yes</option>
                <option value="no">নাই/No</option>
        </select>
</div>

<div class="col-md-6">                       
        <select name="jp_lan_exp" id="jp_lan_exp" class="common">
                <option value="">জাপানিজ ভাষার দক্ষতা/Japanese Language Certification</option>
                <option value="yes">আছে/Yes</option>
                <option value="no">নাই/NO</option>
        </select>
</div>

<div class="col-md-6">                     
        <select name="type" id="type" class="common">
                <option value="">কি ধরনের দক্ষতা আছে/Type of Skills</option>
                <option value="N5/JLPT 1">N5/JLPT 1 </option>
                <option value="N4/JLPT 2">N4/JLPT 2 </option>
                <option value="N3/JLPT 3">N3/JLPT 3 </option>
                <option value="N2/JLPT 4">N2/JLPT 4 </option>
                <option value="N1/JLPT 5">N1/JLPT 5 </option>
        </select>
</div>

<div class="col-md-6">    
      <input type="text" name="district" id="district" class="common" placeholder="বর্তমান ঠিকানা/Present Address">                
        <!-- <select name="district" id="" class="common">
                <option value="">Your Address/আপনার অবস্থান</option>
                <option value="dhaka">Dhaka/ঢাকা</option>
                <option value="chattogram">Chattogram/চট্টগ্রাম</option>
                <option value="shylet">Shylet/সিলেট</option>
                <option value="khulna">Khulna/খুলনা</option>
                <option value="barisal">Barisal/বরিশাল</option>
                <option value="barisal">Rajshahi/রাজশাহী</option>
        </select> -->
</div>

<div class="col-md-6">                  
       <input type="text" class="common" name="address" id="address" placeholder="স্থায়ী ঠিকানা/Permanent Address">
</div>

<div class="col-md-6">                       
        <select name="job_interest" id="job_interest" class="common">
                <option value="">কোন ধরনের চাকরিতে করতে আগ্রহী/Job Categories</option>
                <option value="garments worker">গার্মেন্টস কর্মী/Garments Worker</option>
                <option value="Aviation">এভিয়েশন/Aviation</option>
                <option value="plumber">প্লাম্বার/Plumber</option>
                <option value="cleaner">ক্লিনার/Cleaner</option>
                <option value="Ship Worker">জাহাজ নির্মান শ্রমিক/Ship Making Worker</option>
                <option value="hotel management">হোটেল ম্যানেজমেন্ট/Hotel Management</option>
                <option value="factory worker">ফ্যাক্টরি শ্রমিক/Factory Worker</option>
                <option value="fisheridge">মৎস্য খাত/Fisheridge</option>
                <option value="food factory">ফুড ফ্যাক্টরি/Food Factory</option>
                <option value="hotel front">হোটেল ফ্রন্ট/Hotel Front</option>
                <option value="IT engineer">আই টি ইঞ্জিনিয়ার/IT Engineer</option>
                <option value="chef">বাবুর্চি/Chef</option>
        </select>
</div>

<div class="col-md-6">                  
        <select name="student_visa_interest" id="student_visa_interest" class="common">
                <option value=""> স্টুডেন্ট ভিসায় যেতে আগ্রহী ?/Interested In student Visa?</option>
                <option value="yes">Yes/হ্যা</option>
                <option value="no">No/না</option>
        </select>
</div>

<div class="col-md-12">                  
          <!-- <textarea name="message" id="message" placeholder="কিছু জানতে চাইলে লিখুন/Your Comments"></textarea> -->
          <input type="text"  name="message" id="textArea" placeholder="কিছু জানতে চাইলে লিখুন/Your Comments">

</div>

<div class="col-md-12">
    <!-- <button title="" class="button" name="submit" type="submit" id="submit">নিবন্ধন / Register Now</button> -->
    <button class="btn btn-primary" onclick="nextStep()">নিবন্ধন / Register Now</button>
    <!-- <button title="" class="button" name="submit" type="submit" id="submit">নিবন্ধন / Register Now</button> -->
    <br>
    <br>
    <br>
</div>
</div>
</div>
 <!-- <button class="btn btn-primary" onclick="nextStep()">Submit</button> -->
</form>
</div>
             <!-- Step1 End -->


           <!-- Step2 Start -->
<div id="step2" style="display: none;">
<form id="step2Form" method="post">
<div class="row" id="fullForm">
<div class="col-md-6">                  
   <input type="text" name="full_name" id="full_name_ns" value="" placeholder="নাম/Name *">
</div>

<div class="col-md-6">                  
<input type="text" name="phone" id="phone_ns" placeholder="মোবাইল নং/Mobile No *" value="">
</div>

<div class="col-md-6">                     
<input type="email" class="common"  id="email_ns" name="email" placeholder="Email/ইমেইল আইডি (যদি থাকে)" value="">
</div>

<div class="col-md-6">                  
        <select name="gender"  class="common"  id="gender_ns" >
                <option value="">লিঙ্গ/Gender</option>
                <option value="male">পুরুষ/Male</option>
                <option value="female">মহিলা/Female</option>
        </select>
       
</div>
<div class="col-md-6">                     
        <select name="age" class="common"  id="age_ns">
                <option value="">বয়স/Age</option>
                <option value="18-25">১৮-২৫ বছর/18-25 Year</option>
                <option value="25-30">২৫-৩০ বছর/25-30 Year</option>
                <option value="30-35">৩০-৩৫ বছর/30-35 Year</option>
        </select>
</div>

<div class="col-md-6">                    
        <select name="marritual_status" id="marritual_status_ns" class="common" >
                <option value="">বৈবাহিক অবস্থা/Marital Status</option>
                <option value="married">বিবাহিত/Married</option>
                <option value="unmarried">অবিবাহিত/Unmarried</option>
                <option value="divorced">ডিভোর্স/Divorced</option>
        </select>
</div>

<div class="col-md-6">                       
        <select name="children" id="children_ns" class="common">
                <option value="">ছেলে মেয়ে/Children</option>
                <option value="0 child">নাই/None</option>
                <option value="1 child">১ জন/1 Children</option>
                <option value="2 child">২ জন/2 Children</option>
                <option value="more than 2">২ এর অধিক/More than 2</option>
        </select>
</div>
<div class="col-md-6">                      
        <select name="education" id="education_ns" class="common">
                <option value="">শিক্ষাগত যোগ্যতা/Education</option>
                <option value="primary">প্রাথমিক/Primary</option>
                <option value="secoundery">মাধ্যমিক/Secoundary</option>
                <option value="higher secoundery">উচ্চ মাধ্যমিক/Higher Secoundary</option>
                <option value="university">বিশ্ববিদ্যালয়/University</option>
        </select>
</div>

<div class="col-md-6">                       
        <select name="passport" id="passport_ns" class="common">
                <option value="">পাসপোর্ট/Passport</option>
                <option value="yes">আছে/Yes</option>
                <option value="no">নাই/No</option>
        </select>
</div>

<div class="col-md-6">                       
        <select name="abroad_work_experience" id="abroad_work_experience_ns" class="common">
                <option value="">দেশের বাইরে কাজের অভিজ্ঞতা/Working Experience Abroad</option>
                <option value="yes">আছে/Yes</option>
                <option value="no">নাই/No</option>
        </select>
</div>

<div class="col-md-6">                       
        <select name="jp_lan_exp" id="jp_lan_exp_ns" class="common">
                <option value="">জাপানিজ ভাষার দক্ষতা/Japanese Language Certification</option>
                <option value="yes">আছে/Yes</option>
                <option value="no">নাই/NO</option>
        </select>
</div>

<div class="col-md-6">                     
        <select name="type" id="type_ns" class="common">
                <option value="">কি ধরনের দক্ষতা আছে/Type of Skills</option>
                <option value="N5/JLPT N5">N5/JLPT N5</option>
                <option value="N4/JLPT N4">N4/JLPT N4</option>
                <option value="N2/JLPT N2">N2/JLPT N2</option>
        </select>
</div>

<div class="col-md-6">    
      <input type="text" name="district" id="district_ns" class="common" placeholder="বর্তমান ঠিকানা/Present Address">                
        <!-- <select name="district" id="" class="common">
                <option value="">Your Address/আপনার অবস্থান</option>
                <option value="dhaka">Dhaka/ঢাকা</option>
                <option value="chattogram">Chattogram/চট্টগ্রাম</option>
                <option value="shylet">Shylet/সিলেট</option>
                <option value="khulna">Khulna/খুলনা</option>
                <option value="barisal">Barisal/বরিশাল</option>
                <option value="barisal">Rajshahi/রাজশাহী</option>
        </select> -->
</div>

<div class="col-md-6">                  
       <input type="text" class="common" id="address_ns" name="address" placeholder="স্থায়ী ঠিকানা/Permanent Address">
</div>

<div class="col-md-6">                       
        <select name="job_interest"  class="common" id="job_interest_ns">
                <option value="">কোন ধরনের চাকরিতে করতে আগ্রহী/Job Categories</option>
                <option value="garments worker">গার্মেন্টস কর্মী/Garments Worker</option>
                <option value="Aviation">এভিয়েশন/Aviation</option>
                <option value="plumber">প্লাম্বার/Plumber</option>
                <option value="cleaner">ক্লিনার/Cleaner</option>
                <option value="Ship Worker">জাহাজ নির্মান শ্রমিক/Ship Making Worker</option>
                <option value="hotel management">হোটেল ম্যানেজমেন্ট/Hotel Management</option>
                <option value="factory worker">ফ্যাক্টরি শ্রমিক/Factory Worker</option>
                <option value="fisheridge">মৎস্য খাত/Fisheridge</option>
                <option value="food factory">ফুড ফ্যাক্টরি/Food Factory</option>
                <option value="hotel front">হোটেল ফ্রন্ট/Hotel Front</option>
                <option value="IT engineer">আই টি ইঞ্জিনিয়ার/IT Engineer</option>
                <option value="chef">বাবুর্চি/Chef</option>
        </select>
</div>

<div class="col-md-6">                  
        <select name="student_visa_interest" class="common" id="student_visa_interest_ns">
                <option value=""> স্টুডেন্ট ভিসায় যেতে আগ্রহী ?/Interested In student Visa?</option>
                <option value="yes">Yes/হ্যা</option>
                <option value="no">No/না</option>
        </select>
</div>

<div class="col-md-12">                  
<input type="text"  name="message_ns" id="textArea_ns" placeholder="কিছু জানতে চাইলে লিখুন/Your Comments">
</div>

<div class="col-md-12">
   
<button class="btn btn-secondary" onclick="prevStep()">Back</button>
<!-- <button  class="btn btn-primary" onclick="submit()">Confirm</button> -->
<button type="button" onclick="func()" class="btn btn-primary" > Confirm</button>
    
    <br>
    <br>
    <br>
</div>
</div>

</form>
</div>
<!-- Step2 End -->
</div>

</div> 
                <div class="col-lg-4 column"> 
                    <!-- Google Map -->
                    <div class="googlemap"> 
                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1824.9844152275878!2d90.41911813861583!3d23.81970739465579!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3755c70cd5e84b85%3A0x1dea89384d59338d!2sCemex%20Shimul%20Trishna%20Trade%20Centre!5e0!3m2!1sen!2sbd!4v1698660191139!5m2!1sen!2sbd" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                    </div>
                </div>


                     <div class="row"> 
                    <div class="col-lg-4 column">
                        <div class="contact"> <span><i class="fa fa-home"></i></span>
                            <div class="information"> <strong>日本の住所:</strong>
                                <!-- <p>{{ $siteSetting->site_street_address }}</p> -->
                                <p><span>電話: 160-0023 <br> 7-22-39(703) Nishi Shinjuku, Shinjuku-ku, Tokyo, Japan</span></p>
                                <p><span>T: +81 3 6279 1289</span></p>
                                <p><span>E: hello@moin.tokyo</span></p>
                            </div>
                        </div>
                    </div>
                    <!-- Contact Info -->
                    <div class="col-lg-4 column">
                        <div class="contact"> <span><i class="fa fa-envelope"></i></span>
                            <div class="information"> <strong>Bangladesh Office:</strong>
                                <!-- <p><a href="mailto:{{ $siteSetting->mail_to_address }}">{{ $siteSetting->mail_to_address }}</a></p> -->
                                <p><span>Address: (6th floor) Cemex Shimul Trishna Trade Center, Ka-86/1, Kuril Bishwa Road, Pragati
                                    Shorani Dhaka-1229
                              </span></p>
                              <p><span>T: +88 01700 702644</span></p>
                              <p><span>E: hello@moin.tokyo</span></p>
                            </div>
                        </div>
                    </div>
                    <!-- Contact Info -->
                    <div class="col-lg-4 column">
                        <div class="contact"> <span><i class="fa fa-phone"></i></span>
                            <div class="information"> <strong>Contact Number:</strong>
                                <!-- <p><a href="tel:{{ $siteSetting->site_phone_primary }}">{{ $siteSetting->site_phone_primary }}</a></p>
                                <p><a href="tel:{{ $siteSetting->site_phone_secondary }}">{{ $siteSetting->site_phone_secondary }}</a></p> -->
                                <p><span>T: +88 01700 702644</span></p>
                              <p><span>E: hello@moin.tokyo</span></p>
                            </div>
                        </div>
                    </div>
                    <!-- Contact Info --> 
                </div>
		   </div>
        </div>
    </div>
</div>

<script>


      function nextStep() { 

       event.preventDefault(); 

    var fullName = document.getElementById('full_name').value;
    var phone = document.getElementById('phone').value;

    if (fullName.trim() === '' || phone.trim() === '') {
        // Display an error message or take appropriate action for validation failure
        alert('Please fill with your full name and phone number');
        return;
    }

        document.getElementById('step1').style.display = 'none';
        document.getElementById('step2').style.display = 'block'; 
       var fieldIds = ['phone', 'full_name', 'email', 'gender', 'age', 'marritual_status', 
       'children', 'education', 'passport', 'abroad_work_experience', 'jp_lan_exp', 'type', 
       'district', 'address', 'job_interest', 'student_visa_interest', 'textArea'];

      for (var i = 0; i < fieldIds.length; i++) {
    var currentFieldId = fieldIds[i];
    var currentValue = document.getElementById(currentFieldId).value;
    document.getElementById(currentFieldId + '_ns').value = currentValue;
     }
   }

function prevStep() {
        event.preventDefault();
        document.getElementById('step1').style.display = 'block';
        document.getElementById('step2').style.display = 'none';
    }

    // You can handle form submission using JavaScript
 function func(){

    event.preventDefault();  
    $.ajax({
        type: 'POST',
        url: "{{ route('contact.us')}}",
        data: $('#step2Form').serialize(),
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content') 
        },
        success: function (data) {  
         window.location.href = "{{ route('contact.us.thanks') }}";                     
        },
       
    });

 }

</script>



@include('includes.footer')
@endsection