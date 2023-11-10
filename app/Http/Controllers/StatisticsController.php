<?php

namespace App\Http\Controllers;

use App\Models\Statistics;
use Illuminate\Http\Request;

class StatisticsController extends Controller
{

    public function index()
    {
        $statistics = Statistics::get();

        return view('admin.statistics.index', compact('statistics'));
    }


    public function create()
    { //echo 'hii'; exit();
        return view('admin.statistics.create');
    }


    public function store(Request $request)
    {


        $requestData = $request->all();

        if (Statistics::create($requestData)) {
            flash('Job Statistics has been created!')->success();
            return redirect()->route('admin.stIndex');
        }
        flash('Job Statistics Not created!')->error();
        return redirect()->route('admin.stIndex');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Statistics  $statistics
     * @return \Illuminate\Http\Response
     */
    public function show(Statistics $statistics)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Statistics  $statistics
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $statistics = Statistics::findOrFail($id);
        return view('admin.statistics.edit',compact('statistics'));
    }


    public function update(Request $request, $id)
    { //echo $id;exit();
        $data = Statistics::find($id);

        $data->title = $request->title;
        $data->short_title = $request->short_title;
        $data->statistics_ratio = $request->statistics_ratio;
        $data->description = $request->description;

        $data->save();

        flash('Job statistics has been Updated!')->success();
        return redirect()->route('admin.stIndex');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Statistics  $statistics
     * @return \Illuminate\Http\Response
     */
    public function destroy(Statistics $statistics)
    {
        //
    }
}
