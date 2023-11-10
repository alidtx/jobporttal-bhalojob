@extends('layouts.app')

@section('content')

    <!-- Header start -->

    @include('includes.header')
    <!-- Header end -->

    <!-- Inner Page Title start -->

    @include('includes.inner_page_title', ['page_title'=>__('Print Resume')])

    <?php $true = FALSE; ?>


    <?php

    if (Auth::guard('company')->user()) {

        $package = Auth::guard('company')->user();

        if (null !== ($package)) {

            $array_ids = explode(',', $package->availed_cvs_ids);

            if (in_array($user->id, $array_ids)) {

                $true = TRUE;

            }

        }

    }

    //  dd();

    

    if(!empty($japaneseCv)):
    if ($japaneseCv->personal_information!=null || $japaneseCv->education_history!=null || $japaneseCv->working_experience!=null || $japaneseCv->language_certification!=null || $japaneseCv->other_certification!=null):
        $personalInfo = json_decode($japaneseCv->personal_information);
        $educationInfo = json_decode($japaneseCv->education_history);
        $workingInfo = json_decode($japaneseCv->working_experience, true);
        $languageInfo = json_decode($japaneseCv->language_certification);
        $certificateInfo = json_decode($japaneseCv->other_certification);
    endif;
    endif;
       
    // Personal Information Section
        $genderId = @$personalInfo->gender_id;
        $birthYear = @$personalInfo->birth_year;
        $maritalStatusId = @$personalInfo->marital_status_id;
        $CountryID = @$personalInfo->country_id;
        $gender = App\Gender::where('gender_id', $genderId)->first();
        $Byear = App\Year::where('id', $birthYear)->first();
        $Mstatus = App\MaritalStatus::where('marital_status_id', $maritalStatusId)->first();
        $country = App\Country::where('country_id', $CountryID)->first();

        // Education Information Section SSC  
        $SSCentranceYearId=@$educationInfo->ssc->entrance_year;
        $SSCentrancemonthID=@$educationInfo->ssc->entrance_month;
        $SSCentrancePassYearId=@$educationInfo->ssc->pass_year;
        $SSCentrancePassMonthId=@$educationInfo->ssc->pass_month;
        $SSCentranceYear = App\Year::where('id', $SSCentranceYearId)->first();
        $SSCentranceMonth = App\Models\Month::where('id', $SSCentrancemonthID)->first();
        $SSCentrancePassYear = App\Year::where('id', $SSCentrancePassYearId)->first();
        $SSCentrancePassMonth = App\Models\Month::where('id', $SSCentrancePassMonthId)->first();

        // Education Information Section HSC
        $HSCentranceYearId=@$educationInfo->hsc->entrance_year;
        $HSCentrancemonthID=@$educationInfo->hsc->entrance_month;
        $HSCentrancePassYearId=@$educationInfo->hsc->pass_year;
        $HSCentrancePassMonthId=@$educationInfo->hsc->pass_month;
        $HSCentranceYear = App\Year::where('id', $HSCentranceYearId)->first();
        $HSCentranceMonth = App\Models\Month::where('id', $HSCentrancemonthID)->first();
        $HSCentrancePassYear = App\Year::where('id', $HSCentrancePassYearId)->first();
        $HSCentrancePassMonth = App\Models\Month::where('id', $HSCentrancePassMonthId)->first();

      // Education Information Section University
        $universityentranceYearId=@$educationInfo->university->entrance_year;
        $universityentrancemonthID=@$educationInfo->university->entrance_month;
        $universityentrancePassYearId=@$educationInfo->university->pass_year;
        $universityentrancePassMonthId=@$educationInfo->university->pass_month;
        $universityentranceYear = App\Year::where('id', $universityentranceYearId)->first();
        $universityentranceMonth = App\Models\Month::where('id', $universityentrancemonthID)->first();
        $universityentrancePassYear = App\Year::where('id', $universityentrancePassYearId)->first();
        $universityentrancePassMonth = App\Models\Month::where('id', $universityentrancePassMonthId)->first(); 
        $user_img= App\User::find(Auth::user()->id);
        // dd($certificateInfo); 

    ?>
  
  

<style>
      .table-responsive tbody tr:first-child {
          border: none!important;
        }
        .candidate-cv{
                 position:relative;
                 z-index: 10;
            }

            .watermark{
                   position:absolute;
                   position: absolute;
                    top: 10%;
                    left: 99px;  
            }
</style>

    <div class="listpgWraper">

        <div class="container">
            @include('flash::message')
            <div class="row">
          
                @include('includes.user_dashboard_menu')

                <div class="col-md-9 col-sm-8">
                    <div id="printableArea">
                        <div class="candidate-cv">
                            <div class="container">
                              <div class="watermark"> <img src="{{ asset('admin_assets/watermark2.png') }}" alt="alt"> </div>    

                                <div class="row">
                                    
                                    <div class="col-md-12">
                                              
                                        <table class="table-responsive borderremove">
                                            <tbody>
                                            <tr>
                                                <td style="width:20%!important"  style="border:none;"> 履歴書</td>
                                              
                                                <td  style="width:50%!important" colspan="3" style="border:none; text-align: right;"> 平成5年1月2 {{@$Byear->jp_year_value}}</td>
                                                <td style="width:30%!important"   rowspan="4" >
                                                     <img style="margin-bottom:-130px!important;display:block" src="{{ asset('user_images/'.$user_img->image) }}" alt="">
                                                </td>
                                            </tr>


                                            <tr>
                                                <td  style="text-align: center;"> 氏 名</td>
                                                <td colspan="3" style="text-align: center;"> <br>{{ @$personalInfo->first_name}} {{ @$personalInfo->last_name}} </td>
                                            </tr>
                                            <tr>
                                                <td colspan="4" style="text-align:left">性別 : {{@$gender->jp_gender}}</td>
                                            </tr>
                                            <!-- <tr>
                                                <td colspan="4" style="text-align:left">配偶者の有無 : {{@$Mstatus->jp_marital_status}}</td>
                                            </tr> -->

                                            <tr>
                                                <td colspan="3" width="50%!important"> 生年月日-{{@$Byear->jp_year_value}}-01-01</td>
                                                <td  width="20%!important"> 生年月日-{{@$Byear->jp_year_value}}-01-01</td>
                                            </tr>
                                            <tr>
                                                <td colspan="4"> 私たち</td>
                                                <td>配偶者の有無 : {{@$Mstatus->jp_marital_status}}</td>
                                            </tr>
                                            <tr>
                                                <td colspan="4" rowspan="4"> 説明 : </td>
                                                <td>国: {{@$country->country}}</td>
                                            </tr>
                                            <tr>
                                                <td>住所: {{@$personalInfo->street_address}}</td>
                                            </tr>
                                            <tr>
                                                <td>バングラデシュの住所: {{@$personalInfo->bd_address}}</td>
                                            </tr>
                                            <tr>
                                                <td>電話番号 : {{@$personalInfo->bd_cell_phone}}</td>
                                            </tr>
                                            <tr>
                                                <td>非常電話 : {{@$personalInfo->emergency_cell_phone}}</td>
                                                <td colspan="3">郵便番号:  {{@$personalInfo->bd_postal_code}}</td>
                                                <td>Eメール: {{@$personalInfo->email}}</td>
                                            </tr>

                                            </tbody>
                                        </table>
                                        <table>
                                              <!-- <h3>Edications</h3> -->
                                            <thead>
                                            <tr>
                                                <th style="width: 15%;">試験タイトル</th>
                                                <th style="width: 15%;">機関名</th>
                                                <th style="width: 15%;">入学年度</th>
                                                <th style="width: 15%;">入学月</th>
                                                <th style="width: 15%;"> パスイヤー</th>
                                                <th style="width: 15%;"> パス月間</th>
                                            </tr>
                                            </thead>

                                            <tbody>
                                            <tr>
                                                <td> 中学校卒業証明書 </td>
                                                <td>{{@$educationInfo->ssc->institution_name}} </td>
                                                <td>{{@$SSCentranceYear->jp_year_value}}</td>
                                                <td>{{@$SSCentranceMonth->jp_title}}</td>
                                                <td>{{@$SSCentrancePassYear->jp_year_value}}</td>
                                                <td>{{@$SSCentrancePassMonth->jp_title}}</td>
                                            </tr>

                                            <tr>
                                                <td> 高等中等学校の証明書 </td>
                                                <td>{{@$educationInfo->hsc->institution_name}} </td>
                                                <td>{{@$HSCentranceYear->jp_year_value}}</td>
                                                <td>{{@$HSCentranceMonth->jp_title}}</td>
                                                <td>{{@$HSCentrancePassYear->jp_year_value}}</td>
                                                <td>{{@$HSCentrancePassMonth->jp_title}}</td>
                                            </tr>

                                            <tr>
                                                <td> 大学 </td>
                                                <td>{{@$educationInfo->university->institution_name}} </td>
                                                <td>{{@$universityentranceYear->jp_year_value}}</td>
                                                <td>{{@$universityentranceMonth->jp_title}}</td>
                                                <td>{{@$universityentrancePassYear->jp_year_value}}</td>
                                                <td>{{@$universityentrancePassMonth->jp_title}}</td>
                                            </tr>

                                            </tbody>
                                        </table>
                                        <table>
                                            <!-- <h3>Work Experience</h3> -->
                                        <thead>
                                            <tr>
                                            <th style="width: 15%;">指定</th>
                                            <th style="width: 15%;">会社名</th>
                                            <th style="width: 15%;">国</th>
                                            <th style="width: 15%;">入り口 年 / 月</th>
                                            <th style="width: 15%;">仕上げ 年 / 月</th>
                                            <th style="width: 15%;">説明</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @if($japaneseCv)  
                                            @foreach($workingInfo as $key=>$item)
                                            <tr>
                                            <td>{{@$item['title']}}</td>
                                            <td>{{@$item['company']}}</td>
                                            <td>{{@$item['country_id']}}</td>
                                             <?php  
                                            $entrance_year = App\Year::where('id', @$item['entrance_year'])->first();
                                            $entrance_month = App\Models\Month::where('id', @$item['entrance_month'])->first();
                                            $pass_year = App\Year::where('id', @$item['pass_year'])->first();
                                            $pass_month = App\Models\Month::where('id', @$item['pass_month'])->first();
                                            // dd($entrance_month->jp_title);
                                             ?>
                                            <td>{{$entrance_year->jp_year_value, $entrance_month->jp_title}}</td>
                                            <td>{{$pass_year->jp_year_value, $pass_month->jp_title}}</td>
                                            <td>{{@$item['description']}}</td>
                                            </tr>
                                            @endforeach
                                            @endif
                                            </tbody>
                                        </table>

                                        <table>
                                            <thead>
                                            <tr>
                                            <th style="width: 15%;">証明書のタイトル</th>
                                            <th style="width: 15%;">過ぎていく年</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                          
                                            @if($japaneseCv)  
                                            @foreach($certificateInfo as $key=>$item)
                                            <tr>
                                            <?php  
                                            $pass_year = App\Year::where('id', @$item->pass_year)->first();
                                             ?>
                                             <td>{{$item->certificate_title}} </td>
                                             <td>{{$pass_year->jp_year_value}}</td>
                                            </tr>
                                            @endforeach
                                            @endif
                                            </tbody>
                                        </table>


                                        <table>
                                            <thead>
                                            <tr>
                                            <th style="width: 15%;">言語</th>
                                            <th style="width: 15%;">言語の種類</th>
                                            <th style="width: 15%;">言語レベル</th>
                                            <th style="width: 15%;">入学年度</th>
                                            <th style="width: 15%;">過ぎゆく年</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                             
                                            @if($japaneseCv)  
                                            @foreach($languageInfo as $key=>$item)

                                             <tr>
                                             <?php  
                                                  $lang_name = App\Language::where('id', $item->language_id)->first();
                                                  $lang_type = App\Models\LanguageType::where('id', @$item->language_type_id)->first();
                                                    //  dd($lang_type->eng_title);
                                                  $lang_level = App\LanguageLevel::where('id', @$item->language_level_id)->first();
                                                  $entrance_year = App\Year::where('id', @$item->entrance_year)->first();
                                                  $passing_year = App\Year::where('id', @$item->pass_year)->first();
                                                //   @dd($passing_year);
                                             ?>
                                             <td>{{@$lang_name->native}}</td>
                                             <td>{{$lang_type->jp_title}}</td>
                                             <td>{{$lang_level->jp_level}}</td>
                                             <td>{{$entrance_year->jp_year_value}}</td>
                                             <td>{{$passing_year->jp_year_value}}</td>
                                            </tr>
                                            @endforeach
                                            @endif
                                        </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="my-3" style="text-align: center;">
                        <input style="" type="button" onclick="printDiv('printableArea')" class="btn btn-primary"
                               value="Print Resume"/>
                               <!-- Or <span>Download</span> -->
                    </div>
                </div>
            </div>
        </div>



        @include('includes.footer')

        @endsection

        @push('styles')

            <style type="text/css">

                .formrow iframe {

                    height: 78px;

                }

            </style>

        @endpush

        @push('scripts')

            <script type="text/javascript">

                $(document).ready(function () {

                    $(document).on('click', '#send_applicant_message', function () {

                        var postData = $('#send-applicant-message-form').serialize();

                        $.ajax({

                            type: 'POST',

                            url: "{{ route('contact.applicant.message.send') }}",

                            data: postData,

                            //dataType: 'json',

                            success: function (data) {

                                response = JSON.parse(data);

                                var res = response.success;

                                if (res == 'success') {

                                    var errorString = '<div role="alert" class="alert alert-success">' + response.message + '</div>';

                                    $('#alert_messages').html(errorString);

                                    $('#send-applicant-message-form').hide('slow');

                                    $(document).scrollTo('.alert', 2000);

                                } else {

                                    var errorString = '<div class="alert alert-danger" role="alert"><ul>';

                                    response = JSON.parse(data);

                                    $.each(response, function (index, value) {

                                        errorString += '<li>' + value + '</li>';

                                    });

                                    errorString += '</ul></div>';

                                    $('#alert_messages').html(errorString);

                                    $(document).scrollTo('.alert', 2000);

                                }

                            },

                        });

                    });

                    showEducation();

                    showProjects();

                    showExperience();

                    showSkills();

                    showLanguages();

                });

                function showProjects() {

                    $.post("{{ route('show.applicant.profile.projects', $user->id) }}", {
                        user_id: {{$user->id}},
                        _method: 'POST',
                        _token: '{{ csrf_token() }}'
                    })

                        .done(function (response) {

                            $('#projects_div').html(response);

                        });

                }

                function showExperience() {

                    $.post("{{ route('show.applicant.profile.experience', $user->id) }}", {
                        user_id: {{$user->id}},
                        _method: 'POST',
                        _token: '{{ csrf_token() }}'
                    })

                        .done(function (response) {

                            $('#experience_div').html(response);

                        });

                }


                function showEducation() {

                    $.post("{{ route('show.applicant.profile.education', $user->id) }}", {
                        user_id: {{$user->id}},
                        _method: 'POST',
                        _token: '{{ csrf_token() }}'
                    })

                        .done(function (response) {

                            $('#education_div').html(response);

                        });

                }

                function showLanguages() {

                    $.post("{{ route('show.applicant.profile.languages', $user->id) }}", {
                        user_id: {{$user->id}},
                        _method: 'POST',
                        _token: '{{ csrf_token() }}'
                    })

                        .done(function (response) {

                            $('#language_div').html(response);

                        });

                }

                function showSkills() {

                    $.post("{{ route('show.applicant.profile.skills', $user->id) }}", {
                        user_id: {{$user->id}},
                        _method: 'POST',
                        _token: '{{ csrf_token() }}'
                    })

                        .done(function (response) {

                            $('#skill_div').html(response);

                        });

                }


                function send_message() {

                    const el = document.createElement('div')

                    el.innerHTML = "Please <a class='btn' href='{{route('login')}}' onclick='set_session()'>log in</a> as a Employer and try again."

                    @if(null!==(Auth::guard('company')->user()))

                    $('#sendmessage').modal('show');

                    @else

                    swal({

                        title: "You are not Loged in",

                        content: el,

                        icon: "error",

                        button: "OK",

                    });

                    @endif

                }

                if ($("#send-form").length > 0) {

                    $("#send-form").validate({

                        validateHiddenInputs: true,

                        ignore: "",


                        rules: {

                            message: {

                                required: true,

                                maxlength: 5000

                            },

                        },

                        messages: {


                            message: {

                                required: "Message is required",

                            }


                        },

                        submitHandler: function (form) {

                            $.ajaxSetup({

                                headers: {

                                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')

                                }

                            });

                            @if(null !== (Auth::guard('company')->user()))

                            $.ajax({

                                url: "{{route('submit-message-seeker')}}",

                                type: "POST",

                                data: $('#send-form').serialize(),

                                success: function (response) {

                                    $("#send-form").trigger("reset");

                                    $('#sendmessage').modal('hide');

                                    swal({

                                        title: "Success",

                                        text: response["msg"],

                                        icon: "success",

                                        button: "OK",

                                    });

                                }

                            });

                            @endif

                        }

                    })

                }

            </script>
            <script type="text/javascript">
                function printDiv(divName) {
                    var printContents = document.getElementById(divName).innerHTML;
                    var originalContents = document.body.innerHTML;

                    document.body.innerHTML = printContents;

                    window.print('');

                    document.body.innerHTML = originalContents;
                }
            </script>
    @endpush