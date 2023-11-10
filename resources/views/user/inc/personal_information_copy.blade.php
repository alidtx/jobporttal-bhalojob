<div class="row">

    <!-- personal information start  -->
    <div class="form-group col-md-6">
        <label class="bold">First Or Middle Name</label>
        <input class="form-control" type="text" name="first_name" value="{{$user->first_name}}">
    </div>
    <div class="form-group col-md-6">
        <label for="lastName"> Last Name</label>
        <input type="text" name="last_name" value="{{$user->last_name}}" class="form-control">
    </div>
    @php
        $years = DB::table('years')->get();
        $months = DB::table('months')->get();
        $days = DB::table('days')->get();
        $maritalStatus = DB::table('marital_statuses')->get();
        $genders = DB::table('genders')->get();
        $currentVisas = DB::table('currentVisas')->get();
    @endphp
    <div class="col-md-6">
        <div class="row">
            <div class="form-group col-md-4">
                <label for="">Birth Year</label>
                <select class="form-control" id="birth_year" onchange="showPage('#month_div_show')"
                        name="birth_year" required>
                    <option value="" disabled>Year</option>
                    @foreach($years as $year)
                        <option value="{{$year->id}}" {{($year->id == $user->birth_year) ? 'selected' : ''}}>{{$year->year_value}}</option>
                    @endforeach
                </select>
            </div>
            <div class="form-group col-md-4" id="month_div_show" style="display: none">
                <label for="">Month</label>
                <select class="form-control" onchange="showPage('#day_div_show')"
                        name="birth_month">
                    @foreach($months as $month)
                        <option value="{{$month->id}}" {{($month->id == $user->birth_month) ? 'selected' : ''}}>{{$month->jp_title}}</option>
                    @endforeach
                </select>
            </div>
            <div class="form-group col-md-4" id="day_div_show" style="display: none">
                <label for="">Day</label>
                <select class="form-control" name="birth_day">
                    @foreach($days as $day)
                        <option value="{{$day->id}}" {{($day->id == $user->birth_day) ? 'selected' : ''}}>{{$day->id}}</option>
                    @endforeach
                </select>
            </div>
        </div>
    </div>
    <div class="form-group col-md-6">
        <label for="">Gender</label>
        <select class="form-control" id="gender_id" name="gender_id">
            <option value="" disabled>Select Gender</option>
            @foreach($genders as $gender)
                <option value="{{$gender->id}}" {{($gender->id == $user->gender_id) ? 'selected' : ''}}>{{$gender->gender}}</option>
            @endforeach
        </select>
    </div>
    <div class="form-group col-md-6">
        <label> Email </label>
        <input type="email" name="email" value="{{$user->email}}" class="form-control">
    </div>
    <div class="form-group col-md-6">
        <label> Marital Status </label>
        <select class="form-control" id="marital_status_id" name="marital_status_id">
            <option value="" disabled>Select Marital Status</option>
            @foreach($maritalStatus as $status)
                <option value="{{$status->id}}" {{($status->id == $user->marital_status_id) ? 'selected' : ''}}>{{$status->marital_status}}</option>
            @endforeach
        </select>
    </div>


    <!-- personal information end   -->


    <!-- personal information  if stay japan   -->

    <div class="col-md-12">
        <div class="form-title">
            <h4 class="heading"> JAPAN ADDRESS(IF YOU ARE IN JAPAN) </h4>
        </div>
    </div>
    <!-- <div class="form-group col-md-12">
    <label class="bold">Postal Code</label>
        <input class="form-control" type="text"    name="personal_information[postal_code]" value="">
    </div> -->


    <div class="col-md-6">
        <div class="formrow {!! APFrmErrHelp::hasError($errors, 'country_id') !!}">
            <label for="">{{__('Country')}}</label>
            <?php $country_id = old('country_id', (isset($user) && (int)$user->country_id > 0) ? $user->country_id : $siteSetting->default_country_id); ?>
            {!! Form::select('country_id', [''=>__('Select Country')]+$countries, $country_id, array('class'=>'form-control required', 'id'=>'country_id')) !!}
            {!! APFrmErrHelp::showErrors($errors, 'country_id') !!} </div>
    </div>
    <div class="col-md-6">
        <div class="formrow {!! APFrmErrHelp::hasError($errors, 'state_id') !!}">
            <label for="">{{__('State')}}</label>
            <span id="state_dd">
                {!! Form::select('state_id', [''=>__('Select State')], null, array('class'=>'form-control required', 'id'=>'state_id')) !!} </span> {!! APFrmErrHelp::showErrors($errors, 'state_id') !!}
        </div>
    </div>
    <div class="col-md-6">
        <div class="formrow {!! APFrmErrHelp::hasError($errors, 'city_id') !!}">
            <label for="">{{__('City')}}</label>
            <span id="city_dd"> {!! Form::select('city_id', [''=>__('Select City')], null, array('class'=>'form-control required', 'id'=>'city_id')) !!} </span> {!! APFrmErrHelp::showErrors($errors, 'city_id') !!}
        </div>
    </div>
    <div class="form-group col-md-6">
        <label for="lastName">Street Address</label>
        <input type="text" name="jp_cell_phone" value="{{$user->jp_cell_phone}}" class="form-control">
    </div>


    <div class="form-group col-md-6">
        <label for="lastName">JP Cell Phone</label>
        <input type="text" name="jp_cell_phone" value="{{$user->jp_cell_phone}}" class="form-control">
    </div>
    <div class="form-group col-md-6">
        <label for="lastName">Emergency Contact Name In JP</label>
        <input type="text" name="emergency_contact_jp" value="{{$user->emergency_contact_jp}}" class="form-control">
    </div>
    <div class="form-group col-md-6">
        <label> Current Visa Status </label>

        <select class="form-control" name="current_visa_status_id">
            <option value="" disabled>Select Current Visa Status</option>
            @foreach($currentVisas as $visaStatus)
                <option value="{{$visaStatus->id}}" {{($visaStatus->id == $user->current_visa_status_id) ? 'selected' : ''}}>{{$visaStatus->eng_title}}</option>
            @endforeach
        </select>


    </div>
    <div class="form-group col-md-6">
        <label> Emergency Cell Phone </label>
        <input type="text" name="emergency_cell_phone" value="{{$user->emergency_cell_phone}}" class="form-control">
    </div>
    <div class="form-group col-md-6">
        <div class="row">
            <div class="form-group col-md-4">
                <label for="">Visa Expiry Year</label>
                <select class="form-control" id="birth_year"
                        onchange="showPageVisaExpire('#month_div_show_visa_expire')" name="jp_visa_expiry_year" required>
                    <option value="" disabled>Year</option>
                    @foreach($years as $year)
                        <option value="{{$year->id}}" {{($year->id == $user->jp_visa_expiry_year) ? 'selected' : ''}}>{{$year->year_value}}</option>
                    @endforeach
                </select>
            </div>
            <div class="form-group col-md-4" id="month_div_show_visa_expire" style="display: none">
                <label for="">Visa Expiry Month</label>
                <select class="form-control" onchange="showPageVisaExpire('#day_div_show_visa_expire')" name="jp_visa_expiry_month"
                        required>
                    @foreach($months as $month)
                        <option value="{{$month->id}}" {{($month->id == $user->jp_visa_expiry_month) ? 'selected' : ''}}>{{$month->jp_title}}</option>
                    @endforeach
                </select>
            </div>
            <div class="form-group col-md-4" id="day_div_show_visa_expire" style="display: none">
                <label for="">Visa Expiry Day</label>
                <select class="form-control" name="jp_visa_expiry_day" required>
                    @foreach($days as $day)
                        <option value="{{$day->id}}" {{($day->id == $user->jp_visa_expiry_day) ? 'selected' : ''}}>{{$day->id}}</option>
                    @endforeach
                </select>
            </div>
        </div>
    </div>


    <!-- personal information  if stay japan  end   -->


    <!-- personal information  your country details start   -->

    <div class="col-md-12">
        <div class="form-title">
            <h4 class="heading"> YOUR COUNTRY ADDRESS </h4>
        </div>
    </div>


    <div class="col-md-6">
        <div class="formrow {!! APFrmErrHelp::hasError($errors, 'country_id_bd') !!}">
            <label for="">{{__('Country')}}</label>
            <?php $country_id = old('country_id_bd', (isset($user) && (int)$user->country_id > 0) ? $user->country_id : $siteSetting->default_country_id); ?>
            {!! Form::select('country_id_bd', [''=>__('Select Country')]+$countries, $country_id, array('class'=>'form-control required', 'id'=>'country_id_bd')) !!}
            {!! APFrmErrHelp::showErrors($errors, 'country_id_bd') !!} </div>
    </div>
    <div class="col-md-6">
        <div class="formrow {!! APFrmErrHelp::hasError($errors, 'state_id_bd') !!}">
            <label for="">{{__('State')}}</label>
            <span id="state_bd">
                {!! Form::select('state_id_bd', [''=>__('Select State')], null, array('class'=>'form-control required', 'id'=>'state_id_bd')) !!} </span> {!! APFrmErrHelp::showErrors($errors, 'state_id_bd') !!}
        </div>
    </div>
    <div class="col-md-6">
        <div class="formrow {!! APFrmErrHelp::hasError($errors, 'city_id_bd') !!}">
            <label for="">{{__('City')}}</label>
            <span id="city_bd"> {!! Form::select('city_id_bd', [''=>__('Select City')], null, array('class'=>'form-control required', 'id'=>'city_id_bd')) !!} </span> {!! APFrmErrHelp::showErrors($errors, 'city_id_bd') !!}
        </div>
    </div>



    <div class="form-group col-md-6">
        <label for="lastName">Postal Code</label>
        <input type="text" name="bd_postal_code" value="{{$user->bd_postal_code}}" class="form-control" required>
    </div>
    <div class="form-group col-md-6">
        <label for="lastName">Address</label>
        <input type="text" name="bd_address" value="{{$user->bd_address}}" class="form-control" required>
    </div>
    <div class="form-group col-md-6">
        <label for="lastName">Country Cell Phone</label>
        <input type="text" name="bd_cell_phone" value="{{$user->bd_cell_phone}}" class="form-control" required>
    </div>


    <div class="form-group col-md-6">
        <label for="lastName">Children</label>
        <input type="text" name="bd_children" value="{{$user->bd_children}}" class="form-control" required>
    </div>


    <!-- personal information  your country details end   -->
</div>


<style>


    .label {
        display: inline-block;
        background-color: #3498db;
        color: #fff;
        padding: 5px 10px;
        border-radius: 4px;
    }

    .label .text {
        font-size: 14px;
        font-weight: bold;
    }

    .heading {
        font-family: Arial, sans-serif;
        font-size: 28px;
        font-weight: bold;
        color: #333;
        background-color: #f1f1f1;
        padding: 10px;
        border-radius: 4px;
        text-align: center;
    }

</style>



@push('scripts')
    <script type="text/javascript">
        $(document).ready(function () {
            initdatepicker();
            $('#salary_currency').typeahead({
                source: function (query, process) {
                    return $.get("{{ route('typeahead.currency_codes') }}", {query: query}, function (data) {
                        console.log(data);
                        data = $.parseJSON(data);
                        return process(data);
                    });
                }
            });

            $('#country_id').on('change', function (e) {
                e.preventDefault();
                filterStates(0);
            });

            $(document).on('change', '#state_id', function (e) {
                e.preventDefault();
                filterCities(0);
            });
            filterStates(<?php echo old('state_id', $user->state_id); ?>);

// bd script start

            $('#country_id_bd').on('change', function (e) {
                e.preventDefault();
                filterStatesbd(0);
            });
            $(document).on('change', '#state_id_bd', function (e) {
                e.preventDefault();
                filterCitiesbd(0);
            });
            filterStatesbd(<?php echo old('state_id_bd', $user->state_id); ?>);

// bd script end 

            /*******************************/
            var fileInput = document.getElementById("image");
            fileInput.addEventListener("change", function (e) {
                var files = this.files
                showThumbnail(files)
            }, false)

            var fileInput_cover_image = document.getElementById("cover_image");

            fileInput_cover_image.addEventListener("change", function (e) {

                var files_cover_image = this.files

                showThumbnail_cover_image(files_cover_image)

            }, false)


            function showThumbnail(files) {
                $('#thumbnail').html('');
                for (var i = 0; i < files.length; i++) {
                    var file = files[i]
                    var imageType = /image.*/
                    if (!file.type.match(imageType)) {
                        console.log("Not an Image");
                        continue;
                    }
                    var reader = new FileReader()
                    reader.onload = (function (theFile) {
                        return function (e) {
                            $('#thumbnail').append('<div class="fileattached"><img height="100px" src="' + e.target.result + '" > <div>' + theFile.name + '</div><div class="clearfix"></div></div>');
                        };
                    }(file))
                    var ret = reader.readAsDataURL(file);
                }
            }


            function showThumbnail_cover_image(files) {

                $('#thumbnail_cover_image').html('');

                for (var i = 0; i < files.length; i++) {

                    var file = files[i]

                    var imageType = /image.*/

                    if (!file.type.match(imageType)) {

                        console.log("Not an Image");

                        continue;

                    }

                    var reader = new FileReader()

                    reader.onload = (function (theFile) {

                        return function (e) {

                            $('#thumbnail_cover_image').append('<div class="fileattached"><img height="100px" src="' + e.target.result + '" > <div>' + theFile.name + '</div><div class="clearfix"></div></div>');

                        };

                    }(file))

                    var ret = reader.readAsDataURL(file);

                }

            }


        });


        //state bd filter start
        function filterStatesbd(state_id) {
            var country_id = $('#country_id_bd').val();
            if (country_id != '') {
                $.post("{{ route('filter.lang.states.dropdown.bd') }}", {
                    country_id: country_id,
                    state_id: state_id,
                    _method: 'POST',
                    _token: '{{ csrf_token() }}'
                })
                    .done(function (response) {
                        $('#state_bd').html(response);
                        filterCitiesbd(<?php echo old('city_id_bd', $user->city_id_bd ); ?>);
                    });
            }
        }




        //state bd filter end


        function filterStates(state_id) {
            var country_id = $('#country_id').val();
            if (country_id != '') {
                $.post("{{ route('filter.lang.states.dropdown') }}", {
                    country_id: country_id,
                    state_id: state_id,
                    _method: 'POST',
                    _token: '{{ csrf_token() }}'
                })
                    .done(function (response) {
                        $('#state_dd').html(response);
                        filterCities(<?php echo old('city_id', $user->city_id); ?>);
                    });
            }
        }

        function filterCities(city_id) {
            var state_id = $('#state_id').val();
            if (state_id != '') {
                $.post("{{ route('filter.lang.cities.dropdown') }}", {
                    state_id: state_id,
                    city_id: city_id,
                    _method: 'POST',
                    _token: '{{ csrf_token() }}'
                })
                    .done(function (response) {
                        $('#city_dd').html(response);
                    });
            }
        }

        function filterCitiesbd(city_id_bd) {
            var state_id = $('#state_id_bd').val();
           // alert(state_id)
            if (state_id != '') {
                $.post("{{ route('filter.lang.cities.dropdown.bd') }}", {
                    state_id: state_id,
                    city_id: city_id_bd,
                    _method: 'POST',
                    _token: '{{ csrf_token() }}'
                })
                    .done(function (response) {

                        console.log("get respon form output", response);
                        $('#city_bd').html(response);
                    });
            }
        }

        function initdatepicker() {
            $(".datepicker").datepicker({
                autoclose: true,
                format: 'yyyy-m-d'
            });
        }
    </script>

@endpush







@push('scripts')

    <script type="text/javascript">

        /**************************************************/


        function showPageOthers(showdiv) {
            $(showdiv).show();
        }


        function showProfileEducationModal() {

            $("#add_education_modal").modal();

            loadProfileEducationForm();

        }

        function loadProfileEducationForm() {

            $.ajax({

                type: "POST",

                url: "{{ route('get.front.profile.education.form', $user->id) }}",

                data: {"_token": "{{ csrf_token() }}"},

                datatype: 'json',

                success: function (json) {

                    $("#add_education_modal").html(json.html);

                    initdatepicker();

                    filterLangStatesEducation(0, 0);

                }

            });

        }

        function showProfileEducationEditModal(education_id, state_id, city_id, degree_type_id) {

            $("#add_education_modal").modal();

            loadProfileEducationEditForm(education_id, state_id, city_id, degree_type_id);

        }

        function loadProfileEducationEditForm(education_id, state_id, city_id, degree_type_id) {

            $.ajax({

                type: "POST",

                url: "{{ route('get.front.profile.education.edit.form', $user->id) }}",

                data: {"education_id": education_id, "_token": "{{ csrf_token() }}"},

                datatype: 'json',

                success: function (json) {

                    $("#add_education_modal").html(json.html);

                    initdatepicker();

                    filterLangStatesEducation(state_id, city_id);

                    filterDegreeTypes(degree_type_id);

                }

            });

        }

        function submitProfileEducationForm() {

       
            var form = $('#add_edit_profile_education');

            $.ajax({

                url: form.attr('action'),

                type: form.attr('method'),

                data: form.serialize(),

                dataType: 'json',

                success: function (json) {

                    $("#add_education_modal").html(json.html);

                    showEducation();

                },

                error: function (json) {

                    if (json.status === 422) {

                        var resJSON = json.responseJSON;

                        $('.help-block').html('');

                        $.each(resJSON.errors, function (key, value) {

                            $('.' + key + '-error').html('<strong>' + value + '</strong>');

                            $('#div_' + key).addClass('has-error');

                        });

                    } else {

                        // Error

                        // Incorrect credentials

                        // alert('Incorrect credentials. Please try again.')

                    }

                }

            });

        }

        function delete_profile_education(id) {

            var msg = "{{__('Are you sure! you want to delete?')}}";

            if (confirm(msg)) {

                $.post("{{ route('delete.front.profile.education') }}", {
                    id: id,
                    _method: 'DELETE',
                    _token: '{{ csrf_token() }}'
                })

                    .done(function (response) {

                        if (response == 'ok') {

                            $('#education_' + id).remove();

                        } else {

                            alert('Request Failed!');

                        }

                    });

            }

        }

        function initdatepicker() {

            $(".datepicker").datepicker({

                autoclose: true,

                format: 'yyyy-m-d'

            });

            /*****/

            $('.select2-multiple').select2({

                placeholder: "{{__('Select Major Subjects')}}",

                allowClear: true

            });

        }

        $(document).ready(function () {

            showEducation();

            initdatepicker();

            $(document).on('change', '#degree_level_id', function (e) {

                e.preventDefault();

                filterDegreeTypes(0);

            });

            $(document).on('change', '#education_country_id', function (e) {

                e.preventDefault();

                filterLangStatesEducation(0, 0);

            });

            $(document).on('change', '#education_state_id', function (e) {

                e.preventDefault();

                filterLangCitiesEducation(0);

            });

        });

        function showEducation() {

            $.post("{{ route('show.front.profile.education', $user->id) }}", {
                user_id: {{$user->id}},
                _method: 'POST',
                _token: '{{ csrf_token() }}'
            })

                .done(function (response) {

                    $('#education_div').html(response);

                });

        }


        function filterDegreeTypes(degree_type_id) {

            var degree_level_id = $('#degree_level_id').val();

            if (degree_level_id != '') {

                $.post("{{ route('filter.degree.types.dropdown') }}", {
                    degree_level_id: degree_level_id,
                    degree_type_id: degree_type_id,
                    _method: 'POST',
                    _token: '{{ csrf_token() }}'
                })

                    .done(function (response) {

                        $('#degree_types_dd').html(response);

                    });

            }

        }


        function filterLangStatesEducation(state_id, city_id) {

            var country_id = $('#education_country_id').val();

            if (country_id != '') {

                $.post("{{ route('filter.lang.states.dropdown') }}", {
                    country_id: country_id,
                    state_id: state_id,
                    new_state_id: 'education_state_id',
                    _method: 'POST',
                    _token: '{{ csrf_token() }}'
                })

                    .done(function (response) {

                        $('#default_state_education_dd').html(response);

                        filterLangCitiesEducation(city_id);

                    });

            }

        }

        function filterLangCitiesEducation(city_id) {

            var state_id = $('#education_state_id').val();

            if (state_id != '') {

                $.post("{{ route('filter.lang.cities.dropdown') }}", {
                    state_id: state_id,
                    city_id: city_id,
                    _method: 'POST',
                    _token: '{{ csrf_token() }}'
                })

                    .done(function (response) {

                        $('#default_city_education_dd').html(response);

                    });

            }

        }

    </script>

@endpush