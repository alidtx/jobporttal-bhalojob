<?php

namespace App\Http\Controllers;

use App\Models\SuccessJob;
use Illuminate\Http\Request;

class SuccessJobController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $allsuccessData = SuccessJob::get();
        return view('admin.successjob.index', compact('allsuccessData'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('admin.successjob.add');
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
            'name' => 'required|max:400',
            'age' => 'required',
            // 'image' => 'required|image|mimes:jpg,png,jpeg,gif,svg|max:2048',
        ]);


        if ($request->hasFile('image')) {
            $image = $request->file('image');
            $name = time() . '.' . $image->getClientOriginalExtension();
            $destinationPath = public_path('/successjob/');
            $image->move($destinationPath, $name);
        }

        $successJob = new SuccessJob();
        $successJob->name = $request->name;
        $successJob->age = $request->age;
        $successJob->pri_position = $request->pri_position;
        $successJob->curr_position = $request->curr_position;
        $successJob->description = $request->description;
        $successJob->gender = $request->gender;
        $successJob->is_feature = $request->is_feature;
        $successJob->image = $name;
        $successJob->save();
        flash('Success job has been added!')->success();
        return redirect('admin/successIndex');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\SuccessJob  $successJob
     * @return \Illuminate\Http\Response
     */
    public function show(SuccessJob $successJob)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\SuccessJob  $successJob
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $olduserdata = SuccessJob::findOrFail($id);
        return view('admin.successjob.edit', compact('olduserdata'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\SuccessJob  $successJob
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, SuccessJob $successJob)
    {
        $validated = $request->validate([
            'name' => 'required|max:400',
            'age' => 'required',
            // 'image' => 'required|image|mimes:jpg,png,jpeg,gif,svg|max:2048',
        ]);


        if ($request->hasFile('image')) {
            $image = $request->file('image');
            $name = time() . '.' . $image->getClientOriginalExtension();
            $destinationPath = public_path('/successjob/');
            $image->move($destinationPath, $name);
        } else {
            $name = $request->oldImage;
        }

        $successJob = SuccessJob::find($request->oldId);
        $successJob->name = $request->name;
        $successJob->age = $request->age;
        $successJob->pri_position = $request->pri_position;
        $successJob->curr_position = $request->curr_position;
        $successJob->description = $request->description;
        $successJob->gender = $request->gender;
        $successJob->is_feature = $request->is_feature;
        $successJob->is_active = $request->is_active;
        $successJob->image = $name;
        $successJob->save();
        flash('Success job has been Updated!')->success();
        return redirect('admin/successIndex');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\SuccessJob  $successJob
     * @return \Illuminate\Http\Response
     */
    public function destroy(SuccessJob $successJob)
    {
        //
    }


    public function delete($id)
    {
        SuccessJob::where('id', $id)->delete();
        flash('Success job  has been Deleted!')->success();
        return redirect('admin/successIndex');
    }
}
