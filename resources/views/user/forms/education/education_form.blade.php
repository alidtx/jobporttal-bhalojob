<div class="modal-body">
    <div class="form-body">

        @php
            $years = DB::table('years')->get();
            $months = DB::table('months')->get();
        @endphp
        <div class="row">

            <div class="form-group col-md-12">
                <label  class="text-center">ENTRANCE YEAR </label>

                <div class="formrow" id="div_degree_level_id">
                    <?php
                    $degree_level_id = (isset($profileEducation) ? $profileEducation->degree_level_id : null);
                    ?>
                    {!! Form::select('degree_level_id', [''=>__('Select Degree Level')]+$degreeLevels, $degree_level_id, array('class'=>'form-control', 'id'=>'degree_level_id')) !!}
                    <span class="help-block degree_level_id-error"></span> </div>

            </div>
            <div class="col-md-6">
                <div class="row">
                    <div class="form-group col-md-6">
                        <label for="">ENTRANCE YEAR</label>
                        <select class="form-control" id="birth_year" onchange="showPageOthers('#month_div_show_edu_modal')"
                                name="entrance_year">
                            <option  >Year</option>
                            @foreach($years as $year)
                                <option value="{{$year->id}}"{{isset($profileEducation->entrance_year) && $year->id == $profileEducation->entrance_year ? "selected" :''}} >{{$year->year_value}}</option>
                            @endforeach
                        </select>
                    </div>
                    <div class="form-group col-md-6" id="month_div_show_edu_modal" style="display: none">
                        <label for="">ENTRANCE MONTH </label>
                        <select class="form-control" name="entrance_month">
                            @foreach($months as $month)
                                <option value="{{$month->id}}" {{isset($profileEducation->entrance_month) && $month->id == $profileEducation->entrance_month ? "selected" :''}} >{{$month->eng_title}}</option>
                            @endforeach
                        </select>
                    </div>

                </div>
            </div>
            
            <div class="col-md-6">
                <div class="row">
                <div class="form-group col-md-6">
                <label for="">PASS YEAR</label>
                <select class="form-control"  onchange="showPageOthers('#month_div_show_pass_modal')"
                        name="pass_year">
                    <option >Year</option>
                    @foreach($years as $year)
                        <option value="{{$year->id}}" {{isset($profileEducation->pass_year) && $year->id == $profileEducation->pass_year ? "selected" :''}}>{{$year->year_value}}</option>
                    @endforeach
                </select>
            </div>
            <div class="form-group col-md-6" id="month_div_show_pass_modal" style="display: none">
                <label for="">PASS MONTH </label>
                <select class="form-control" name="pass_month">
                    @foreach($months as $month)
                        <option value="{{$month->id}}" {{isset($profileEducation->pass_month) && $month->id == $profileEducation->pass_month ? "selected" :''}}>{{$month->eng_title}}</option>
                    @endforeach
                </select>
            </div>

                </div>
            </div>

            

            <div class="form-group col-md-6">
                <label for="lastName">INSTITUTION NAME</label>
                <input type="text" name="institution_name" value="{{isset($profileEducation->pass_month) ?  $profileEducation->pass_month :''}}"   class="form-control">
            </div>
            <div class="form-group col-md-6">
                <label for="lastName">MAJOR</label>
                <input type="text" name="major" value="{{isset($profileEducation->major) ?  $profileEducation->major :''}}" class="form-control">
            </div>
        </div>


    </div>
</div>

