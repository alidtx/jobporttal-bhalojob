<?php

namespace App\Http\Controllers;

use App\Models\Growth;
use Illuminate\Http\Request;

class GrowthController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $allgrowth = Growth::get();
        return view('admin.growth.index', compact('allgrowth'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('admin.growth.add');
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
            'title' => 'required',
            'short_title' => 'required',
            'leftimage' => 'required',
            'rightimage' => 'required',
            'note' => 'required',
        ]);

        if ($request->hasFile('leftimage')) {
            $image = $request->file('leftimage');
            $leftimage = time() . '.' . $image->getClientOriginalExtension();
            $destinationPath = public_path('/growth/');
            $image->move($destinationPath, $leftimage);
        }
        if ($request->hasFile('rightimage')) {
            $image = $request->file('rightimage');
            $rightimage = time() . '..' . $image->getClientOriginalExtension();
            $destinationPath = public_path('/growth/');
            $image->move($destinationPath, $rightimage);
        }

        $successJob = new growth();
        $successJob->short_title = $request->short_title;
        $successJob->title = $request->title;
        $successJob->note = $request->note;
        $successJob->leftimage = $leftimage;
        $successJob->rightimage = $rightimage;
        $successJob->save();
        flash('Growth has been created!')->success();
        return redirect('admin/growthIndex');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Growth  $growth
     * @return \Illuminate\Http\Response
     */
    public function show(Growth $growth)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Growth  $growth
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $oldgrowthdata = Growth::findOrFail($id);
        return view('admin.growth.edit', compact('oldgrowthdata'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Growth  $growth
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Growth $growth)
    {
        // dd($request->all());
        $validated = $request->validate([
            'title' => 'required',
            'short_title' => 'required',
            'note' => 'required',
        ]);

        if ($request->hasFile('leftimage')) {
            $image = $request->file('leftimage');
            $leftimage = time() . '.' . $image->getClientOriginalExtension();
            $destinationPath = public_path('/growth/');
            $image->move($destinationPath, $leftimage);
        } else {
            $leftimage = $request->oldleftimage;
        }

        if ($request->hasFile('rightimage')) {
            $image = $request->file('rightimage');
            $rightimage = time() . '..' . $image->getClientOriginalExtension();
            $destinationPath = public_path('/growth/');
            $image->move($destinationPath, $rightimage);
        } else {
            $rightimage = $request->oldrightimage;
        }

        $successJob = Growth::find($request->oldId);
        $successJob->short_title = $request->short_title;
        $successJob->title = $request->title;
        $successJob->note = $request->note;
        $successJob->leftimage = $leftimage;
        $successJob->rightimage = $rightimage;
        $successJob->status = $request->status;
        $successJob->save();
        flash('Growth has been updated!')->success();
        return redirect('admin/growthIndex');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Growth  $growth
     * @return \Illuminate\Http\Response
     */
    public function destroy(Growth $growth)
    {
        //
    }
}
