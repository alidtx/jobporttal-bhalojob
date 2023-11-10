<div class="modal-body">
    <div class="form-body">
        <div class="row">
        <div class="formrow col-md-6 col-sm-12" id="div_title">
            <label for="">Experience Title </label>
            <input class="form-control" id="title" placeholder="{{__('Experience Title')}}" name="title" type="text" value="{{(isset($profileExperience)? $profileExperience->title:'')}}">
            <span class="help-block title-error"></span> </div>

        <div class="formrow col-md-6 col-sm-12" id="div_company">
            <label for=""> Company </label>
            <input class="form-control" id="company" placeholder="{{__('Company')}}" name="company" type="text" value="{{(isset($profileExperience)? $profileExperience->company:'')}}">
            <span class="help-block company-error"></span> </div>

        <div class="formrow col-md-6 col-sm-12" id="div_country_id">
            <label for=""> Select Country </label>
            <?php
            $country_id = (isset($profileExperience) ? $profileExperience->country_id : $siteSetting->default_country_id);
            ?>
            {!! Form::select('country_id', [''=>__('Select Country')]+$countries, $country_id, array('class'=>'form-control', 'id'=>'experience_country_id')) !!}
            <span class="help-block country_id-error"></span> </div>

        <div class="formrow col-md-6 col-sm-12" id="div_state_id">
            <label for=""> Select State </label>
            <span id="default_state_experience_dd">
                {!! Form::select('state_id', [''=>__('Select State')], null, array('class'=>'form-control', 'id'=>'experience_state_id')) !!}
            </span>
            <span class="help-block state_id-error"></span> </div>

        <div class="formrow col-md-6 col-sm-12" id="div_city_id">
            <label for=""> Select City </label>
            <span id="default_city_experience_dd">
                {!! Form::select('city_id', [''=>__('Select City')], null, array('class'=>'form-control', 'id'=>'city_id')) !!}
            </span>
            <span class="help-block city_id-error"></span> 
        
        </div>
        </div>

        @php
    $years = DB::table('years')->get();
    $months = DB::table('months')->get();
   @endphp


        <div class="formrow">
           <div class="row">
                <div class="form-group col-md-6">
                    <label for="">ENTRANCE YEAR</label>
                    <select class="form-control" id="birth_year"    onchange="showPageOthers('#month_div_show_edu_modal')" name="entrance_year">
                        <option value="" disabled>Year</option>
                        @foreach($years as $year)
                        <option <?php if(!empty($profileExperience->entrance_year) && $profileExperience->entrance_year == $year->id): echo "selected";endif;  ?> value="{{$year->id}}">{{$year->year_value}}</option>
                        @endforeach
                    </select>
                </div>
                <div class="form-group col-md-6" id="month_div_show_edu_modal" style="display: <?php if(empty($profileExperience->entrance_month)): echo "none";endif;  ?>">
                    <label for="">ENTRANCE MONTH </label>
                    <select class="form-control"  name="entrance_month">
                    @foreach($months as $month)
                        <option  <?php if(!empty($profileExperience->entrance_year) && $profileExperience->entrance_month == $month->id): echo "selected";endif;  ?> value="{{$month->id}}">{{$month->eng_title}}</option>
                    @endforeach
                    </select>
                </div>
                <div class="form-group col-md-6">
                    <label for="">PASS YEAR</label>
                    <select class="form-control" id="birth_year"    onchange="showPageOthers('#month_div_show_pass_modal')" name="pass_year">
                        <option value="" disabled>Year</option>
                        @foreach($years as $year)
                        <option  <?php if(!empty($profileExperience->pass_year) && $profileExperience->pass_year == $year->id): echo "selected";endif;  ?> value="{{$year->id}}">{{$year->year_value}}</option>
                        @endforeach
                    </select>
                </div>
                <div class="form-group col-md-6" id="month_div_show_pass_modal" style="display:  <?php if(empty($profileExperience->pass_month)): echo "none";endif;  ?>">
                    <label for="">PASS MONTH </label>
                    <select class="form-control"  name="pass_month">
                    @foreach($months as $month)
                        <option   <?php if(!empty($profileExperience->pass_month) && $profileExperience->pass_month == $month->id): echo "selected";endif;  ?> value="{{$month->id}}">{{$month->eng_title}}</option>
                    @endforeach
                    </select>
                </div>
            </div>
        </div>

        <div class="formrow" id="div_is_currently_working">
            <label for="is_currently_working" class="bold">{{__('Currently Working?')}}</label>
            <div class="radio-list">
                <?php
                $val_1_checked = '';
                $val_2_checked = 'checked="checked"';

                if (isset($profileExperience) && $profileExperience->is_currently_working == 1) {
                    $val_1_checked = 'checked="checked"';
                    $val_2_checked = '';
                }
                ?>
                <label class="radio-inline"><input id="currently_working" name="is_currently_working" type="radio" value="1" {{$val_1_checked}}> {{__('Yes')}} </label>
                <label class="radio-inline"><input id="not_currently_working" name="is_currently_working" type="radio" value="0" {{$val_2_checked}}> {{__('No')}} </label>
            </div>
            <span class="help-block is_currently_working-error"></span>
        </div>
        <div class="formrow" id="div_description">
            <textarea name="description" class="form-control" id="description" placeholder="{{__('Experience description')}}">{{(isset($profileExperience)? $profileExperience->description:'')}}</textarea>
            <span class="help-block description-error"></span> </div>
    </div>
</div>