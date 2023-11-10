<?php

namespace App\Traits;

use Auth;
use DB;
use Input;
use Carbon\Carbon;
use Redirect;
use App\User;
use App\ProfileSkill;
use App\JobSkill;
use App\JobExperience;
use App\Country;
use App\Http\Requests;
use Illuminate\Http\Request;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use App\Http\Requests\ProfileSkillFormRequest;
use App\Helpers\DataArrayHelper;

trait ProfileSkillTrait
{

    public function showProfileSkills(Request $request, $user_id)
    {
        $user = User::find($user_id);
        $html = '<div class="col-mid-12"><table class="table table-bordered table-condensed">';

        $html  .='  <thead>
      <tr>
         <th> PASS YEAR </th>
         <th> CERTIFICATE TITLE</th>
         
         <th> Action </th>
      </tr>
   </thead>';
        if (isset($user) && count($user->profileSkills)):
            foreach ($user->profileSkills as $skill):



                $html .= '<tr id="skill_' . $skill->id . '">
                        <td> <span class="text text-success">' . $skill->getPass('year_value') . '</span></td>
						<td><span class="text text-success">' . $skill->certificate_title . '</span></td>
					
						
						<td><a href="javascript:;" onclick="showProfileSkillEditModal(' . $skill->id . ');" class="text text-warning">' . __('Edit') . '</a>&nbsp;|&nbsp;<a href="javascript:;" onclick="delete_profile_skill(' . $skill->id . ');" class="text text-danger">' . __('Delete') . '</a></td>
								</tr>';
            endforeach;
        endif;

        echo $html . '</table></div>';
    }

    public function showApplicantProfileSkills(Request $request, $user_id)
    {
        $user = User::find($user_id);
        $html = '<ul class="profileskills row">';
        if (isset($user) && count($user->profileSkills)):
            foreach ($user->profileSkills as $skill):

                $html .= '<li class="col-md-4" id="skill_' . $skill->id . '">
						<div class="skillbox">' . $skill->getJobSkill('job_skill') . '
						<span class="text text-success">' . $skill->getJobExperience('job_experience') . '</span></div></li>';
            endforeach;
        endif;

        echo $html . '</ul>';
    }

    public function getProfileSkillForm(Request $request, $user_id)
    {

        $jobSkills = DataArrayHelper::defaultJobSkillsArray();
        $jobExperiences = DataArrayHelper::defaultJobExperiencesArray();

        $user = User::find($user_id);
        $returnHTML = view('admin.user.forms.skill.skill_modal')
                ->with('user', $user)
                ->with('jobSkills', $jobSkills)
                ->with('jobExperiences', $jobExperiences)
                ->render();
        return response()->json(array('success' => true, 'html' => $returnHTML));
    }

    public function getFrontProfileSkillForm(Request $request, $user_id)
    {

        $jobSkills = DataArrayHelper::langJobSkillsArray();
        $jobExperiences = DataArrayHelper::langJobExperiencesArray();

        $user = User::find($user_id);
        $returnHTML = view('user.forms.skill.skill_modal')
                ->with('user', $user)
                ->with('jobSkills', $jobSkills)
                ->with('jobExperiences', $jobExperiences)
                ->render();
        return response()->json(array('success' => true, 'html' => $returnHTML));
    }

    public function storeProfileSkill(ProfileSkillFormRequest $request, $user_id)
    {

        $profileSkill = new ProfileSkill();
        $profileSkill->user_id = $user_id;
        $profileSkill->job_skill_id = $request->input('job_skill_id');
        $profileSkill->job_experience_id = $request->input('job_experience_id');
        $profileSkill->save();
        /*         * ************************************ */
        $returnHTML = view('admin.user.forms.skill.skill_thanks')->render();
        return response()->json(array('success' => true, 'status' => 200, 'html' => $returnHTML), 200);
    }

    public function storeFrontProfileSkill(ProfileSkillFormRequest $request, $user_id)
    {
       // return response()->json(array('success' => true, 'status' => 200, 'html' => $request->all()), 200);
        $profileSkill = new ProfileSkill();
        $profileSkill->user_id = $user_id;
        //$profileSkill->job_skill_id = $request->input('job_skill_id');
       // $profileSkill->job_experience_id = $request->input('job_experience_id');
        $profileSkill->pass_year = $request->input('pass_year');
        $profileSkill->pass_month = $request->input('pass_month');
        $profileSkill->certificate_title = $request->input('certificate_title');
        $profileSkill->slug = $this->createSlugSkill($request->input('certificate_title'));
        $profileSkill->save();
       // die("hello");
        /*         * ************************************ */
        $returnHTML = view('user.forms.skill.skill_thanks')->render();
        return response()->json(array('success' => true, 'status' => 200, 'html' => $returnHTML), 200);
    }

    public function getProfileSkillEditForm(Request $request, $user_id)
    {
        $skill_id = $request->input('skill_id');
        $jobSkills = DataArrayHelper::defaultJobSkillsArray();
        $jobExperiences = DataArrayHelper::defaultJobExperiencesArray();

        $profileSkill = ProfileSkill::find($skill_id);
        $user = User::find($user_id);

        $returnHTML = view('admin.user.forms.skill.skill_edit_modal')
                ->with('user', $user)
                ->with('profileSkill', $profileSkill)
                ->with('jobSkills', $jobSkills)
                ->with('jobExperiences', $jobExperiences)
                ->render();
        return response()->json(array('success' => true, 'html' => $returnHTML));
    }

    public function getFrontProfileSkillEditForm(Request $request, $user_id)
    {
        $skill_id = $request->input('skill_id');

        $jobSkills = DataArrayHelper::langJobSkillsArray();
        $jobExperiences = DataArrayHelper::langJobExperiencesArray();

        $profileSkill = ProfileSkill::find($skill_id);
        $user = User::find($user_id);

        $returnHTML = view('user.forms.skill.skill_edit_modal')
                ->with('user', $user)
                ->with('profileSkill', $profileSkill)
                ->with('jobSkills', $jobSkills)
                ->with('jobExperiences', $jobExperiences)
                ->render();
        return response()->json(array('success' => true, 'html' => $returnHTML));
    }

    public function updateProfileSkill(ProfileSkillFormRequest $request, $skill_id, $user_id)
    {

        $profileSkill = ProfileSkill::find($skill_id);
        $profileSkill->user_id = $user_id;
        $profileSkill->job_skill_id = $request->input('job_skill_id');
        $profileSkill->job_experience_id = $request->input('job_experience_id');
        $profileSkill->update();
        /*         * ************************************ */

        $returnHTML = view('admin.user.forms.skill.skill_edit_thanks')->render();
        return response()->json(array('success' => true, 'status' => 200, 'html' => $returnHTML), 200);
    }

    public function updateFrontProfileSkill(ProfileSkillFormRequest $request, $skill_id, $user_id)
    {

        $profileSkill = ProfileSkill::find($skill_id);
        $profileSkill->user_id = $user_id;
        $profileSkill->job_skill_id = $request->input('job_skill_id');
        $profileSkill->job_experience_id = $request->input('job_experience_id');
        $profileSkill->update();
        /*         * ************************************ */

        $returnHTML = view('user.forms.skill.skill_edit_thanks')->render();
        return response()->json(array('success' => true, 'status' => 200, 'html' => $returnHTML), 200);
    }

    public function deleteProfileSkill(Request $request)
    {
        $id = $request->input('id');
        try {
            $profileSkill = ProfileSkill::findOrFail($id);
            $profileSkill->delete();
            echo 'ok';
        } catch (ModelNotFoundException $e) {
            echo 'notok';
        }
    }


   public function createSlugSkill($string) {

    $slug = strtolower(trim(preg_replace('/[^a-zA-Z0-9]+/', '-', $string), '-'));
     $uniqueSlug = $slug . '-' . substr(uniqid(),  -3);
      return str_replace('-','_',$uniqueSlug);
}

}