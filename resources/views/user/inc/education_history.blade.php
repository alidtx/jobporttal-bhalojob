

<form class=" add_edit_profile_education_default_1 row" method="POST"   action="{{ route('store.front.profile.education.default', [$user->id]) }}">

    @csrf
    <div class="col-md-12">
            <div class="form-title">
                <h4 class="heading"> SECONDARY (SSC)/MIDDLE SCHOOL/O-LEVEL</h4>
            </div>
        </div>

        @php
            $years = DB::table('years')->get();
            $months = DB::table('months')->get();
            $sscInformation = get_default_profile_education(1);
            $hscInformation = get_default_profile_education(2);
            $universityInformation = get_default_profile_education(3);
        @endphp

        <input type="hidden" name="education_type" value="1">
        <input type="hidden" name="id" value="{{isset($sscInformation->id)? $sscInformation->id :''}}">


        <div class="form-group col-md-6">
            <div class="row">
                <div class="form-group col-md-6">
                    <label for="">ENTRANCE YEAR </label>
                    <select class="form-control" id="birth_year" onchange="showPageEducation('#month_div_show_edu')"
                            name="entrance_year">
                        <option > Select Year</option>
                        @foreach($years as $year)
                            <option value="{{$year->id}}" {{isset($sscInformation->entrance_year) && $year->id == $sscInformation->entrance_year ? "selected" :''}}>{{$year->year_value}}</option>
                        @endforeach
                    </select>
                </div>
                <div class="form-group col-md-6" id="month_div_show_edu" style="display: <?php if(empty($sscInformation->entrance_month)): echo "none"; endif; ?>">
                        <label for="">ENTRANCE MONTH </label>
                        <select class="form-control" onchange="showPageEducation('#day_div_show')" name="entrance_month">
                            @foreach($months as $month)
                                <option value="{{$month->id}}" {{isset($sscInformation->entrance_month) && $month->id == $sscInformation->entrance_month ? "selected" :''}}>{{$month->eng_title}}</option>
                            @endforeach
                        </select>
                </div>
            </div>
        </div>


        <div class="form-group col-md-6">
            <div class="row">
                <div class="form-group col-md-6">
                    <label for="">PASS YEAR</label>
                    <select class="form-control" id="birth_year" onchange="showPageEducation('#month_div_show_pass')"
                            name="pass_year">
                        <option  >Select Year</option>
                        @foreach($years as $year)
                            <option value="{{$year->id}}" {{isset($sscInformation->pass_year) && $year->id == $sscInformation->pass_year ? "selected" :''}} >{{$year->year_value}}</option>
                        @endforeach
                    </select>
                </div>
                <div class="form-group col-md-6" id="month_div_show_pass" style="display: <?php if(empty($sscInformation->pass_month)): echo "none"; endif; ?>">
                    <label for="">PASS Month</label>
                    <select class="form-control" onchange="showPageEducation('#day_div_show')" name="pass_month">
                        @foreach($months as $month)
                            <option value="{{$month->id}}" {{isset($sscInformation->pass_month) && $month->id == $sscInformation->pass_month ? "selected" :''}} >{{$month->eng_title}}</option>
                        @endforeach
                    </select>
                </div>
            </div>
        </div>
                
               
        <div class="form-group col-md-12">
            <label for="">INSTITUTION NAME</label>
            <input class="form-control" type="text" name="institution_name" value="{{isset($sscInformation->institution_name) ? $sscInformation->institution_name :''}}">
        </div>

        <div class="col-md-12 form-group mt-4">
        <button type="button" class="btn btn-large btn-primary"     onClick="submitDefaultProfileEducationForm(1);">{{__('Update secondary Info')}} <i   class="fa fa-arrow-circle-right" aria-hidden="true"></i></button>
        </div>
        
</form>


<form class=" add_edit_profile_education_default_2 row" method="POST"    action="{{ route('store.front.profile.education.default', [$user->id]) }}">

    @csrf

    <div class="col-md-12">
        <div class="form-title">
            <h4 class="heading">HIGH SCHOOL/COLLEGE/DEPLOMA</h4>
        </div>
    </div>
    <input type="hidden" name="education_type" value="2">
    <input type="hidden" name="id" value="{{isset($hscInformation->id)? $hscInformation->id :''}}">


    <div class="form-group col-md-6">
        <div class="row">

            <div class="form-group col-md-6">
                <label for="">ENTRANCE YEAR </label>
                <select class="form-control" id="birth_year" onchange="showPageEducation('#month_div_show_edu_hsc')"
                        name="entrance_year">
                    <option > Select Year</option>
                    @foreach($years as $year)
                        <option value="{{$year->id}}" {{isset($hscInformation->entrance_year) && $year->id == $hscInformation->entrance_year ? "selected" :''}}>{{$year->year_value}}</option>
                    @endforeach
                </select>
           </div>
            <div class="form-group col-md-6" id="month_div_show_edu_hsc" style="display: <?php if(empty($hscInformation->entrance_month)): echo "none"; endif; ?>">
                <label for="">ENTRANCE MONTH </label>
                <select class="form-control" onchange="showPageEducation('#day_div_show')" name="entrance_month">
                    @foreach($months as $month)
                        <option value="{{$month->id}}" {{isset($hscInformation->entrance_month) && $month->id == $hscInformation->entrance_month ? "selected" :''}}>{{$month->eng_title}}</option>
                    @endforeach
                </select>
            </div>
        </div>
    </div>


    <div class="form-group col-md-6">
        <div class="row">
            <div class="form-group col-md-6">
                <label for="">PASS YEAR</label>
                <select class="form-control" id="birth_year" onchange="showPageEducation('#month_div_show_pass_hsc')"
                        name="pass_year">
                    <option  >Select Year</option>
                    @foreach($years as $year)
                        <option value="{{$year->id}}" {{isset($hscInformation->pass_year) && $year->id == $hscInformation->pass_year ? "selected" :''}} >{{$year->year_value}}</option>
                    @endforeach
                </select>
            </div>
            <div class="form-group col-md-6" id="month_div_show_pass_hsc" style="display:  <?php if(empty($hscInformation->pass_month)): echo "none"; endif; ?>">
                <label for="">PASS Month</label>
                <select class="form-control" onchange="showPageEducation('#day_div_show')" name="pass_month">
                    @foreach($months as $month)
                        <option value="{{$month->id}}" {{isset($hscInformation->pass_month) && $month->id == $hscInformation->pass_month ? "selected" :''}} >{{$month->eng_title}}</option>
                    @endforeach
                </select>
            </div>
        </div>
    </div>

            <div class="form-group col-md-12">
                <label for="">INSTITUTION NAME</label>
                <input class="form-control" type="text" name="institution_name" value="{{isset($hscInformation->institution_name) ? $hscInformation->institution_name :''}}">
          </div>

        <div class="col-md-12 form-group mt-4">
            <button type="button" class="btn btn-large btn-primary" onClick="submitDefaultProfileEducationForm(2);">{{__('Update High School Info')}} <i   class="fa fa-arrow-circle-right" aria-hidden="true"></i></button>
        </div>

</form>


<form class=" add_edit_profile_education_default_3 row" method="POST"  action="{{ route('store.front.profile.education.default', [$user->id]) }}">

    @csrf

    <div class="col-md-12">

<div class="form-title">
    <h4 class="heading">UNIVERSITY</h4>
</div>
</div>


<input type="hidden" name="education_type" value="3">
<input type="hidden" name="id" value="{{isset($universityInformation->id)? $universityInformation->id :''}}">


    <div class="form-group col-md-6">
        <div class="row">
        <div class="form-group col-md-6">
                <label for="">ENTRANCE YEAR </label>
                <select class="form-control" id="birth_year" onchange="showPageEducation('#month_div_show_edu_vs')"
                        name="entrance_year">
                    <option > Select Year</option>
                    @foreach($years as $year)
                        <option value="{{$year->id}}" {{isset($universityInformation->entrance_year) && $year->id == $universityInformation->entrance_year ? "selected" :''}}>{{$year->year_value}}</option>
                    @endforeach
                </select>
            </div>
            <div class="form-group col-md-6" id="month_div_show_edu_vs" style="display:  <?php if(empty($universityInformation->entrance_month)): echo "none"; endif; ?>">
                <label for="">ENTRANCE MONTH </label>
                <select class="form-control" onchange="showPageEducation('#day_div_show')" name="entrance_month">
                    @foreach($months as $month)
                        <option value="{{$month->id}}" {{isset($universityInformation->entrance_month) && $month->id == $universityInformation->entrance_month ? "selected" :''}}>{{$month->eng_title}}</option>
                    @endforeach
                </select>
            </div>
        </div>
    </div>
    <div class="form-group col-md-6">
        <div class="row">
        <div class="form-group col-md-6">
                <label for="">PASS YEAR</label>
                <select class="form-control" id="birth_year" onchange="showPageEducation('#month_div_show_pass_vs')"
                        name="pass_year">
                    <option  >Select Year</option>
                    @foreach($years as $year)
                        <option value="{{$year->id}}" {{isset($universityInformation->pass_year) && $year->id == $universityInformation->pass_year ? "selected" :''}} >{{$year->year_value}}</option>
                    @endforeach
                </select>
            </div>
            <div class="form-group col-md-6" id="month_div_show_pass_vs" style="display:  <?php if(empty($universityInformation->pass_month)): echo "none"; endif; ?>">
                <label for="">PASS Month</label>
                <select class="form-control" onchange="showPageEducation('#day_div_show')" name="pass_month">
                    @foreach($months as $month)
                        <option value="{{$month->id}}" {{isset($universityInformation->pass_month) && $month->id == $universityInformation->pass_month ? "selected" :''}} >{{$month->eng_title}}</option>
                    @endforeach
                </select>
            </div>
        </div>
    </div>

        <div class="form-group col-md-12">
            <label for="">INSTITUTION NAME</label>
            <input class="form-control" type="text" name="institution_name" value="{{isset($universityInformation->institution_name) ? $universityInformation->institution_name :''}}">
       </div>

<div class=" form-group col-md-12 mt-4">
<button type="button" class="btn btn-large btn-primary"   onClick="submitDefaultProfileEducationForm();">{{__('Update University Info')}} <i  class="fa fa-arrow-circle-right" aria-hidden="true"></i></button>
</div>


</form>

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
