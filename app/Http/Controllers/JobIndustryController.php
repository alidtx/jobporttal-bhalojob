<?php

namespace App\Http\Controllers;

use App\Industry;
use App\Language;
use App\Models\jobCategory;
use App\Models\jobIndustry;
use App\Models\jobSubCategory;
use Illuminate\Http\Request;

class JobIndustryController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $jobIndustry = jobIndustry::select('job_industries.*','job_categories.*', 'job_industries.id as mainid','job_sub_categories.id as jsc', 'job_sub_categories.sub_name', 'industries.id as iid', 'industries.industry')
            ->join('job_sub_categories', 'job_sub_categories.id', '=', 'job_industries.sub_id')
            ->join('job_categories', 'job_categories.id', '=', 'job_industries.category_id')
            ->join('industries', 'industries.id', '=', 'job_industries.industry_id')->get();
      
        return view('admin.jobcategory.industry.index', compact('jobIndustry'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $language = Language::get();
        $jobcategory = jobCategory::get();
        $jobsub = jobSubCategory::get();
        $inds = Industry::get();
        return view('admin.jobcategory.industry.add', compact('language', 'jobsub', 'inds','jobcategory'));
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
            'sub_category_id' => 'required',
            'industry_id' => 'required',
        ]);

        $js = new jobIndustry();
        $js->lan = $request->lan;
        $js->category_id = $request->category_id;
        $js->sub_id = $request->sub_category_id;
        $js->industry_id = $request->industry_id;
        $js->save();
        flash('Job Industry has been created!')->success();
        return redirect('admin/jiIndex');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\jobIndustry  $jobIndustry
     * @return \Illuminate\Http\Response
     */
    public function show(jobIndustry $jobIndustry)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\jobIndustry  $jobIndustry
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $language = Language::get();
        $allsub = jobSubCategory::get();
        $oldjsdata = jobIndustry::findOrFail($id);
        $inds = Industry::get();
        return view('admin.jobcategory.industry.edit', compact('oldjsdata', 'language', 'allsub', 'inds'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\jobIndustry  $jobIndustry
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, jobIndustry $jobIndustry)
    {
        $validated = $request->validate([
            'lan' => 'required',
            'sub_id' => 'required',
            'industry_id' => 'required',
        ]);

        $js = jobIndustry::find($request->oldid);
        $js->lan = $request->lan;
        $js->sub_id = $request->sub_id;
        $js->industry_id = $request->industry_id;
        $js->save();


        flash('Job Industry has been Created!')->success();
        return redirect('admin/jiIndex');
    }

    public function delete($id)
    {

       
        jobIndustry::where('id', $id)->delete();
        flash('Job Industry has been Deleted!')->success();
        return redirect('admin/jiIndex');
    }
}
