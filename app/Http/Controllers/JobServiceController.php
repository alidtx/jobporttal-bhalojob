<?php

namespace App\Http\Controllers;

use App\Models\jobService;
use App\Models\ServiceCategory;
use Illuminate\Http\Request;

class JobServiceController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $alljobservice = jobService::with("category")->get();
        return view('admin.service.index', compact('alljobservice'));
    }


    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $serviceCategory = ServiceCategory::get();

        return view('admin.service.add',compact('serviceCategory'));
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
            'category_id' => 'required',
            'title' => 'required|max:400',
            'description' => 'required',
            
        ]);

        if ($request->hasFile('image')) {
            $image = $request->file('image');
            $name = time() . '.' . $image->getClientOriginalExtension();
            $destinationPath = public_path('/service/');
            $image->move($destinationPath, $name);
        }


        $js = new jobService();
        $js->category_id = $request->category_id;
        $js->title = $request->title;
        $js->fa = $request->fa;
        if(!empty($name)):
          $js->image = $name;
        endif;
        $js->description = $request->description;
        $js->save();
        flash('Job Service has been created!')->success();
        return redirect('admin/jsIndex');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\jobService  $jobService
     * @return \Illuminate\Http\Response
     */
    public function show(jobService $jobService)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\jobService  $jobService
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $serviceCategory = ServiceCategory::get();
        $oldjsdata = jobService::findOrFail($id);
        return view('admin.service.edit', compact('oldjsdata','serviceCategory'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\jobService  $jobService
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, jobService $jobService)
    {
        $validated = $request->validate([
            'category_id' => 'required',
            'title' => 'required|max:400',
            'description' => 'required',
            
        ]);


        if ($request->hasFile('image')) {
            $image = $request->file('image');
            $name = time() . '.' . $image->getClientOriginalExtension();
            $destinationPath = public_path('/service/');
            $image->move($destinationPath, $name);
        } else {
            $name = $request->oldImage;
        }


        $js =  jobService::find($request->oldId);
        $js->category_id = $request->category_id;
        $js->title = $request->title;
        $js->fa = $request->fa;
        $js->description = $request->description;
        if(!empty($name)):
            $js->image = $name;
        endif;
        $js->save();
        flash('Job Service has been Updated!')->success();
        return redirect('admin/jsIndex');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\jobService  $jobService
     * @return \Illuminate\Http\Response
     */
    public function destroy(jobService $jobService)
    {
        //
    }



    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\CaseStudie  $caseStudie
     * @return \Illuminate\Http\Response
     */
    public function delete($id)
    {
    
        jobService::where('id', $id)->delete();
        flash('Job service  has been Deleted!')->success();
        return redirect('admin/jsIndex');
    }



}
