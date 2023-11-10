<div class="row">


@php
    $years = DB::table('years')->get();
    $months = DB::table('months')->get();

   @endphp

<div class="form-group col-md-6">
       <div class="row">
                <div class="form-group col-md-6">
                    <label for="">ENTRANCE YEAR</label>
                    <select class="form-control" id="birth_year"    onchange="showPageEducation('#month_div_show_othercer')" name="gender_id">
                        <option value="" disabled>Year</option>
                        @foreach($years as $year)
                        <option value="{{$year->id}}">{{$year->year_value}}</option>
                        @endforeach
                    </select>
                </div>
                <div class="form-group col-md-6" id="month_div_show_othercer" style="display: none">
                    <label for="">ENTRANCE MONTH </label>
                    <select class="form-control"  name="gender_id">                 
                    @foreach($months as $month)
                        <option value="{{$month->id}}">{{$month->eng_title}}</option>
                    @endforeach
                    </select>
            </div>
        </div>
    </div>




    <div class="form-group col-md-12">
        <label> CERTIFICATE TITLE </label>

        <input type="text" name="personal_information[email]" class="form-control">
    </div>
    <div class="form-group col-md-6">
        <label> APPEAL POINT </label>

        <input type="text" name="personal_information[email]" class="form-control">
    </div>



</div>
