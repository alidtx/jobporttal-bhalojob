<?php

namespace App\Traits;

use Auth;
use DB;
use Input;
use Carbon\Carbon;
use Redirect;
use App\User;
use App\ProfileLanguage;
use App\Language;

use App\Models\LanguageType;
use App\LanguageLevel;
use App\Http\Requests;
use Illuminate\Http\Request;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use App\Http\Requests\ProfileLanguageFormRequest;
use App\Helpers\DataArrayHelper;

trait ProfileLanguageTrait
{

    public function showProfileLanguages(Request $request, $user_id)
    {
        $user = User::find($user_id);
        $html = '<div class="col-mid-12"><table class="table table-bordered table-condensed">';


        if (isset($user) && count($user->profileLanguages)):
            $html  .='  <thead>
      <tr>
         <th> ENTRANCE YEAR : </th>
         <th> PASS YEAR: </th>
         <th> Language </th>
         <th>  Type </th>
         <th> Level </th>
         <th> Action </th>
      </tr>
   </thead>';
            foreach ($user->profileLanguages as $language):


                $html .= '<tr id="language_' . $language->id . '">
						<td><span class="text text-success">' . $language->getEntrance('year_value') . '</span></td>
						<td><span class="text text-success">' . $language->getPass('year_value') . '</span></td>
						
						
						<td><span class="text text-success">' . $language->getLanguage('lang') . '</span></td>
						<td><span class="text text-success">' . $language->getLanguageType('eng_title') . '</span></td>
						<td><span class="text text-success">' . $language->getLanguageLevel('language_level') . '</span></td>
						<td><a href="javascript:;" onclick="showProfileLanguageEditModal(' . $language->id . ');" class="text text-warning">' . __('Edit') . '</a>&nbsp;|&nbsp;<a href="javascript:;" onclick="delete_profile_language(' . $language->id . ');" class="text text-danger">' . __('Delete') . '</a></td>
								</tr>';
            endforeach;
        endif;

        echo $html . '</table></div>';
    }

    public function showApplicantProfileLanguages(Request $request, $user_id)
    {
        $user = User::find($user_id);
        $html = '<div class="col-mid-12"><table class="table table-bordered table-condensed">';
        if (isset($user) && count($user->profileLanguages)):
            foreach ($user->profileLanguages as $language):


                $html .= '<tr id="language_' . $language->id . '">
						<td><span class="text text-success">' . $language->getLanguage('lang') . '</span></td>
						<td><span class="text text-success">' . $language->getLanguageLevel('language_level') . '</span></td></tr>';
            endforeach;
        endif;

        echo $html . '</table></div>';
    }

    public function getProfileLanguageForm(Request $request, $user_id)
    {

        $languages = DataArrayHelper::languagesArray();
        $languageLevels = DataArrayHelper::defaultLanguageLevelsArray();

        $user = User::find($user_id);
        $returnHTML = view('admin.user.forms.language.language_modal')
                ->with('user', $user)
                ->with('languages', $languages)
                ->with('languageLevels', $languageLevels)
                ->render();
        return response()->json(array('success' => true, 'html' => $returnHTML));
    }

    public function getFrontProfileLanguageForm(Request $request, $user_id)
    {

        $languages = DataArrayHelper::languagesArray();
        $languageLevels = DataArrayHelper::langLanguageLevelsArray();

        $user = User::find($user_id);
        $returnHTML = view('user.forms.language.language_modal')
                ->with('user', $user)
                ->with('languages', $languages)
                ->with('languageLevels', $languageLevels)
                ->render();
        return response()->json(array('success' => true, 'html' => $returnHTML));
    }


    public function getLanguageType(Request $request, $user_id){
      
            $languageType = $request->language_level_type_id;//1 or 2
            $type_id = $request->type_id;
            if($languageType == 1){
                $languageinfos = DB::table('language_types')->where("lang_id",$type_id)->get();
                return response()->json(array('success' => true, 'languageinfos' => $languageinfos));
            }else{
                $languageinfos = DB::table('language_levels')->where("language_type_id",$type_id)->get();
                return response()->json(array('success' => true, 'languageinfos' => $languageinfos));

            }
    }


    public function storeProfileLanguage(ProfileLanguageFormRequest $request, $user_id)
    {

        $profileLanguage = new ProfileLanguage();
        $profileLanguage = $this->assignLanguageValues($profileLanguage, $request, $user_id);
        $profileLanguage->save();
        /*         * ************************************ */
        $returnHTML = view('admin.user.forms.language.language_thanks')->render();
        return response()->json(array('success' => true, 'status' => 200, 'html' => $returnHTML), 200);
    }

    public function storeFrontProfileLanguage(ProfileLanguageFormRequest $request, $user_id)
    {
        //return response()->json(array('LanguageFormRequest' => $request->all()), 200);
        $profileLanguage = new ProfileLanguage();
        $profileLanguage = $this->assignLanguageValues($profileLanguage, $request, $user_id);
        $profileLanguage->save();
        /*         * ************************************ */
        $returnHTML = view('user.forms.language.language_thanks')->render();
        return response()->json(array('success' => true, 'status' => 200, 'html' => $returnHTML), 200);
    }

    public function getProfileLanguageEditForm(Request $request, $user_id)
    {
        $profile_language_id = $request->input('profile_language_id');

        $languages = DataArrayHelper::languagesArray();
        $languageLevels = DataArrayHelper::defaultLanguageLevelsArray();

        $profileLanguage = ProfileLanguage::find($profile_language_id);
        $user = User::find($user_id);

        $returnHTML = view('admin.user.forms.language.language_edit_modal')
                ->with('user', $user)
                ->with('profileLanguage', $profileLanguage)
                ->with('languages', $languages)
                ->with('languageLevels', $languageLevels)
                ->render();
        return response()->json(array('success' => true, 'html' => $returnHTML));
    }

    public function getFrontProfileLanguageEditForm(Request $request, $user_id)
    {
        $profile_language_id = $request->input('profile_language_id');

        $languages = DataArrayHelper::languagesArray();
        $languageLevels = DataArrayHelper::langLanguageLevelsArray();

        $profileLanguage = ProfileLanguage::find($profile_language_id);
        $user = User::find($user_id);

        $returnHTML = view('user.forms.language.language_edit_modal')
                ->with('user', $user)
                ->with('profileLanguage', $profileLanguage)
                ->with('languages', $languages)
                ->with('languageLevels', $languageLevels)
                ->render();
        return response()->json(array('success' => true, 'html' => $returnHTML));
    }

    public function updateProfileLanguage(ProfileLanguageFormRequest $request, $profile_language_id, $user_id)
    {

        $profileLanguage = ProfileLanguage::find($profile_language_id);
        $profileLanguage = $this->assignLanguageValues($profileLanguage, $request, $user_id);
        $profileLanguage->update();
        /*         * ************************************ */

        $returnHTML = view('admin.user.forms.language.language_edit_thanks')->render();
        return response()->json(array('success' => true, 'status' => 200, 'html' => $returnHTML), 200);
    }

    public function updateFrontProfileLanguage(ProfileLanguageFormRequest $request, $profile_language_id, $user_id)
    {

        $profileLanguage = ProfileLanguage::find($profile_language_id);
        $profileLanguage = $this->assignLanguageValues($profileLanguage, $request, $user_id);
        $profileLanguage->update();
        /*         * ************************************ */

        $returnHTML = view('user.forms.language.language_edit_thanks')->render();
        return response()->json(array('success' => true, 'status' => 200, 'html' => $returnHTML), 200);
    }

    public function assignLanguageValues($profileLanguage, $request, $user_id)
    {

     


        $profileLanguage->user_id = $user_id;
        $profileLanguage->pass_year = $request->input('pass_year');
        $profileLanguage->pass_month = $request->input('pass_month');
        $profileLanguage->entrance_year = $request->input('entrance_year');
        $profileLanguage->entrance_month = $request->input('entrance_month');
        $profileLanguage->language_id = $request->input('language_id');
        $profileLanguage->language_level_id = $request->input('language_level_id');
        $profileLanguage->language_type_id = $request->input('language_type_id');
        return $profileLanguage;
    }

    public function deleteProfileLanguage(Request $request)
    {
        $id = $request->input('id');
        try {
            $profileLanguage = ProfileLanguage::findOrFail($id);
            $profileLanguage->delete();
            echo 'ok';
        } catch (ModelNotFoundException $e) {
            echo 'notok';
        }
    }

}
