{!! APFrmErrHelp::showErrorsNotice($errors) !!}
@include('flash::message')

@php
    $years = DB::table('years')->get();
    $months = DB::table('months')->get();
    $days = DB::table('days')->get();
    $languages = DB::table('languages')->get();
    $languagesInfos= DB::table('profile_languages')->where("user_id",$user->id)->get();
    if(!empty($languageConvert)):
        $eduInfo = json_decode($languageConvert->education_history);
    endif;



@endphp

<form action="{{route('user.engToJapUpdate',$user->id)}}" method="post" enctype="multipart/form-data">
    @csrf
    <input type="hidden" name="update_form_name" value="language"/>
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

                    @foreach($languagesInfos as $languageInfo)

                            @php 
                                $languageTypes = DB::table('language_types')->where("lang_id",$languageInfo->language_id)->get();
                                $languageLevels = DB::table('language_levels')->where("language_type_id",$languageInfo->language_type_id)->get();
                            @endphp



                            <tr>
                                <td colspan="3" style="background-color: #f1f1f1; color:red;text-align: center;"> language title </td>
                            </tr>
                            <tr>
                                <td>Language Title</td>
                                <td> 
                                         <select class="form-control"   required>
                                                        <option value="" disabled>Language</option>
                                                        @foreach($languages as $language)
                                                            <option value="{{$language->id}}" <?php if(!empty($languageInfo->language_id) && $languageInfo->language_id == $language->id): echo "selected";endif; ?> >{{$language->lang}}</option>
                                                        @endforeach
                                        </select>
                                </td>
                                <td>

                                <select class="form-control" name="language_certification[<?php echo $language->id;?>][language_id]"   required>
                                                        <option value="" disabled>Language</option>
                                                        @foreach($languages as $language)
                                                            <option value="{{$language->id}}" <?php if(!empty($languageInfo->language_id) && $languageInfo->language_id == $language->id): echo "selected";endif; ?> >{{$language->native}}</option>
                                                        @endforeach
                                </select>


                                </td>
                            </tr>
                          
                            <tr>
                                <td>Language Type</td>
                                
                                <td> 
                                         <select class="form-control"   required>
                                                        <option value="" disabled>Language Type</option>
                                                        @foreach($languageTypes as $languageType)
                                                            <option value="{{$languageType->id}}" <?php if(!empty($languageInfo->language_type_id) && $languageInfo->language_type_id == $languageType->id): echo "selected";endif; ?>> {{$languageType->eng_title}} </option>
                                                        @endforeach
                                        </select>
                                </td>
                                <td>

                                <select class="form-control"  name="language_certification[<?php echo $language->id;?>][language_type_id]" required>
                                                        <option value="" disabled>Language Type</option>
                                                        @foreach($languageTypes as $languageType)
                                                            <option value="{{$languageType->id}}" <?php if(!empty($languageInfo->language_type_id) && $languageInfo->language_type_id == $languageType->id): echo "selected";endif; ?> >{{$languageType->jp_title}}</option>
                                                        @endforeach
                                        </select>


                                </td>


                            </tr>
                          
                            <tr>
                                <td>Language Levels</td>
                                
                                <td> 
                                         <select class="form-control"  required>
                                                        <option value="" disabled>Language Levels</option>
                                                         
                                                        @foreach($languageLevels as $languageLevel)
                                                            <option value="{{$languageLevel->id}}" <?php if(!empty($languageInfo->language_level_id) && $languageInfo->language_level_id == $languageLevel->id): echo "selected";endif; ?> >{{$languageLevel->language_level}}</option>
                                                        @endforeach
                                        </select>
                                </td>

                                <td>

                                <select class="form-control"   name="language_certification[<?php echo $language->id;?>][language_level_id]" required>
                                                        <option value="" disabled>Language Levels</option>
                                                        @foreach($languageLevels as $languageLevel)
                                                            <option value="{{$languageLevel->id}}" <?php if(!empty($languageInfo->language_level_id) && $languageInfo->language_level_id == $languageLevel->id): echo "selected";endif; ?> >{{$languageLevel->language_level}}</option>
                                                        @endforeach
                                </select>
                                </td>


                            </tr>



                            <tr>
                                    <td>Entrance Year and Month</td>
                                    <td>
                                    <table class="table table-bordered">
                                            <tr>
                                                <td>
                                                    <select class="form-control"  required>
                                                        <option value="" disabled>Year</option>
                                                        @foreach($years as $year)
                                                            <option value="{{$year->id}}" <?php if(!empty($languageInfo->entrance_year) && $languageInfo->entrance_year == $year->id): echo "selected";endif; ?> >{{$year->year_value}}</option>
                                                        @endforeach
                                                    </select>
                                                </td>
                                                <td>
                                                    <select class="form-control"   required>
                                                        <option value="" disabled>Month</option>
                                                        @foreach($months as $month)
                                                            <option value="{{$month->id}}" <?php if(!empty($languageInfo->entrance_month) && $languageInfo->entrance_month == $month->id): echo "selected";endif; ?> >{{$month->eng_title}}</option>
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
                                                    <select class="form-control" name="language_certification[<?php echo $language->id;?>][entrance_year]" required>
                                                        <option value="" disabled>Year</option>
                                                        @foreach($years as $year)
                                                            <option value="{{$year->id}}" <?php if(!empty($languageInfo->entrance_year) && $languageInfo->entrance_year == $year->id): echo "selected";endif; ?> >{{$year->jp_year_value}}</option>
                                                        @endforeach
                                                    </select>
                                                </td>
                                                <td>
                                                    <select class="form-control" name="language_certification[<?php echo $language->id;?>][entrance_month]" required>
                                                        <option value="" disabled>Year</option>
                                                        @foreach($months as $month)
                                                            <option value="{{$month->id}}" <?php if(!empty($languageInfo->entrance_month) && $languageInfo->entrance_month == $month->id): echo "selected";endif; ?> >{{$month->jp_title}}</option>
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
                                                    <select class="form-control"   required>
                                                        <option value="" disabled>Year</option>
                                                        @foreach($years as $year)
                                                            <option value="{{$year->id}}" <?php if(!empty($languageInfo->pass_year) && $languageInfo->pass_year == $year->id): echo "selected";endif; ?> >{{$year->year_value}}</option>
                                                        @endforeach
                                                    </select>
                                                </td>
                                                <td>
                                                    <select class="form-control"   required>
                                                        <option value="" disabled>Year</option>
                                                        @foreach($months as $month)
                                                            <option value="{{$month->id}}" <?php if(!empty($languageInfo->pass_month) && $languageInfo->pass_month == $month->id): echo "selected";endif; ?> >{{$month->eng_title}}</option>
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
                                                    <select class="form-control"  name="language_certification[<?php echo $language->id;?>][pass_year]"  required>
                                                        <option value="" disabled>Year</option>
                                                        @foreach($years as $year)
                                                            <option value="{{$year->id}}" <?php if(!empty($languageInfo->pass_year) && $languageInfo->pass_year == $year->id): echo "selected";endif; ?> >{{$year->jp_year_value}}</option>
                                                        @endforeach
                                                    </select>
                                                </td>
                                                <td>
                                                    <select class="form-control" name="language_certification[<?php echo $language->id;?>][pass_month]" required>
                                                        <option value="" disabled>Year</option>
                                                        @foreach($months as $month)
                                                            <option value="{{$month->id}}" <?php if(!empty($languageInfo->pass_month) && $languageInfo->pass_month == $month->id): echo "selected";endif; ?> >{{$month->jp_title}}</option>
                                                        @endforeach
                                                    </select>
                                                </td>
                                            
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                 @endforeach
                    </tbody>
                </table>
            </div>
        </div>
        <button type="submit" class="btn btn-large btn-primary">Update Language Information <i   class="fa fa-arrow-circle-right"   aria-hidden="true"></i></button>
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
    function showProfileLanguageModal(){
    $("#add_language_modal").modal();
    loadProfileLanguageForm();
    }
    function loadProfileLanguageForm(){
    $.ajax({
    type: "POST",
            url: "{{ route('get.profile.language.form', $user->id) }}",
            data: {"_token": "{{ csrf_token() }}"},
            datatype: 'json',
            success: function (json) {
            $("#add_language_modal").html(json.html);
            }
    });
    }
    function showProfileLanguageEditModal(profile_language_id){
    $("#add_language_modal").modal();
    loadProfileLanguageEditForm(profile_language_id);
    }
    function loadProfileLanguageEditForm(profile_language_id){
    $.ajax({
    type: "POST",
            url: "{{ route('get.profile.language.edit.form', $user->id) }}",
            data: {"profile_language_id": profile_language_id, "_token": "{{ csrf_token() }}"},
            datatype: 'json',
            success: function (json) {
            $("#add_language_modal").html(json.html);
            }
    });
    }
    function submitProfileLanguageForm() {
    var form = $('#add_edit_profile_language');
    $.ajax({
    url     : form.attr('action'),
            type    : form.attr('method'),
            data    : form.serialize(),
            dataType: 'json',
            success : function (json){
            $ ("#add_language_modal").html(json.html);
            showLanguages();
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
    function delete_profile_language(id) {
    if (confirm('Are you sure! you want to delete?')) {
    $.post("{{ route('delete.profile.language') }}", {id: id, _method: 'DELETE', _token: '{{ csrf_token() }}'})
            .done(function (response) {
            if (response == 'ok')
            {
            $('#language_' + id).remove();
            } else
            {
            alert('Request Failed!');
            }
            });
    }
    }
    $(document).ready(function(){
    showLanguages();
    });
    function showLanguages()
    {
    $.post("{{ route('show.profile.languages', $user->id) }}", {user_id: {{$user->id}}, _method: 'POST', _token: '{{ csrf_token() }}'})
            .done(function (response) {
            $('#language_div').html(response);
            });
    }
</script> 
@endpush