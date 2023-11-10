<?php

namespace App\Http\Controllers;

use App\Language;
use App\Models\Featured;
use Illuminate\Http\Request;

class FeaturedController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $alljobservice = Featured::get();
        return view('admin.featured.index', compact('alljobservice'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('admin.featured.add');
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
            'institute' => 'required',
            'logo' => 'required',
            'name' => 'required|max:400',
        ]);

        if ($request->hasFile('logo')) {
            $image = $request->file('logo');
            $name = time() . '.' . $image->getClientOriginalExtension();
            $destinationPath = public_path('/featured/');
            $image->move($destinationPath, $name);
        } else {
            flash('Logo can not be empty!')->error();
            return redirect('admin/fiCreate');
        }

        $js = new Featured();
        $js->institute = $request->institute;
        $js->name = $request->name;
        $js->logo = $name;
        $js->save();
        flash('Featured has been created!')->success();
        return redirect('admin/fiIndex');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Featured  $featured
     * @return \Illuminate\Http\Response
     */
    public function delete($id)
    {
        Featured::where('id', $id)->delete();
        flash('Featured Date has been Deleted!')->success();
        return redirect('admin/fiIndex');
    }
    public function show(Featured $featured)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Featured  $featured
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $language = Language::get();
        $oldjsdata = Featured::findOrFail($id);

        // echo "<pre>";
        // print_r($oldjsdata);
        // die;


        return view('admin.featured.edit', compact('oldjsdata', 'language'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\jobSubCategory  $jobSubCategory
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request)
    {
        $validated = $request->validate([
            'institute' => 'required',
            //'logo' => 'nullrequired',
            'name' => 'required|max:400',
        ]);

        if ($request->hasFile('logo')) {
            $image = $request->file('logo');
            $name = time() . '.' . $image->getClientOriginalExtension();
            $destinationPath = public_path('/featured/');
            $image->move($destinationPath, $name);
        } else {
            $name= $request->oldlogo;
        
           
        }

        $js = Featured::find($request->oldId);
        $js->institute = $request->institute;
        $js->name = $request->name;
        $js->logo = $name;
        $js->save();
        flash('Featured has been updated!')->success();
        return redirect('admin/fiIndex');
    }


    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Featured  $featured
     * @return \Illuminate\Http\Response
     */
    public function destroy(Featured $featured)
    {
        //
    }
}
