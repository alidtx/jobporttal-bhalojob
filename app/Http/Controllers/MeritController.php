<?php

namespace App\Http\Controllers;

use App\Models\Merit;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class MeritController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $allsuccessData = Merit::get();
        return view('admin.merit.index', compact('allsuccessData'));
    }


    public function detailsIndex()
    {
        $alldetails = DB::table('merit_details')
            ->select('merits.id as mid', 'merits.title', 'merit_details.id as mdid', 'merit_details.date', 'merit_details.details')

            ->join('merits', 'merits.id', '=', 'merit_details.merit_id')
            ->get();
        // dd($alldetails);
        return view('admin.meritDetails.index', compact('alldetails'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('admin.merit.add');
    }
    public function meritDetailsCreate()
    {
        $alldetails = Merit::get();
        return view('admin.meritDetails.add', compact('alldetails'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */

    public function meritDetailsSave(Request $request)
    {
        // dd($request->all());
        $validated = $request->validate([
            'merit_id' => 'required',
            'date' => 'required',
            'details' => 'required',
            // 'image' => 'required|image|mimes:jpg,png,jpeg,gif,svg|max:2048',
        ]);

        $data = array(
            "merit_id" => $request->merit_id,
            "date" => $request->date,
            "details" => $request->details
        );

        DB::table('merit_details')->insert($data);

        flash('Merit details data has been added!')->success();
        return redirect('admin/meritDetailsIndex');
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'title' => 'required|max:400',
            'image' => 'required',
            // 'image' => 'required|image|mimes:jpg,png,jpeg,gif,svg|max:2048',
        ]);


        if ($request->hasFile('image')) {
            $image = $request->file('image');
            $name = time() . '.' . $image->getClientOriginalExtension();
            $destinationPath = public_path('/merit/');
            $image->move($destinationPath, $name);
        }

        $successJob = new Merit();
        $successJob->title = $request->title;
        $successJob->image = $name;
        $successJob->save();
        flash('Merit has been added!')->success();
        return redirect('admin/meritIndex');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Merit  $merit
     * @return \Illuminate\Http\Response
     */
    public function show(Merit $merit)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Merit  $merit
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $olduserdata = Merit::findOrFail($id);
        return view('admin.merit.edit', compact('olduserdata'));
    }

    public function meritDetailsEdit($id)
    {
        $alldetails = Merit::get();
        $olduserdata = DB::table('merit_details')->where('id', $id)->first();
        return view('admin.meritDetails.edit', compact('olduserdata', 'alldetails'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Merit  $merit
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Merit $merit)
    {
        $validated = $request->validate([
            'title' => 'required|max:400',
        ]);

        if ($request->hasFile('image')) {
            $image = $request->file('image');
            $name = time() . '.' . $image->getClientOriginalExtension();
            $destinationPath = public_path('/merit/');
            $image->move($destinationPath, $name);
        } else {
            $name = $request->oldImage;
        }
        $successJob = Merit::find($request->oldId);
        $successJob->title = $request->title;
        $successJob->image = $name;
        $successJob->save();
        flash('Merit has been Updated!')->success();
        return redirect('admin/meritIndex');
    }

    public function meritDetailsUpdate(Request $request, Merit $merit)
    {

        // dd($request->all());
        $validated = $request->validate([
            'merit_id' => 'required',
            'date' => 'required',
            'details' => 'required',
            // 'image' => 'required|image|mimes:jpg,png,jpeg,gif,svg|max:2048',
        ]);

        $data = array(
            "merit_id" => $request->merit_id,
            "date" => $request->date,
            "details" => $request->details
        );

        DB::table('merit_details')->where('id', $request->oldId)->update($data);

        flash('Merit details data has been updated!')->success();
        return redirect('admin/meritDetailsIndex');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Merit  $merit
     * @return \Illuminate\Http\Response
     */
    public function destroy(Merit $merit)
    {
        //
    }
}
