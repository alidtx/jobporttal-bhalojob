<div class="row">



@php
    $years = DB::table('years')->get();
    $months = DB::table('months')->get();
    $languages = DB::table('languages')->get();
    $languagetypes = DB::table('language_types')->get();
    $language_levels = DB::table('language_levels')->get();
   @endphp
    <div class="form-group col-md-12">
       <div class="row">
                <div class="form-group col-md-6">
                    <label for="">Pass YEAR</label>
                    <select class="form-control" id="birth_year"    onchange="showPageLanguage('#month_div_show_languae')" name="gender_id">
                        <option value="" disabled>Year</option>
                        @foreach($years as $year)
                        <option value="{{$year->id}}">{{$year->year_value}}</option>
                        @endforeach
                    </select>
                </div>
                <div class="form-group col-md-6" id="month_div_show_languae" style="display: none">
                    <label for="">Pass MONTH </label>
                    <select class="form-control" onchange="showPageEducation('#day_div_show')"  name="gender_id">                 
                    @foreach($months as $month)
                        <option value="{{$month->id}}">{{$month->eng_title}}</option>
                    @endforeach
                    </select>
            </div>
        </div>
    </div>

    <div class="form-group col-md-6">
        <label for="">Language</label>
        <select class="form-control"   name="gender_id">                 
            @foreach($languages as $language)
                <option value="{{$month->id}}">{{$language->lang}}</option>
            @endforeach
        </select>
    </div>
    <div class="form-group col-md-6">
        <label for="">Language Type</label>
        <select class="form-control"  name="gender_id">                 
            @foreach($languagetypes as $langType)
                <option value="{{$langType->id}}">{{$langType->eng_title}}</option>
            @endforeach
        </select>
    </div>

    <div class="form-group col-md-6">
        <label for="">Language Level</label>
        <select class="form-control"  name="gender_id">                 
            @foreach($language_levels as $langguageLevel)
                <option value="{{$langguageLevel->id}}">{{$langguageLevel->language_level}}</option>
            @endforeach
        </select>
    </div>


    




 
</div>
