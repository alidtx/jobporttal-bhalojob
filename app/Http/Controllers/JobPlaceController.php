<?php

namespace App\Http\Controllers;

use App\Models\jobIndustry;
use App\Models\jobPlace;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Stripe\Terminal\Location;

class JobPlaceController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $jobplace = jobPlace::get();

        // jobIndustry::select('job_industries.*', 'job_sub_categories.id as jsc', 'job_sub_categories.sub_name', 'industries.id as iid', 'industries.industry')
        //     ->join('job_sub_categories', 'job_sub_categories.id', '=', 'job_industries.sub_id')
        //     ->join('industries', 'industries.id', '=', 'job_industries.industry_id')->get();
        // dd($jobIndustry);
        return view('admin.jobcategory.place.index', compact('jobplace'));
    }


    public function create()
    {

        $inds = jobIndustry::get();
        $city = DB::table('cities')->get();
        return view('admin.jobcategory.place.add', compact('city', 'jobind'));
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
            'sub_id' => 'required',
            'industry_id' => 'required',
        ]);

        $js = new jobIndustry();
        $js->lan = $request->lan;
        $js->sub_id = $request->sub_id;
        $js->industry_id = $request->industry_id;
        $js->save();
        flash('Job Industry has been created!')->success();
        return redirect('admin/jiIndex');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\jobPlace  $jobPlace
     * @return \Illuminate\Http\Response
     */
    public function show(jobPlace $jobPlace)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\jobPlace  $jobPlace
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $language = Language::get();
        $allsub = jobSubCategory::get();
        $oldjsdata = jobIndustry::findOrFail($id);
        $inds = Industry::get();
        return view('admin.jobcategory.place.edit', compact('oldjsdata', 'language', 'allsub', 'inds'));
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
        return redirect('admin/jpIndex');
    }


    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\jobPlace  $jobPlace
     * @return \Illuminate\Http\Response
     */
    public function destroy(jobPlace $jobPlace)
    {
        //
    }
}
