<?php

namespace App\Http\Controllers;

use App\Language;
use App\Models\jobCategory;
use App\Models\jobSubCategory;
use Illuminate\Http\Request;

class JobCategoryController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $alljobservice = jobCategory::get();
        return view('admin.jobcategory.index', compact('alljobservice'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $language = Language::get();
        return view('admin.jobcategory.add', compact('language'));
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
            'name' => 'required|max:400',
        ]);

        $js = new jobCategory();
        $js->lan = $request->lan;
        $js->name = $request->name;
        $js->save();
        flash('Job category has been created!')->success();
        return redirect('admin/jcIndex');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\jobCategory  $jobCategory
     * @return \Illuminate\Http\Response
     */
    public function show(jobCategory $jobCategory)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\jobCategory  $jobCategory
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $language = Language::get();
        $oldjsdata = jobCategory::findOrFail($id);
        return view('admin.jobcategory.edit', compact('oldjsdata', 'language'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\jobCategory  $jobCategory
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, jobCategory $jobCategory)
    {
        $validated = $request->validate([
            'lan' => 'required',
            'name' => 'required|max:400',
        ]);


        $js =  jobCategory::find($request->oldid);
        $js->lan = $request->lan;
        $js->name = $request->name;
        $js->save();
        flash('Job Category has been Updated!')->success();
        return redirect('admin/jcIndex');
    }

   
     /**
     * Display the specified resource.
     *
     * @param  \App\Models\Featured  $featured
     * @return \Illuminate\Http\Response
     */
    public function delete($id)
    {

        $existingdata = jobSubCategory::where("category_id",$id)->first();
       
        if(empty($existingdata)){
            jobCategory::where('id', $id)->delete();
            flash('Job Category has been Deleted!')->success();
        }else{
            flash('Job Category  not Deleted! at first delete child category')->warning();
        }

        
        return redirect('admin/jcIndex');
    }



}
