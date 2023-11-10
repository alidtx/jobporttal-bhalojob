{!! APFrmErrHelp::showErrorsNotice($errors) !!}
@include('flash::message')
@php
    $years = DB::table('years')->get();
    $months = DB::table('months')->get();
    $days = DB::table('days')->get();
    $experiences = DB::table('profile_experiences')->where("user_id",$user->id)->get();
    
    if(!empty($languageConvert)):
        $experienceInfos = json_decode($languageConvert->working_experience);
    endif;
@endphp

<form action="{{route('user.engToJapUpdate',$user->id)}}" method="post" enctype="multipart/form-data">
    @csrf
    <input type="hidden" name="update_form_name" value="working"/>
    <div class="form-body">
        <input type="hidden" name="front_or_admin" value="admin"/>
        <div class="row">
            <div class="col-md-12">
                <table class="table table-bordered">
                    <thead>
                    <tr>
                        <th style="width;33%!important"> LABEL</th>
                        <th style="width;33%!important"> ENGLISH</th>
                        <th style="width;34%!important"> JAPANESE</th>
                    </tr>
                    </thead>
                    <tbody>

                    @foreach($experiences as $experience)
                        @php
                            $slug = $experience->slug;
                            $workExpe =  $experienceInfos->$slug ?? '';
                        @endphp

                            <tr>
                                <td colspan="3" style="background-color: #f1f1f1; color:red;text-align: center;">  @php echo $experience->title @endphp at   @php echo $experience->company @endphp</td>
                            </tr>
                            <tr>
                                <td>Experience Title</td>
                                <td> 
                                @php echo $experience->title @endphp
                                </td>
                                <td><input type="text" name="working_experience[<?php echo $experience->slug?>][title]" value="<?php if(!empty($workExpe->title)): echo $workExpe->title;endif;?>" class="form-control">
                            </tr>
                          
                            <tr>
                                <td>Company</td>
                                <td> 
                                @php echo $experience->company @endphp
                                </td>
                                <td><input type="text"  name="working_experience[<?php echo $experience->slug?>][company]" value="<?php if(!empty($workExpe->title)): echo $workExpe->company;endif;?>" class="form-control">
                            </tr>
                          
                            <tr>
                                <td>Country</td>
                                <td> 
                                @php echo $experience->title @endphp
                                </td>
                                <td><input type="text"  name="working_experience[<?php echo $experience->slug?>][country_id]" value="<?php if(!empty($workExpe->title)): echo $workExpe->country_id;endif;?>" class="form-control">
                            </tr>
                            <tr>
                                    <td>Entrance Year and Month</td>
                                    <td>
                                    <table class="table table-bordered">
                                            <tr>
                                                <td>
                                                    <select class="form-control"   required>
                                                        <option value="" disabled>Year</option>
                                                        @foreach($years as $year)
                                                            <option value="{{$year->id}}" <?php if(!empty($experience->entrance_year) && $experience->entrance_year == $year->id): echo "selected";endif; ?> >{{$year->year_value}}</option>
                                                        @endforeach
                                                    </select>
                                                </td>
                                                <td>
                                                    <select class="form-control"  required>
                                                        <option value="" disabled>Month</option>
                                                        @foreach($months as $month)
                                                            <option value="{{$month->id}}" <?php if(!empty($experience->entrance_month) && $experience->entrance_month == $month->id): echo "selected";endif; ?> >{{$month->eng_title}}</option>
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
                                                    <select class="form-control"  name="working_experience[<?php echo $experience->slug?>][entrance_year]" required>
                                                        <option value="" disabled>Year</option>
                                                        @foreach($years as $year)
                                                            <option value="{{$year->id}}" <?php if(!empty($workExpe->entrance_year) && $workExpe->entrance_year == $year->id): echo "selected";endif; ?> >{{$year->jp_year_value}}</option>
                                                        @endforeach
                                                    </select>
                                                </td>
                                                <td>
                                                    <select class="form-control"   name="working_experience[<?php echo $experience->slug?>][entrance_month]" required>
                                                        <option value="" disabled>Month</option>
                                                        @foreach($months as $month)
                                                            <option value="{{$month->id}}" <?php if(!empty($workExpe->entrance_month) && $workExpe->entrance_month == $month->id): echo "selected";endif; ?> >{{$month->jp_title}}</option>
                                                        @endforeach
                                                    </select>
                                                </td>
                                            
                                            </tr>
                                        </table>
                                    </td>
                                  </tr>

                                    <tr>
                                    <td>Pass Year and Month</td>
                                    <td>

                                    <table class="table table-bordered">
                                            <tr>
                                                <td>
                                                    <select class="form-control"  required>
                                                        <option value="" disabled>Year</option>
                                                        @foreach($years as $year)
                                                            <option value="{{$year->id}}" <?php if(!empty($experience->entrance_year) && $experience->entrance_year == $year->id): echo "selected";endif; ?> >{{$year->year_value}}</option>
                                                        @endforeach
                                                    </select>
                                                </td>
                                                <td>
                                                    <select class="form-control"  required>
                                                        <option value="" disabled>Month</option>
                                                        @foreach($months as $month)
                                                            <option value="{{$month->id}}" <?php if(!empty($experience->entrance_month) && $experience->entrance_month == $month->id): echo "selected";endif; ?> >{{$month->eng_title}}</option>
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
                                                    <select class="form-control"  name="working_experience[<?php echo $experience->slug?>][pass_year]" required>
                                                        <option value="" disabled>Year</option>
                                                        @foreach($years as $year)
                                                            <option value="{{$year->id}}" <?php if(!empty($workExpe->pass_year) && $workExpe->pass_year == $year->id): echo "selected";endif; ?> >{{$year->jp_year_value}}</option>
                                                        @endforeach
                                                    </select>
                                                </td>
                                                <td>
                                                    <select class="form-control"  name="working_experience[<?php echo $experience->slug?>][pass_month]" required>
                                                        <option value="" disabled>Month</option>
                                                        @foreach($months as $month)
                                                            <option value="{{$month->id}}" <?php if(!empty($workExpe->pass_month) && $workExpe->pass_month == $month->id): echo "selected";endif; ?> >{{$month->jp_title}}</option>
                                                        @endforeach
                                                    </select>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                            </tr>
                            <tr>
                                <td style="width:33%!important">Job Description</td>
                                <td style="width:33%!important"> 
                                @php echo $experience->description @endphp
                                </td>
                                <td style="width:33%!important"><input type="text"  name="working_experience[<?php echo $experience->slug?>][description]" value="<?php if(!empty($workExpe->title)): echo $workExpe->description;endif;?>" class="form-control">
                            </tr>

                     @endforeach
                    </tbody>
                </table>
            </div>
        </div>
        <button type="submit" class="btn btn-large btn-primary">Update Working Information <i   class="fa fa-arrow-circle-right"   aria-hidden="true"></i></button>
    </div>
</form>
@push('css')
<style type="text/css">
    .datepicker>div {
        display: block;
    }
</style>
@endpush
@push('scripts') 
<script type="text/javascript">
    /**************************************************/
    function showProfileExperienceModal(){
    $("#add_experience_modal").modal();
    loadProfileExperienceForm();
    }
    function loadProfileExperienceForm(){
    $.ajax({
    type: "POST",
            url: "{{ route('get.profile.experience.form', $user->id) }}",
            data: {"_token": "{{ csrf_token() }}"},
            datatype: 'json',
            success: function (json) {
            $("#add_experience_modal").html(json.html);
            initdatepicker();
            }
    });
    }
    function showProfileExperienceEditModal(profile_experience_id, state_id, city_id){
    $("#add_experience_modal").modal();
    loadProfileExperienceEditForm(profile_experience_id, state_id, city_id);
    }
    function loadProfileExperienceEditForm(profile_experience_id, state_id, city_id){
    $.ajax({
    type: "POST",
            url: "{{ route('get.profile.experience.edit.form', $user->id) }}",
            data: {"profile_experience_id": profile_experience_id, "_token": "{{ csrf_token() }}"},
            datatype: 'json',
            success: function (json) {
            $("#add_experience_modal").html(json.html);
            initdatepicker();
            filterDefaultStatesExperience(state_id, city_id);
            }
    });
    }
    function submitProfileExperienceForm() {
    var form = $('#add_edit_profile_experience');
    $.ajax({
    url     : form.attr('action'),
            type    : form.attr('method'),
            data    : form.serialize(),
            dataType: 'json',
            success : function (json){
            $ ("#add_experience_modal").html(json.html);
            showExperience();
            },
            error: function(json){
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
    function delete_profile_experience(id) {
    if (confirm('Are you sure! you want to delete?')) {
    $.post("{{ route('delete.profile.experience') }}", {id: id, _method: 'DELETE', _token: '{{ csrf_token() }}'})
            .done(function (response) {
            if (response == 'ok')
            {
            $('#experience_' + id).remove();
            } else
            {
            alert('Request Failed!');
            }
            });
    }
    }
    function initdatepicker(){
    $(".datepicker").datepicker({
    autoclose: true,
            format:'yyyy-m-d'
    });
    }
    $(document).ready(function(){
    showExperience();
    initdatepicker();
    $(document).on('change', '#experience_country_id', function (e) {
    e.preventDefault();
    filterDefaultStatesExperience(0, 0);
    });
    $(document).on('change', '#experience_state_id', function (e) {
    e.preventDefault();
    filterDefaultCitiesExperience(0);
    });
    });
    function showExperience()
    {
    $.post("{{ route('show.profile.experience', $user->id) }}", {user_id: {{$user->id}}, _method: 'POST', _token: '{{ csrf_token() }}'})
            .done(function (response) {
            $('#experience_div').html(response);
            });
    }





    function filterDefaultStatesExperience(state_id, city_id)
    {
    var country_id = $('#experience_country_id').val();
    if (country_id != ''){
    $.post("{{ route('filter.default.states.dropdown') }}", {country_id: country_id, state_id: state_id, new_state_id: 'experience_state_id', _method: 'POST', _token: '{{ csrf_token() }}'})
            .done(function (response) {
            $('#default_state_experience_dd').html(response);
            filterDefaultCitiesExperience(city_id);
            });
    }
    }
    function filterDefaultCitiesExperience(city_id)
    {
    var state_id = $('#experience_state_id').val();
    if (state_id != ''){
    $.post("{{ route('filter.default.cities.dropdown') }}", {state_id: state_id, city_id: city_id, _method: 'POST', _token: '{{ csrf_token() }}'})
            .done(function (response) {
            $('#default_city_experience_dd').html(response);
            });
    }
    }
</script> 
@endpush