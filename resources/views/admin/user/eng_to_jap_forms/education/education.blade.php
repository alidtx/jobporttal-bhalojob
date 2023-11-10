{!! APFrmErrHelp::showErrorsNotice($errors) !!}
@include('flash::message')


@php
    $years = DB::table('years')->get();
    $months = DB::table('months')->get();
    $days = DB::table('days')->get();
    $sscInfos = DB::table('profile_educations')->where("user_id",$user->id)->where("education_type",1)->first();
    $shcInfos = DB::table('profile_educations')->where("user_id",$user->id)->where("education_type",2)->first();
    $universityInfos = DB::table('profile_educations')->where("user_id",$user->id)->where("education_type",3)->first();
    if(!empty($languageConvert)):
        $eduInfo = json_decode($languageConvert->education_history);
    endif;

  /* echo "<pre>";
    print_r($sscInfos);
    print_r($eduInfo->ssc);

    dd($eduInfo->ssc); */

@endphp
 
<form action="{{route('user.engToJapUpdate',$user->id)}}" method="post" enctype="multipart/form-data">
    @csrf
    <input type="hidden" name="update_form_name" value="education"/>
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
                    <tr>
                        <td colspan="3" style="background-color: #f1f1f1; color:red;text-align: center;">SECONDARY (SSC)/MIDDLE SCHOOL/O-LEVEL</td>
                    </tr>
                    <tr>
                        <td>Entrance Year and Month</td>
                        <td>

                        <table class="table table-bordered">
                                <tr>
                                    <td>
                                        <select class="form-control select2"    >
                                            <option value="" disabled>Year</option>
                                            @foreach($years as $year)
                                                <option value="{{$year->id}}" <?php if(!empty($sscInfos->entrance_year) && $sscInfos->entrance_year == $year->id): echo "selected";endif; ?> >{{$year->year_value}}</option>
                                            @endforeach
                                        </select>
                                    </td>
                                    <td>
                                        <select class="form-control"  >
                                            <option value="" disabled>Month</option>
                                            @foreach($months as $month)
                                                <option value="{{$month->id}}" <?php if(!empty($sscInfos->entrance_month) && $sscInfos->entrance_month == $month->id): echo "selected";endif; ?> >{{$month->eng_title}}</option>
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
                                        <select class="form-control"     name="education_history[ssc][entrance_year]" required>
                                            <option value="" disabled>Year</option>
                                            @foreach($years as $year)
                                                <option value="{{$year->id}}" <?php if(!empty($eduInfo->ssc->entrance_year) && $eduInfo->ssc->entrance_year == $year->id): echo "selected";endif; ?> >{{$year->jp_year_value}}</option>
                                            @endforeach
                                        </select>
                                    </td>
                                    <td>
                                        <select class="form-control"  name="education_history[ssc][entrance_month]" required>
                                            <option value="" disabled>Month</option>
                                            @foreach($months as $month)
                                                <option value="{{$month->id}}"  <?php if(!empty($eduInfo->ssc->entrance_month) && $eduInfo->ssc->entrance_month == $month->id): echo "selected";endif; ?> >{{$month->jp_title}}</option>
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
                                        <select class="form-control select2"    >
                                            <option value="" disabled>Year</option>
                                            @foreach($years as $year)
                                                <option value="{{$year->id}}" <?php if(!empty($sscInfos->entrance_year) && $sscInfos->pass_year == $year->id): echo "selected";endif; ?> >{{$year->year_value}}</option>
                                            @endforeach
                                        </select>
                                    </td>
                                    <td>
                                        <select class="form-control"  >
                                            <option value="" disabled>Month</option>
                                            @foreach($months as $month)
                                                <option value="{{$month->id}}" <?php if(!empty($sscInfos->entrance_month) && $sscInfos->pass_month == $month->id): echo "selected";endif; ?> >{{$month->eng_title}}</option>
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
                                        <select class="form-control"     name="education_history[ssc][pass_year]" required>
                                            <option value="" disabled>Year</option>
                                            @foreach($years as $year)
                                                <option value="{{$year->id}}" <?php if(!empty($eduInfo->ssc->pass_year) && $eduInfo->ssc->pass_year == $year->id): echo "selected";endif; ?> >{{$year->jp_year_value}}</option>
                                            @endforeach
                                        </select>
                                    </td>
                                    <td>
                                        <select class="form-control"  name="education_history[ssc][pass_month]" required>
                                            <option value="" disabled>Month</option>
                                            @foreach($months as $month)
                                                <option value="{{$month->id}}"  <?php if(!empty($eduInfo->ssc->pass_month) && $eduInfo->ssc->pass_month == $month->id): echo "selected";endif; ?> >{{$month->jp_title}}</option>
                                            @endforeach
                                        </select>
                                    </td>
                                   
                                </tr>
                            </table>
                        </td>
                    </tr>




                    <tr>
                        <td>Institute Name</td>
                        <td> {{@$sscInfos->institution_name}} </td>
                        <td><input type="text" name="education_history[ssc][institution_name]" value=" <?php if(!empty($eduInfo->ssc->institution_name)): echo $eduInfo->ssc->institution_name;endif; ?>" class="form-control"></td>
                       
                    </tr>

                    <tr>
                        <td colspan="3" style="background-color: #f1f1f1; color:red;text-align: center;">HIGH SCHOOL/COLLEGE/DEPLOMA</td>
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
                                                <option value="{{$year->id}}" <?php if(!empty($shcInfos->entrance_year) && $shcInfos->entrance_year == $year->id): echo "selected";endif; ?> >{{$year->year_value}}</option>
                                            @endforeach
                                        </select>
                                    </td>
                                    <td>
                                        <select class="form-control"   required>
                                            <option value="" disabled>Month</option>
                                            @foreach($months as $month)
                                                <option value="{{$month->id}}" <?php if(!empty($shcInfos->entrance_month) && $shcInfos->entrance_month == $month->id): echo "selected";endif; ?> >{{$month->eng_title}}</option>
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
                                        <select class="form-control"     name="education_history[hsc][entrance_year]" required>
                                            <option value="" disabled>Year</option>
                                            @foreach($years as $year)
                                                <option value="{{$year->id}}"  <?php if(!empty($eduInfo->hsc->entrance_year) && $eduInfo->hsc->entrance_year == $year->id): echo "selected";endif; ?> >{{$year->jp_year_value}}</option>
                                            @endforeach
                                        </select>
                                    </td>
                                    <td>
                                        <select class="form-control"  name="education_history[hsc][entrance_month]" required>
                                            <option value="" disabled>Month</option>
                                            @foreach($months as $month)
                                                <option value="{{$month->id}}" <?php if(!empty($eduInfo->hsc->entrance_month) && $eduInfo->hsc->entrance_month == $month->id): echo "selected";endif; ?> >{{$month->jp_title}}</option>
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
                                                <option value="{{$year->id}}" <?php if(!empty($shcInfos->entrance_year) && $shcInfos->entrance_year == $year->id): echo "selected";endif; ?> >{{$year->year_value}}</option>
                                            @endforeach
                                        </select>
                                    </td>
                                    <td>
                                        <select class="form-control"   required>
                                            <option value="" disabled>Month</option>
                                            @foreach($months as $month)
                                                <option value="{{$month->id}}" <?php if(!empty($shcInfos->entrance_month) && $shcInfos->entrance_month == $month->id): echo "selected";endif; ?> >{{$month->eng_title}}</option>
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
                                        <select class="form-control"     name="education_history[hsc][pass_year]" required>
                                            <option value="" disabled>Year</option>
                                            @foreach($years as $year)
                                                <option value="{{$year->id}}" <?php if(!empty($eduInfo->hsc->pass_year) && $eduInfo->hsc->pass_year == $year->id): echo "selected";endif; ?>>{{$year->jp_year_value}}</option>
                                            @endforeach
                                        </select>
                                    </td>
                                    <td>
                                        <select class="form-control"  name="education_history[hsc][pass_month]" required>
                                            <option value="" disabled>Month</option>
                                            @foreach($months as $month)
                                                <option value="{{$month->id}}" <?php if(!empty($eduInfo->hsc->pass_month) && $eduInfo->hsc->pass_month == $month->id): echo "selected";endif; ?> >{{$month->jp_title}}</option>
                                            @endforeach
                                        </select>
                                    </td>
                                   
                                </tr>
                            </table>
                        </td>
                    </tr>



                    <tr>
                        <td>Institute Name</td>
                        <td> {{@$shcInfos->institution_name}} </td>
                        <td><input type="text" name="education_history[hsc][institution_name]" value="<?php if(!empty($eduInfo->hsc->institution_name)){ echo $eduInfo->hsc->institution_name;}?>" class="form-control"></td>
                       
                    </tr>

                    <tr>
                        <td>Major / Subject (IF Have)</td>
                        <td> {{$universityInfos->institution_name}} </td>
                        <td><input type="text" name="education_history[hsc][major]" value="<?php if(!empty($eduInfo->hsc->major)){ echo $eduInfo->hsc->major;}?>" class="form-control"></td>
                    </tr>
                    <tr>
                        <td colspan="3" style="background-color: #f1f1f1; color:red;text-align: center;">UNIVERSITY</td>
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
                                                <option value="{{$year->id}}" <?php if(!empty($universityInfos->entrance_year) && $universityInfos->entrance_year == $year->id): echo "selected";endif; ?> >{{$year->year_value}}</option>
                                            @endforeach
                                        </select>
                                    </td>
                                    <td>
                                        <select class="form-control" required>
                                            <option value="" disabled>Month</option>
                                            @foreach($months as $month)
                                                <option value="{{$month->id}}" <?php if(!empty($universityInfos->entrance_month) && $universityInfos->entrance_month == $month->id): echo "selected";endif; ?> >{{$month->eng_title}}</option>
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
                                        <select class="form-control" name="education_history[university][entrance_year]"required>
                                            <option value="" disabled>Year</option>
                                            @foreach($years as $year)
                                                <option value="{{$year->id}}"  <?php if(!empty($eduInfo->university->entrance_year) && $eduInfo->university->entrance_year == $year->id): echo "selected";endif; ?> >{{$year->jp_year_value}}</option>
                                            @endforeach
                                        </select>
                                    </td>
                                    <td>
                                        <select class="form-control" name="education_history[university][entrance_month]" required>
                                            <option value="" disabled>Month</option>
                                            @foreach($months as $month)
                                                <option value="{{$month->id}}" <?php if(!empty($eduInfo->university->entrance_month) && $eduInfo->university->entrance_month == $month->id): echo "selected";endif; ?> >{{$month->jp_title}}</option>
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
                                                <option value="{{$year->id}}" <?php if(!empty($universityInfos->entrance_year) && $universityInfos->entrance_year == $year->id): echo "selected";endif; ?> >{{$year->year_value}}</option>
                                            @endforeach
                                        </select>
                                    </td>
                                    <td>
                                        <select class="form-control" required>
                                            <option value="" disabled>Month</option>
                                            @foreach($months as $month)
                                                <option value="{{$month->id}}" <?php if(!empty($universityInfos->entrance_month) && $universityInfos->entrance_month == $month->id): echo "selected";endif; ?> >{{$month->eng_title}}</option>
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
                                        <select class="form-control" name="education_history[university][pass_year]"required>
                                            <option value="" disabled>Year</option>
                                            @foreach($years as $year)
                                                <option value="{{$year->id}}"  <?php if(!empty($eduInfo->university->pass_year) && $eduInfo->university->pass_year == $year->id): echo "selected";endif; ?> >{{$year->jp_year_value}}</option>
                                            @endforeach
                                        </select>
                                    </td>
                                    <td>
                                        <select class="form-control" name="education_history[university][pass_month]" required>
                                            <option value="" disabled>Month</option>
                                            @foreach($months as $month)
                                                <option value="{{$month->id}}" <?php if(!empty($eduInfo->university->pass_month) && $eduInfo->university->pass_month == $month->id): echo "selected";endif; ?> >{{$month->jp_title}}</option>
                                            @endforeach
                                        </select>
                                    </td>
                                   
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>Institute Name</td>
                        <td> {{$universityInfos->institution_name}} </td>
                        <td><input type="text" name="education_history[university][institution_name]" value="{{(!empty($eduInfo->university->institution_name)) ?  $eduInfo->university->institution_name: ''}}" class="form-control"></td>
                    </tr>
                    <tr>
                        <td>Major / Subject</td>
                        <td> {{$universityInfos->institution_name}} </td>
                        <td><input type="text" name="education_history[university][major]" value="{{(!empty($eduInfo->university->major)) ?  $eduInfo->university->major: ''}}" class="form-control"></td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <button type="submit" class="btn btn-large btn-primary">Update Education  Information <i   class="fa fa-arrow-circle-right"   aria-hidden="true"></i></button>
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
    $(document).ready(function () {
        initdatepicker();


      });


    function initdatepicker() {
        $(".datepicker").datepicker({
            autoclose: true,
            format: 'yyyy-m-d'
        });
    }







</script>
@endpush