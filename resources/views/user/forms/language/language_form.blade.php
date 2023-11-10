<div class="modal-body">
    <div class="form-body">
        @php
            $years = DB::table('years')->get();
            $months = DB::table('months')->get();
            $days = DB::table('days')->get();
            $languageList = DB::table('languages')->get();
        @endphp




        <div class="row">


            <div class="col-md-6">
                <div class="row">
                    <div class="form-group col-md-6">
                        <label for="">PASS YEAR</label>
                        <select class="form-control" onchange="showPageOthers('#month_div_show_pass_modal')"
                                name="pass_year">
                            <option value="" disabled>Year</option>
                            @foreach($years as $year)
                                <option value="{{$year->id}}" {{isset($profileLanguage->pass_year) && $year->id == $profileLanguage->pass_year ? "selected" :''}}>{{$year->year_value}}</option>
                            @endforeach
                        </select>
                   </div>
                    <div class="form-group col-md-6" id="month_div_show_pass_modal" style="display: <?php if(empty($profileLanguage->pass_month)): echo "none"; endif; ?> ">
                        <label for="">PASS MONTH </label>
                        <select class="form-control" name="pass_month">
                            @foreach($months as $month)
                                <option value="{{$month->id}}" {{isset($profileLanguage->pass_month) && $month->id == $profileLanguage->pass_month ? "selected" :''}}>{{$month->eng_title}}</option>
                            @endforeach
                        </select>
                    </div>
                </div>
            </div>

            <div class="col-md-6">
                <div class="row">
                        <div class="form-group col-md-6">
                            <label for="">ENTRANCE YEAR</label>
                            <select class="form-control" id="birth_year" onchange="showPageOthers('#month_div_show_edu_modal')"
                                    name="entrance_year">
                                <option value="" disabled>Year</option>
                                @foreach($years as $year)
                                    <option value="{{$year->id}}" {{isset($profileLanguage->entrance_year) && $year->id == $profileLanguage->entrance_year ? "selected" :''}}>{{$year->year_value}}</option>
                                @endforeach
                            </select>
                    </div>
                    <div class="form-group col-md-6" id="month_div_show_edu_modal" style="display:   <?php if(empty($profileLanguage->entrance_month)): echo "none"; endif; ?>">
                        <label for="">ENTRANCE MONTH </label>
                        <select class="form-control" name="entrance_month">
                            @foreach($months as $month)
                                <option value="{{$month->id}}" {{isset($profileLanguage->entrance_month) && $month->id == $profileLanguage->entrance_month ? "selected" :''}} >{{$month->eng_title}}</option>
                            @endforeach
                        </select>
                    </div>
                </div>
            </div>

           

            <div class="form-group col-md-6">
                <div class="formrow" id="div_language_id">
                    <label for=""> Select language  </label>
                    <?php
                    $language_id = (isset($profileLanguage) ? $profileLanguage->language_id : null);
                    ?>
                    <select class="form-control" id="language_id" onchange="getLanguageInfo(this.value,1)" name="language_id">
                            @foreach($languageList as $language)
                                <option  value="{{$language->id}}">{{$language->lang}}</option>
                            @endforeach
                    </select>
                    <span class="help-block language_id-error"></span></div>
            </div>
            <div class="form-group col-md-6">
                <div class="formrow" id="">
                    <label for=""> Select Type </label>
                    <?php
                    $language_id3 = (isset($profileLanguage) ? $profileLanguage->language_id : null);
                    ?>
                    <select class="form-control" id="language_type_id" onchange="getLanguageInfo(this.value,2)" name="language_type_id">
                          
                    </select>
                    <!-- {!! Form::select('language_id', [''=>__('Select language')]+$languages, $language_id, array('class'=>'form-control ', 'id'=>'language_id')) !!} -->
                    <span class="help-block language_id-error"></span></div>
            </div>
            <div class="form-group col-md-6">
                <div class="formrow" id="div_language_level_id">
                    <label for=""> Select Language Level </label>
                    <?php
                    $language_level_id = (isset($profileLanguage) ? $profileLanguage->language_level_id : null);
                    ?>
                    {!! Form::select('language_level_id', [''=>__('Select Language Level')]+$languageLevels, $language_level_id, array('class'=>'form-control', 'id'=>'language_level_id')) !!}
                    <span class="help-block language_level_id-error"></span></div>
            </div>

        </div>
    </div>
</div>



