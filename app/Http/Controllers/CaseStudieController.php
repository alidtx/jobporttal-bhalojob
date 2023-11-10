<?php

namespace App\Http\Controllers;

use App\Company;
use App\Models\CaseStudie;
use Illuminate\Http\Request;

class CaseStudieController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $allcasedata = CaseStudie::select('companies.name', 'case_studies.id', 'case_studies.company_id', 'case_studies.image', 'case_studies.title', 'case_studies.image_title', 'case_studies.is_active')->join('companies', 'companies.id', '=', 'case_studies.company_id')->get();
        return view('admin.casestudy.index', compact('allcasedata'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $company = Company::where('is_active', '1')->orderBy('name', 'ASC')->get();
        return view('admin.casestudy.add', compact('company'));
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
            'company_id' => 'required|unique:case_studies,company_id',
            'title' => 'required',
            'image' => 'required|image|mimes:jpg,png,jpeg,gif,svg|max:2048',
        ]);


        if ($request->hasFile('image')) {
            $image = $request->file('image');
            $name = time() . '.' . $image->getClientOriginalExtension();
            $destinationPath = public_path('/case/');
            $image->move($destinationPath, $name);
        }

        $caseStudy = new CaseStudie();
        $caseStudy->title = $request->title;
        $caseStudy->company_id = $request->company_id;
        $caseStudy->image_title = $request->image_title;
        $caseStudy->image = $name;
        $caseStudy->save();
        flash('Case Study  has been added!')->success();
        return redirect('admin/caseIndex');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\CaseStudie  $caseStudie
     * @return \Illuminate\Http\Response
     */
    public function show(CaseStudie $caseStudie)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\CaseStudie  $caseStudie
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $company = Company::where('is_active', '1')->orderBy('name', 'ASC')->get();
        $oldData = CaseStudie::findOrFail($id);
        return view('admin.casestudy.edit', compact('company', 'oldData'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\CaseStudie  $caseStudie
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, CaseStudie $caseStudie)
    {
        $validated = $request->validate([
            'company_id' => 'required|unique:case_studies,company_id,' . $request->oldId,
            'title' => 'required',
            // 'image' => 'required|image|mimes:jpg,png,jpeg,gif,svg|max:2048',
        ]);


        if ($request->hasFile('image')) {
            $image = $request->file('image');
            $name = time() . '.' . $image->getClientOriginalExtension();
            $destinationPath = public_path('/case/');
            $image->move($destinationPath, $name);
        } else {
            $name = $request->oldImage;
        }

        $caseStudy = CaseStudie::find($request->oldId);
        $caseStudy->title = $request->title;
        $caseStudy->company_id = $request->company_id;
        $caseStudy->image_title = $request->image_title;
        $caseStudy->image = $name;
        $caseStudy->is_active = $request->is_active;
        $caseStudy->save();
        flash('Case Study has been updated!')->success();
        return redirect('admin/caseIndex');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\CaseStudie  $caseStudie
     * @return \Illuminate\Http\Response
     */
    public function delete($id)
    {
        CaseStudie::where('id', $id)->delete();
        flash('Case  has been Deleted!')->success();
        return redirect('admin/caseIndex');
    }
}
