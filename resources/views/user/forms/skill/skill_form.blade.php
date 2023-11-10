<div class="modal-body">
    <div class="form-body">
        @php
            $years = DB::table('years')->get();
            $months = DB::table('months')->get();
            $days = DB::table('days')->get();
        @endphp
        <div class="row">
            <div class="form-group col-md-6">
                <label for="">PASS YEAR</label>
                <select class="form-control" onchange="showPageOthers('#month_div_show_pass_modal')"
                        name="pass_year">
                    <option value="" disabled>Year</option>
                    @foreach($years as $year)
                        <option value="{{$year->id}}" {{ isset($profileSkill->pass_year) && $profileSkill->pass_year == $year->id  ? "selected" : ''}}>{{$year->year_value}}</option>
                    @endforeach
                </select>
            </div>
            <div class="form-group col-md-6" id="month_div_show_pass_modal" style="display: <?php if(empty($profileSkill->pass_month)): echo "none";endif; ?>">
                <label for="">PASS MONTH </label>
                <select class="form-control" name="pass_month">
                    @foreach($months as $month)
                        <option value="{{$month->id}}" {{ isset($profileSkill->pass_month) && $profileSkill->pass_month == $month->id  ? "selected" : ''}}>{{$month->eng_title}}</option>
                    @endforeach
                </select>
            </div>
            <div class="form-group col-md-12">
                <label for="lastName">CERTIFICATE TITLE</label>
                <input type="text" name="certificate_title"  value="{{ isset($profileSkill->certificate_title)  ? $profileSkill->certificate_title : ''}}"  class="form-control">
            </div>

        </div>
    </div>
</div>
