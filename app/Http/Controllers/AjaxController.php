<?php

namespace App\Http\Controllers;

use App\Models\jobIndustry;
use App\Models\jobSubCategory;
use DB;
use Input;
use Form;
use App\Helpers\MiscHelper;
use App\Helpers\DataArrayHelper;
use App\Http\Requests;
use Illuminate\Http\Request;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use App\Http\Controllers\Controller;
use App\Traits\CountryStateCity;
use Illuminate\Support\Facades\Response;

class AjaxController extends Controller
{

    use CountryStateCity;

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

   

    public function filterDefaultStates(Request $request)
    {
        $country_id = $request->input('country_id');
        $state_id = $request->input('state_id');
        $new_state_id = $request->input('new_state_id', 'state_id');
        $states = DataArrayHelper::defaultStatesArray($country_id);
        $dd = Form::select('state_id', ['' => __('Select State')] + $states, $state_id, array('id' => $new_state_id, 'class' => 'form-control'));
        echo $dd;
    }

    public function filterDefaultCities(Request $request)
    {
        $state_id = $request->input('state_id');
        $city_id = $request->input('city_id');
        $cities = DataArrayHelper::defaultCitiesArray($state_id);
        $dd = Form::select('city_id', ['' => 'Select City'] + $cities, $city_id, array('id' => 'city_id', 'class' => 'form-control'));
        echo $dd;
    }

    /*     * ***************************************** */

    public function filterLangStatesbd(Request $request)
    {




        $country_id = $request->input('country_id');
        $state_id = $request->input('state_id');
        $new_state_id = $request->input('new_state_id', 'state_id_bd');
        $states = DataArrayHelper::langStatesArray($country_id);
        $dd = Form::select('state_id_bd', ['' => __('Select State')] + $states, $state_id, array('id' => $new_state_id, 'class' => 'form-control'));
        echo $dd;
    }

    public function filterLangStates(Request $request)
    {
        $country_id = $request->input('country_id');
        $state_id = $request->input('state_id');
        $new_state_id = $request->input('new_state_id', 'state_id');
        $states = DataArrayHelper::langStatesArray($country_id);
        $dd = Form::select('state_id', ['' => __('Select State')] + $states, $state_id, array('id' => $new_state_id, 'class' => 'form-control'));
        echo $dd;
    }

    public function filterLangCities(Request $request)
    {
        $state_id = $request->input('state_id');
        $city_id = $request->input('city_id');
        $cities = DataArrayHelper::langCitiesArray($state_id);

        $dd = Form::select('city_id', ['' => 'Select City'] + $cities, $city_id, array('id' => 'city_id', 'class' => 'form-control'));
        echo $dd;
    }
    public function filterLangCitiesDB(Request $request)
    {
        $state_id = $request->input('state_id');
        $city_id = $request->input('city_id');
        $cities = DataArrayHelper::langCitiesArray($state_id);

        $dd = Form::select('city_id_bd', ['' => 'Select City'] + $cities, $city_id, array('id' => 'city_id_bd', 'class' => 'form-control'));
        echo $dd;
    }
    public function filterSubCategory(Request $request)
    {
        $category_id = $request->input('category_id');
        $sub_category_id = $request->input('sub_category_id');
        $sub_category = DataArrayHelper::subCategoryArray($category_id);

        $dd = Form::select('sub_category_id', ['' => 'Select Sub category'] + $sub_category, $sub_category_id, array('id' => 'sub_category_id', 'class' => 'form-control'));
        echo $dd;

       //return Response::json($dd);
    }
    public function filterIndustry(Request $request){

        $category_id = $request->input('category_id');
        $sub_category_id = $request->input('sub_category_id');
        $sub_category = DataArrayHelper::industryArray($sub_category_id);

        $dd = Form::select('industry_id', ['' => 'Select Industry'] + $sub_category, $sub_category_id, array('id' => 'industry_id', 'class' => 'form-control'));
        echo $dd;
       // $dd = "almamun";
       // return Response::json($sub_category);
    }

    public function ajaxSubcat(Request $request){
        $category_id = $request->input('category_id');
        $job_type_user = $request->input('job_user_type');
       // $sub_category = DataArrayHelper::subCategoryArray($category_id);

        //  $cat_id = $request->input('cat_id');


//        $subcategories = jobSubCategory::select('id', 'sub_name')
//            ->where('id',$category_id)->get();



        $subcategories = jobIndustry::select('job_industries.*',  'industries.id as industries_id', 'industries.industry')


            ->join('industries', 'industries.id', '=', 'job_industries.industry_id')
            ->where('job_industries.sub_id',$category_id)
            ->get();

        return Response::json($subcategories);

    }

    /*     * ***************************************** */

    public function filterStates(Request $request)
    {
        $country_id = $request->input('country_id');
        $state_id = $request->input('state_id');
        $new_state_id = $request->input('new_state_id', 'state_id');
        $states = DataArrayHelper::langStatesArray($country_id);
        $dd = Form::select('state_id[]', ['' => __('Select State')] + $states, $state_id, array('id' => $new_state_id, 'class' => 'form-control'));
        echo $dd;
    }

    public function filterCities(Request $request)
    {
        $state_id = $request->input('state_id');
        $city_id = $request->input('city_id');
        $cities = DataArrayHelper::langCitiesArray($state_id);

        $dd = Form::select('city_id[]', ['' => 'Select City'] + $cities, $city_id, array('id' => 'city_id', 'class' => 'form-control'));
        echo $dd;
    }

    /*     * ***************************************** */

    public function filterDegreeTypes(Request $request)
    {
        $degree_level_id = $request->input('degree_level_id');
        $degree_type_id = $request->input('degree_type_id');

        $degreeTypes = DataArrayHelper::langDegreeTypesArray($degree_level_id);

        $dd = Form::select('degree_type_id', ['' => 'Select degree type'] + $degreeTypes, $degree_type_id, array('id' => 'degree_type_id', 'class' => 'form-control'));
        echo $dd;
    }

}
