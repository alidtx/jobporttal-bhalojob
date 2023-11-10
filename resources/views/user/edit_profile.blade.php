@extends('layouts.app')
@section('content')
    <!-- Header start -->
    @include('includes.header')
    <!-- Header end -->
    <!-- Inner Page Title start -->
    @include('includes.inner_page_title', ['page_title'=>__('My Profile')])
    <!-- Inner Page Title end -->
    <div class="listpgWraper">
        <div class="container">
            <div class="row">
                @include('includes.user_dashboard_menu')
                <div class="col-md-9 col-sm-8">
                    <div class="profile-edite user-profile-edit">
                        <div class="progress-bar">
                            <div class="step">
                                <p> Personal </p>
                                <div class="bullet">
                                    <span>1</span>
                                </div>
                                <div class="check fas fa-check"></div>
                            </div>
                            <div class="step">
                                <p> Education </p>
                                <div class="bullet">
                                    <span>2</span>
                                </div>
                                <div class="check fas fa-check"></div>
                            </div>
                            <div class="step">
                                <p> Experience </p>
                                <div class="bullet">
                                    <span>3</span>
                                </div>
                                <div class="check fas fa-check"></div>
                            </div>
                            <div class="step">
                                <p> Language </p>
                                <div class="bullet">
                                    <span>4</span>
                                </div>
                                <div class="check fas fa-check"></div>
                            </div>
                            <div class="step">
                                <p> Certificate </p>
                                <div class="bullet">
                                    <span>5</span>
                                </div>
                                <div class="check fas fa-check"></div>
                            </div>
                        </div>

                        <div class="form-outer">
                            <div class="form">
                                <div class="page slide-page">
                                    <form action="{{route('user.profile')}}" method="post" id="personalInformationForm"
                                          enctype="multipart/form-data">
                                        @csrf
                                        @include('user.inc.personal_information')
                                        <div class="field next_button">
                                            <button type="submit" onclick="submitPersonalInformationForm()"   class="firstNext next"> Next <i class="fa fa-arrow-right"></i>
                                            </button>
                                        </div>
                                    </form>
                                </div>

                                <div class="page">

                                    @include('user.inc.education_history')
                                    @include('user.forms.education.education')
                                    <div class="field btns next_button ">
                                        <button class="prev-1 prev"><i class="fa fa-arrow-left"></i> Previous</button>
                                        <button class="next-1 next">Next <i class="fa fa-arrow-right"></i></button>
                                    </div>
                                </div>

                                <div class="page">


                                    @include('user.forms.experience.experience')



                                    <div class="field btns next_button">
                                        <button class="prev-2 prev"><i class="fa fa-arrow-left"></i> Previous</button>
                                        <button class="next-2 next">Next <i class="fa fa-arrow-right"></i></button>
                                    </div>
                                </div>

                                <div class="page">
{{--                                    @include('user.inc.languages')--}}
                                    @include('user.forms.language.languages')
                                    <div class="field btns next_button">
                                        <button class="prev-3 prev"><i class="fa fa-arrow-left"></i> Previous</button>
                                        <button class="next-3 next">Next <i class="fa fa-arrow-right"></i></button>
                                    </div>
                                </div>
                                <div class="page">

                                    @include('user.forms.skill.skills')

                                    <div class="field btns next_button">
                                        <button class="prev-5 prev"><i class="fa fa-arrow-left"></i> Previous</button>
                                        <button type="submit" class="submit">Submit <i class="fa fa-arrow-circle-right" aria-hidden="true"></i></button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    @include('includes.footer')
@endsection
@push('styles')
    <style type="text/css">
        .userccount p {
            text-align: left !important;
        }
    </style>
@endpush
@push('scripts')
    <script src="https://www.sharjeelanjum.com/demos/jobsportal-update/js/script.js"></script>
    <script>


        //step stert
        initMultiStepForm();

        function initMultiStepForm() {
            const progressNumber = document.querySelectorAll(".step").length;
            const slidePage = document.querySelector(".slide-page");
            const submitBtn = document.querySelector(".submit");
            const progressText = document.querySelectorAll(".step p");
            const progressCheck = document.querySelectorAll(".step .check");
            const bullet = document.querySelectorAll(".step .bullet");
            const pages = document.querySelectorAll(".page");
            const nextButtons = document.querySelectorAll(".next");
            const prevButtons = document.querySelectorAll(".prev");
            const stepsNumber = pages.length;

            if (progressNumber !== stepsNumber) {
                console.warn(
                    "Error, number of steps in progress bar do not match number of pages"
                );
            }

            document.documentElement.style.setProperty("--stepNumber", stepsNumber);

            let current = 1;

            for (let i = 0; i < nextButtons.length; i++) {
                nextButtons[i].addEventListener("click", function (event) {
                    event.preventDefault();


                    const form = this.parentElement.parentElement;
                    const formId = form.getAttribute('id');
                    console.log("form id", formId);
                    const inputs = form.querySelectorAll('input');
                    const formData = {};
                    for (let j = 0; j < inputs.length; j++) {
                        formData[inputs[j].name] = inputs[j].value;
                    }

                    inputsValid = validateInputs(this);
                    // inputsValid = true;

                    if (inputsValid) {

                        if (formId == "personalInformationForm") {
                            // submitProfileEducationForm();
                        } else {

                        }


                        slidePage.style.marginLeft = `-${
                            (100 / stepsNumber) * current
                        }%`;
                        bullet[current - 1].classList.add("active");
                        progressCheck[current - 1].classList.add("active");
                        progressText[current - 1].classList.add("active");
                        current += 1;
                    }
                });
            }

            for (let i = 0; i < prevButtons.length; i++) {
                prevButtons[i].addEventListener("click", function (event) {
                    event.preventDefault();
                    slidePage.style.marginLeft = `-${
                        (100 / stepsNumber) * (current - 2)
                    }%`;
                    bullet[current - 2].classList.remove("active");
                    progressCheck[current - 2].classList.remove("active");
                    progressText[current - 2].classList.remove("active");
                    current -= 1;
                });
            }
            submitBtn.addEventListener("click", function () {

                bullet[current - 1].classList.add("active");
                progressCheck[current - 1].classList.add("active");
                progressText[current - 1].classList.add("active");
                current += 1;
                setTimeout(function () {
                    window.location.href = '{{ route('resume',$user->id) }}';
                    //location.reload();
                }, 800);
            });

            function validateInputs(ths) {
                let inputsValid = true;

                const inputs =
                    ths.parentElement.parentElement.querySelectorAll("input");
                for (let i = 0; i < inputs.length; i++) {
                    const valid = inputs[i].checkValidity();
                    if (!valid) {
                        inputsValid = false;
                        inputs[i].classList.add("invalid-input");
                    } else {
                        inputs[i].classList.remove("invalid-input");
                    }
                }
                return inputsValid;
            }
        }

        //end step

        function showPage(showdiv) {
            $(showdiv).show();
        }

        function showPageVisaExpire(showdiv) {
            $(showdiv).show();
        }

        function showPageEducation(showdiv) {
            $(showdiv).show();
        }

        function showPageLanguage(showdiv) {
            $(showdiv).show();
        }

        function submitPersonalInformationForm() {

            var form = $('#personalInformationForm');
            // alert(form)
            // console.log(form.attr('action'));

            $.ajax({

                url: form.attr('action'),

                type: form.attr('method'),

                data: form.serialize(),

                dataType: 'json',

                success: function (response) {
                    // Handle the response from the server
                    console.log(response);
                    // Additional code here if needed
                    // $('#user_id_input').val(33);
                },
                error: function (xhr, status, error) {
                    // Handle AJAX error
                    console.log(xhr.responseText);
                }

            });
        }


    </script>



    @include('includes.immediate_available_btn')
@endpush