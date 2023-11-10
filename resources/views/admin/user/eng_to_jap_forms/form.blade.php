{!! APFrmErrHelp::showErrorsNotice($errors) !!}
@include('flash::message')

@php
    $years = DB::table('years')->get();
    $birth_year_name = DB::table('years')->where('id',$user->birth_year)->first();
    $visa_year_name = DB::table('years')->where('id',$user->jp_visa_expiry_year)->first();
    $months = DB::table('months')->get();
    $days = DB::table('days')->get();
    $maritalStatus = DB::table('marital_statuses')->get();
    $genders = DB::table('genders')->get();
    $currentVisas = DB::table('currentVisas')->get();
    $currentVisasName = DB::table('currentVisas')->where('id',$user->current_visa_status_id)->first();
    if(!empty($languageConvert)):
    $personal_information = json_decode($languageConvert->personal_information);
    endif;

   // dd($user);
@endphp
 
<form action="{{route('user.engToJapUpdate',$user->id)}}" method="post" enctype="multipart/form-data">
    @csrf
    <input type="hidden" name="update_form_name" value="personal"/>
    <div class="form-body">
        <input type="hidden" name="front_or_admin" value="admin"/>
        <div class="row">
            <div class="col-md-12">

                <table class="table table-bordered">
                    <thead>
                    <tr>
                        <th> LABEL</th>
                        <th> ENGLISH</th>
                        <th> JAPANESE</th>
                    </tr>
                    </thead>
                    <tbody>

                    <tr>
                        <td> First Or Middle Name</td>
                        <td>{{$user->first_name}}</td>

                        <td><input type="text" name="personal_information[first_name]" value="{{(!empty($personal_information->first_name)) ?  $personal_information->first_name: ''}}" class="form-control">
                        </td>
                    </tr>
                    <tr>
                        <td> Last Name</td>
                        <td> {{$user->last_name}}</td>
                        <td><input type="text" name="personal_information[last_name]" value="{{(!empty($personal_information->last_name)) ?  $personal_information->last_name: ''}}" class="form-control">
                        </td>
                    </tr>

                    <tr>
                        <td>Birth Year</td>engToJap
                        <td> 
                        <table class="table table-bordered">
                                <tr>
                                    <td>
                                        <select class="form-control" id="birth_year" 
                                            name="personal_information[birth_year]" required>
                                            <option value="" disabled>Year</option>
                                            @foreach($years as $year)
                                                <option value="{{$year->id}}" <?php if(!empty($personal_information->birth_year) && $personal_information->birth_year == $year->id): echo "selected";endif; ?> >{{$year->year_value}}</option>
                                            @endforeach
                                        </select>
                                    </td>
                                    <td>
                                        <select class="form-control" id="birth_year" 
                                            name="personal_information[birth_year]" required>
                                            <option value="" disabled>Year</option>
                                            @foreach($months as $month)
                                                <option value="{{$month->id}}" <?php if(!empty($personal_information->birth_year) && $personal_information->birth_year == $month->id): echo "selected";endif; ?> >{{$month->eng_title}}</option>
                                            @endforeach
                                        </select>
                                    </td>
                                    <td>
                                        <select class="form-control" id="birth_year" 
                                            name="personal_information[birth_year]" required>
                                            <option value="" disabled>Year</option>
                                            @foreach($days as $day)
                                                <option value="{{$day->id}}" <?php if(!empty($personal_information->birth_year) && $personal_information->birth_year == $day->id): echo "selected";endif; ?> >{{$day->eng_title}}</option>
                                            @endforeach
                                        </select>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td>


                            <table class="table table-bordered">
                                <tr>
                                    <td>
                                        <select class="form-control" id="birth_year" 
                                            name="personal_information[birth_year]" required>
                                            <option value="" disabled>Year</option>
                                            @foreach($years as $year)
                                                <option value="{{$year->id}}" <?php if(!empty($personal_information->birth_year) && $personal_information->birth_year == $year->id): echo "selected";endif; ?> >{{$year->jp_year_value}}</option>
                                            @endforeach
                                        </select>
                                    </td>
                                    <td>
                                        <select class="form-control" id="birth_year" 
                                            name="personal_information[birth_year]" required>
                                            <option value="" disabled>Year</option>
                                            @foreach($months as $month)
                                                <option value="{{$month->id}}" <?php if(!empty($personal_information->birth_year) && $personal_information->birth_year == $month->id): echo "selected";endif; ?> >{{$month->jp_title}}</option>
                                            @endforeach
                                        </select>
                                    </td>
                                    <td>
                                        <select class="form-control" id="birth_year" 
                                            name="personal_information[birth_year]" required>
                                            <option value="" disabled>Year</option>
                                            @foreach($days as $day)
                                                <option value="{{$day->id}}" <?php if(!empty($personal_information->birth_year) && $personal_information->birth_year == $day->id): echo "selected";endif; ?> >{{$day->jp_title}}</option>
                                            @endforeach
                                        </select>
                                    </td>
                                </tr>
                            </table>

                           
                           
                        </td>
                    </tr>

                    <tr>
                        <td>Gender</td>
                        
                        <td> 
                            <select class="form-control">
                                <option value="" disabled>Select Gender</option>
                                @foreach($genders as $gender)
                                    <option value="{{$gender->id}}" <?php if(!empty($personal_information->gender_id) && $personal_information->gender_id == $gender->id): echo "selected";endif; ?>>{{$gender->gender}}</option>
                                @endforeach
                            </select>
                        </td>
                        <td>
                            <select class="form-control" id="gender_id" name="personal_information[gender_id]">
                                <option value="" disabled>Select Gender</option>
                                @foreach($genders as $gender)
                                    <option value="{{$gender->id}}" <?php if(!empty($personal_information->gender_id) && $personal_information->gender_id == $gender->id): echo "selected";endif; ?>>{{$gender->jp_gender}}</option>
                                @endforeach
                            </select>
                        </td>
                    </tr>

                    
                    
                    <tr>
                        <td> Email</td>
                        <td>{{$user->email}}</td>
                        <td><input type="text" name="personal_information[email]" value="{{(!empty($personal_information->email)) ?  $personal_information->email: ''}}" class="form-control"></td>
                    </tr>

                    <tr>
                        <td>Marital Status</td>
                        <td> 
                             <select class="form-control" >
                                <option value="" disabled>Select Marital Status</option>
                                @foreach($maritalStatus as $status)
                                    <option value="{{$status->id}}" <?php if(!empty($personal_information->marital_status_id) && $personal_information->marital_status_id == $status->id): echo "selected";endif; ?>>{{$status->marital_status}}</option>
                                @endforeach
                            </select>
                         </td>
                        <td>
                            <select class="form-control" id="marital_status_id" name="personal_information[marital_status_id]">
                                <option value="" disabled>Select Marital Status</option>
                                @foreach($maritalStatus as $status)
                                    <option value="{{$status->id}}" <?php if(!empty($personal_information->marital_status_id) && $personal_information->marital_status_id == $status->id): echo "selected";endif; ?>>{{$status->jp_marital_status}}</option>
                                @endforeach
                            </select>
                        </td>
                    </tr>

                    <tr>
                        <td colspan="3" style="background-color: #f1f1f1; color:red;text-align: center;">JAPAN ADDRESS(IF YOU ARE IN JAPAN)</td>
                    </tr>
                    <tr>
                        <td>Contry</td>
                        
                        <td>  {{$user->getCountry('country')}}</td>
                        <td>
                           <?php $country_id = old('country_id'); ?>
                            {!! Form::select('personal_information[country_id]', [''=>__('Select Country')]+$countries, $country_id, array('class'=>'form-control required', 'id'=>'country_id')) !!}
                            {!! APFrmErrHelp::showErrors($errors, 'country_id') !!}
                        </td>
                    </tr>
                    <tr>
                        <td>State</td>
                        
                        <td> {{$user->getState('state')}} </td>
                        <td>
                           {!! Form::select('personal_information[state_id]', [''=>__('Select State')], null, array('class'=>'form-control required', 'id'=>'state_id')) !!} </span> {!! APFrmErrHelp::showErrors($errors, 'state_id') !!}
                        </td>
                    </tr>
                    <tr>
                        <td>City</td>
                        
                        <td> {{$user->city_id}} </td>
                        <td>
                            {!! Form::select('personal_information[city_id]', [''=>__('Select City')], null, array('class'=>'form-control required', 'id'=>'city_id')) !!} </span> {!! APFrmErrHelp::showErrors($errors, 'city_id') !!}
                        </td>
                    </tr>

                    <tr>
                        <td> Street Address</td>
                        <td> {{$user->street_address}}</td>
                        <td><input type="text" name="personal_information[street_address]" value="{{(!empty($personal_information->street_address)) ?  $personal_information->street_address: ''}}" class="form-control"></td>
                    </tr>
                    <tr>
                        <td>JP Cell Phone</td>
                        <td> {{$user->jp_cell_phone}}</td>
                        <td><input type="text" name="personal_information[jp_cell_phone]" value="{{(!empty($personal_information->jp_cell_phone)) ?  $personal_information->jp_cell_phone: ''}}" class="form-control"></td>
                    </tr>
                    <tr>
                        <td>Emergency Contact Name In JP</td>
                        <td>{{$user->emergency_contact_jp}} </td>
                        <td><input type="text" name="personal_information[emergency_contact_jp]" value="{{(!empty($personal_information->emergency_contact_jp)) ?  $personal_information->emergency_contact_jp: ''}}" class="form-control">
                        </td>
                    </tr>

                    <tr>
                        <td>Current Visa Status</td>
                        
                        <td>

                        <select class="form-control">
                                <option value="" disabled>Select Current Visa Status</option>
                                @foreach($currentVisas as $visaStatus)
                                    <option value="{{$visaStatus->id}}" <?php if(!empty($personal_information->current_visa_status_id) && $personal_information->current_visa_status_id == $visaStatus->id): echo "selected";endif; ?>>{{$visaStatus->eng_title}}</option>
                                @endforeach
                            </select>

                        </td>
                        <td>
                            <select class="form-control" name="personal_information[current_visa_status_id]">
                                <option value="" disabled>Select Current Visa Status</option>
                                @foreach($currentVisas as $visaStatus)
                                    <option value="{{$visaStatus->id}}" <?php if(!empty($personal_information->current_visa_status_id) && $personal_information->current_visa_status_id == $visaStatus->id): echo "selected";endif; ?>>{{$visaStatus->jp_title}}</option>
                                @endforeach
                            </select>
                        </td>
                    </tr>


                    <tr>
                        <td>Emergency Cell Phone</td>
                        <td>{{$user->emergency_cell_phone}} </td>
                        <td><input type="text" name="personal_information[emergency_cell_phone]" value="{{(!empty($personal_information->emergency_cell_phone)) ?  $personal_information->emergency_cell_phone: ''}}" class="form-control">
                        </td>
                    </tr>

                    <tr>
                        <td>Visa Expiry Year</td>
                        
                        <td> 
                        <table class="table table-bordered">
                                <tr>
                                    <td>
                                        <select class="form-control" id="jp_visa_expiry_year" 
                                            name="personal_information[jp_visa_expiry_year]" required>
                                            <option value="" disabled>Year</option>
                                            @foreach($years as $year)
                                                <option value="{{$year->id}}" <?php if(!empty($personal_information->jp_visa_expiry_year) && $personal_information->jp_visa_expiry_year == $year->id): echo "selected";endif; ?> >{{$year->year_value}}</option>
                                            @endforeach
                                        </select>
                                    </td>
                                    <td>
                                        <select class="form-control" id="jp_visa_expiry_year" 
                                            name="personal_information[jp_visa_expiry_month]" required>
                                            <option value="" disabled>Month</option>
                                            @foreach($months as $month)
                                                <option value="{{$month->id}}" <?php if(!empty($personal_information->jp_visa_expiry_month) && $personal_information->jp_visa_expiry_month == $month->id): echo "selected";endif; ?> >{{$month->eng_title}}</option>
                                            @endforeach
                                        </select>
                                    </td>
                                    <td>
                                        <select class="form-control" id="jp_visa_expiry_year" 
                                            name="personal_information[jp_visa_expiry_day]" required>
                                            <option value="" disabled>Day</option>
                                            @foreach($days as $day)
                                                <option value="{{$day->id}}" <?php if(!empty($personal_information->jp_visa_expiry_day) && $personal_information->jp_visa_expiry_day == $day->id): echo "selected";endif; ?> >{{$day->eng_title}}</option>
                                            @endforeach
                                        </select>
                                    </td>
                                </tr>
                            </table>
                    
                       </td>
                        <td>
                        <table class="table table-bordered">
                                <tr>
                                    <td>
                                        <select class="form-control" id="jp_visa_expiry_year" 
                                            name="personal_information[jp_visa_expiry_year]" required>
                                            <option value="" disabled>Year</option>
                                            @foreach($years as $year)
                                                <option value="{{$year->id}}" <?php if(!empty($personal_information->jp_visa_expiry_year) && $personal_information->jp_visa_expiry_year == $year->id): echo "selected";endif; ?> >{{$year->jp_year_value}}</option>
                                            @endforeach
                                        </select>
                                    </td>
                                    <td>
                                        <select class="form-control" id="jp_visa_expiry_year" 
                                            name="personal_information[jp_visa_expiry_month]" required>
                                            <option value="" disabled>Month</option>
                                            @foreach($months as $month)
                                                <option value="{{$month->id}}" <?php if(!empty($personal_information->jp_visa_expiry_month) && $personal_information->jp_visa_expiry_month == $month->id): echo "selected";endif; ?> >{{$month->jp_title}}</option>
                                            @endforeach
                                        </select>
                                    </td>
                                    <td>
                                        <select class="form-control" id="jp_visa_expiry_year" 
                                            name="personal_information[jp_visa_expiry_day]" required>
                                            <option value="" disabled>Day</option>
                                            @foreach($days as $day)
                                                <option value="{{$day->id}}" <?php if(!empty($personal_information->jp_visa_expiry_day) && $personal_information->jp_visa_expiry_day == $day->id): echo "selected";endif; ?> >{{$day->jp_title}}</option>
                                            @endforeach
                                        </select>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" style="background-color: #f1f1f1; color:red;text-align: center;">YOUR COUNTRY ADDRESS</td>
                    </tr>
                    <tr>
                        <td>Contry</td>
                        
                        <td>{{$user->getCountryIdBd('country')}} </td> 
                        <td>
                           <?php //$country_id_bd = old('country_id_bd', (isset($user) && (int)$user->country_id_bd > 0) ? $personal_information->country_id_bd : $siteSetting->default_country_id); ?>
                           <?php $country_id_bd = old('country_id_bd'); ?>
                            {!! Form::select('personal_information[country_id_bd]', [''=>__('Select Country')]+$countries, $country_id_bd, array('class'=>'form-control required', 'id'=>'country_id_bd')) !!}
                            {!! APFrmErrHelp::showErrors($errors, 'country_id_bd') !!}
                        </td>
                    </tr>
                    <tr>
                        <td>State</td>
                        
                        <td> {{$user->state_id_bd}} </td>
                        <td>
                           {!! Form::select('personal_information[state_id_bd]', [''=>__('Select State')], null, array('class'=>'form-control required', 'id'=>'state_id_bd')) !!} </span> {!! APFrmErrHelp::showErrors($errors, 'state_id_bd') !!}
                        </td>
                    </tr>
                    <tr>
                        <td>City</td>
                        
                        <td> {{$user->city_id_bd}} </td>
                        <td>
                            {!! Form::select('personal_information[city_id_bd]', [''=>__('Select City')], null, array('class'=>'form-control required', 'id'=>'city_id_bd')) !!} </span> {!! APFrmErrHelp::showErrors($errors, 'city_id_bd') !!}
                        </td>
                    </tr>

                    
                    <tr>
                        <td>Postal Code</td>
                        <td>{{$user->bd_postal_code}}</td>
                        <td><input type="text" name="personal_information[bd_postal_code]" value="{{(!empty($personal_information->bd_postal_code)) ?  $personal_information->bd_postal_code: ''}}" class="form-control "></td>
                    </tr>
                    <tr>
                        <td>Address</td>
                        <td>{{$user->bd_address}}</td>
                        <td><input type="text" name="personal_information[bd_address]" value="{{(!empty($personal_information->bd_address)) ?  $personal_information->bd_address: ''}}" class="form-control "></td>
                    </tr>
                    <tr>
                        <td>Country Cell Phone</td>
                        <td>{{$user->bd_cell_phone}}</td>
                        <td><input type="text" name="personal_information[bd_cell_phone]" value="{{(!empty($personal_information->bd_cell_phone)) ?  $personal_information->bd_cell_phone: ''}}" class="form-control "></td>
                    </tr>
                    <tr>
                        <td>Children</td>
                        <td>{{$user->bd_children}}</td>
                        <td><input type="number" name="personal_information[bd_children]" value="{{(!empty($personal_information->bd_children)) ?  $personal_information->bd_children: ''}}" class="form-control "></td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <button type="submit" class="btn btn-large btn-primary">Update Personal Information <i   class="fa fa-arrow-circle-right"   aria-hidden="true"></i></button>
    </div>
</form>

@push('css')
    <style type="text/css">
        .datepicker > div {
            display: block;
        }
    </style>
@endpush
@push('scripts')
    <script type="text/javascript">
        $(document).ready(function () {
            initdatepicker();

        });

        function initdatepicker() {
            $(".datepicker").datepicker({
                autoclose: true,
                format: 'yyyy-m-d'
            });
        }
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
                         
                        $('#state_id_bd').html(response);
                        
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
                         console.log(response);
                        $('#state_id').html(response);
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
                       
                        $('#city_id').html(response);
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
                       // console.log("get respon form output", response);
                        $('#city_id_bd').html(response);
                    });
            }
        }

// bd script end 
    </script>
@endpush