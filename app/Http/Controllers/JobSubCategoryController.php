<?php

namespace App\Http\Controllers;

use App\Language;
use App\Models\jobCategory;
use App\Models\jobSubCategory;
use App\Models\jobIndustry;
use Illuminate\Http\Request;

class JobSubCategoryController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $alljobservice = jobSubCategory::get();
        return view('admin.jobcategory.sub.index', compact('alljobservice'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $language = Language::get();
        $allcat = jobCategory::get();
        return view('admin.jobcategory.sub.add', compact('language', 'allcat'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $validated = $request->validate([
            'lan' => 'required',
            'category_id' => 'required',
            'sub_name' => 'required|max:400',
        ]);

        $js = new jobSubCategory();
        $js->lan = $request->lan;
        $js->category_id = $request->category_id;
       // $js->job_user_type = $request->job_user_type;
        $js->sub_name = $request->sub_name;
        $js->save();
        flash('Job Sub category has been created!')->success();
        return redirect('admin/jscIndex');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\jobSubCategory  $jobSubCategory
     * @return \Illuminate\Http\Response
     */
    public function show(jobSubCategory $jobSubCategory)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\jobSubCategory  $jobSubCategory
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $language = Language::get();
        $allcat = jobCategory::get();
        $oldjsdata = jobSubCategory::findOrFail($id);
        return view('admin.jobcategory.sub.edit', compact('oldjsdata', 'language', 'allcat'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\jobSubCategory  $jobSubCategory
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, jobSubCategory $jobSubCategory)
    {
        $validated = $request->validate([
            'lan' => 'required',
            'category_id' => 'required',
            'sub_name' => 'required|max:400',
        ]);

        $js = jobSubCategory::find($request->oldid);
        $js->lan = $request->lan;
        $js->category_id = $request->category_id;
        $js->sub_name = $request->sub_name;
        $js->save();
        flash('Job Sub Category has been Created!')->success();
        return redirect('admin/jscIndex');
    }

    public function delete($id)
    {

        $existingdata = jobIndustry::where("sub_id",$id)->first();
        if(empty($existingdata)){
            jobSubCategory::where('id', $id)->delete();
            flash('Job Category has been Deleted!')->success();
        }else{
            flash('Job Category  not Deleted! at first delete child category')->warning();
        }
        return redirect('admin/jscIndex');
    }
}
