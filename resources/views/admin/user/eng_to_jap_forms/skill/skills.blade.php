{!! APFrmErrHelp::showErrorsNotice($errors) !!}
@include('flash::message')



@php
    $years = DB::table('years')->get();
    $months = DB::table('months')->get();
    $days = DB::table('days')->get();
    $languages = DB::table('languages')->get();
    $certificateInfos = DB::table('profile_skills')->where("user_id",$user->id)->get();
    
    if(!empty($languageConvert)):
        $certiInfo = json_decode($languageConvert->other_certification);
    endif;

   // dd($user);
@endphp

<form action="{{route('user.engToJapUpdate',$user->id)}}" method="post" enctype="multipart/form-data">
    @csrf
    <input type="hidden" name="update_form_name" value="others"/>
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

                    @foreach($certificateInfos as $key =>  $certificate)

                    @php

                        $slug = $certificate->slug;
                        if(!empty($certiInfo)):
                          $cerinfos =  $certiInfo->$slug;
                          endif;


                   // dd($cerinfos);

                    @endphp

                            <tr>
                                <td colspan="3" style="background-color: #f1f1f1; color:red;text-align: center;"> Certificate No: @php echo $key+1; @endphp </td>
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
                                                            <option value="{{$year->id}}" <?php if(!empty($certificate->entrance_year) && $certificate->entrance_year == $year->id): echo "selected";endif; ?> >{{$year->year_value}}</option>
                                                        @endforeach
                                                    </select>
                                                </td>
                                                <td>
                                                    <select class="form-control select2"  required>
                                                        <option value="" disabled>Year</option>
                                                        @foreach($months as $month)
                                                            <option value="{{$month->id}}" <?php if(!empty($certificate->entrance_month) && $certificate->entrance_month == $month->id): echo "selected";endif; ?> >{{$month->eng_title}}</option>
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
                                                    <select class="form-control"  name="other_certification[<?php echo $certificate->slug;?>][pass_year]"  required>
                                                        <option value="" disabled>Year</option>
                                                        @foreach($years as $year)
                                                            <option value="{{$year->id}}" <?php if(!empty($certificate->entrance_year) && $certificate->entrance_year == $year->id): echo "selected";endif; ?> >{{$year->jp_year_value}}</option>
                                                        @endforeach
                                                    </select>
                                                </td>
                                                <td>
                                                    <select class="form-control"  name="other_certification[<?php echo $certificate->slug;?>][pass_month]" required>
                                                        <option value="" disabled>Month</option>
                                                        @foreach($months as $month)
                                                            <option value="{{$month->id}}" <?php if(!empty($certificate->entrance_month) && $certificate->entrance_month == $month->id): echo "selected";endif; ?> >{{$month->jp_title}}</option>
                                                        @endforeach
                                                    </select>
                                                </td>
                                            
                                            </tr>
                                        </table>
                                    </td>
                            </tr>
                            <tr>
                                <td>Certificate Title</td>
                                
                                <td> {{$certificate->certificate_title}} </td>
                            
                                <td><input type="text" name="other_certification[<?php echo $certificate->slug;?>][certificate_title]" value="{{(!empty($cerinfos->certificate_title)) ?  $cerinfos->certificate_title: ''}}" class="form-control"></td>
                            
                            </tr>
                 @endforeach
                
                    </tbody>
                </table>
            </div>
        </div>
        <button type="submit" class="btn btn-large btn-primary">Update Others Certificate Information <i   class="fa fa-arrow-circle-right"   aria-hidden="true"></i></button>
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
    function showProfileSkillModal(){
    $("#add_skill_modal").modal();
    loadProfileSkillForm();
    }
    function loadProfileSkillForm(){
    $.ajax({
    type: "POST",
            url: "{{ route('get.profile.skill.form', $user->id) }}",
            data: {"_token": "{{ csrf_token() }}"},
            datatype: 'json',
            success: function (json) {
            $("#add_skill_modal").html(json.html);
            }
    });
    }
    function showProfileSkillEditModal(skill_id){
    $("#add_skill_modal").modal();
    loadProfileSkillEditForm(skill_id);
    }
    function loadProfileSkillEditForm(skill_id){
    $.ajax({
    type: "POST",
            url: "{{ route('get.profile.skill.edit.form', $user->id) }}",
            data: {"skill_id": skill_id, "_token": "{{ csrf_token() }}"},
            datatype: 'json',
            success: function (json) {
            $("#add_skill_modal").html(json.html);
            }
    });
    }
    function submitProfileSkillForm() {
    var form = $('#add_edit_profile_skill');
    //alert(form)
    $.ajax({
    url     : form.attr('action'),
            type    : form.attr('method'),
            data    : form.serialize(),
            dataType: 'json',
            success : function (json){
            $ ("#add_skill_modal").html(json.html);
            showSkills();
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
    function delete_profile_skill(id) {
    if (confirm('Are you sure! you want to delete?')) {
    $.post("{{ route('delete.profile.skill') }}", {id: id, _method: 'DELETE', _token: '{{ csrf_token() }}'})
            .done(function (response) {
            if (response == 'ok')
            {
            $('#skill_' + id).remove();
            } else
            {
            alert('Request Failed!');
            }
            });
    }
    }
    $(document).ready(function(){
    showSkills();
    });
    function showSkills()
    {
    $.post("{{ route('show.profile.skills', $user->id) }}", {user_id: {{$user->id}}, _method: 'POST', _token: '{{ csrf_token() }}'})
            .done(function (response) {
            $('#skill_div').html(response);
            });
    }
</script> 
@endpush