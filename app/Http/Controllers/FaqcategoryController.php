<?php

namespace App\Http\Controllers;

use App\Language;
use App\Models\Faqcategory;
use App\Faq;
use Illuminate\Http\Request;

class FaqcategoryController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $allcategory = Faqcategory::get();
        return view('admin.faq.category.index', compact('allcategory'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $language = Language::get();
        return view('admin.faq.category.add', compact('language'));
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'lan' => 'required',
            'category_name' => 'required|max:400',
        ]);
        if ($request->hasFile('image')) {
            $image = $request->file('image');
            $fimage = time() . '.' . $image->getClientOriginalExtension();
            $destinationPath = public_path('/faq/');
            $image->move($destinationPath, $fimage);
        }
        $js = new Faqcategory();
        $js->lan = $request->lan;
        $js->category_name = $request->category_name;
        $js->image = $fimage;
        $js->save();
        flash('Faq category has been created!')->success();
        return redirect('admin/faqcIndex');
    }


    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Faqcategory  $faqcategory
     * @return \Illuminate\Http\Response
     */
    public function show(Faqcategory $faqcategory)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Faqcategory  $faqcategory
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $language = Language::get();
        $oldjsdata = Faqcategory::findOrFail($id);
        return view('admin.faq.category.edit', compact('oldjsdata', 'language'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\jobCategory  $jobCategory
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request)
    {
        $validated = $request->validate([
            'lan' => 'required',
            'category_name' => 'required|max:400',
        ]);
        if ($request->hasFile('image')) {
            $image = $request->file('image');
            $fimage = time() . '.' . $image->getClientOriginalExtension();
            $destinationPath = public_path('/faq/');
            $image->move($destinationPath, $fimage);
        } else {
            $fimage = $request->oldimage;
        }
        $js =  Faqcategory::find($request->oldid);
        $js->lan = $request->lan;
        $js->category_name = $request->category_name;
        $js->image = $fimage;
        $js->save();
        flash('Faq Category has been Updated!')->success();
        return redirect('admin/faqcIndex');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Faqcategory  $faqcategory
     * @return \Illuminate\Http\Response
     */
     /**
     * Display the specified resource.
     *
     * @param  \App\Models\Featured  $featured
     * @return \Illuminate\Http\Response
     */
    public function delete($id)
    {
        $existing = Faq::select(['faqs.id'])->where('category_id',$id)->get();
        if(empty($existing)){
            Faqcategory::where('id', $id)->delete();
            flash('Faq Category data has been Deleted!')->success();
        }else{
            flash('Faq category not deleted! first child  delete')->warning();
        }
        return redirect('admin/faqcIndex');
    }
}
