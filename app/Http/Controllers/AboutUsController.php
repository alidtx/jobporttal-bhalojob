<?php

namespace App\Http\Controllers;

use App\Models\AboutUs;
use DateTime;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class AboutUsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $allaboutdata = AboutUs::get();
        return view('admin.about.index', compact('allaboutdata'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('admin.about.add');
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
            'title' => 'required|max:400',
            'description' => 'required',
            'lfetimage' => 'required',
            'rightimage' => 'required',
        ]);

        if ($request->hasFile('lfetimage')) {
            $image = $request->file('lfetimage');
            $lfetimage = time() . '.' . $image->getClientOriginalExtension();
            $destinationPath = public_path('/about/');
            $image->move($destinationPath, $lfetimage);
        }
        if ($request->hasFile('rightimage')) {
            $image = $request->file('rightimage');
            $rightimage = time() . '..' . $image->getClientOriginalExtension();
            $destinationPath = public_path('/about/');
            $image->move($destinationPath, $rightimage);
        }

        $successJob = new AboutUs();
        $successJob->title = $request->title;
        $successJob->description = $request->description;
        $successJob->lfetimage = $lfetimage;
        $successJob->rightimage = $rightimage;
        $successJob->save();
        flash('About has been created!')->success();
        return redirect('admin/aboutIndex');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\AboutUs  $aboutUs
     * @return \Illuminate\Http\Response
     */
    public function show(AboutUs $aboutUs)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\AboutUs  $aboutUs
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $olduserdata = AboutUs::findOrFail($id);
        return view('admin.about.edit', compact('olduserdata'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\AboutUs  $aboutUs
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, AboutUs $aboutUs)
    {
        $validated = $request->validate([
            'title' => 'required|max:400',
            'description' => 'required',
            // 'lfetimage' => 'required',
            // 'rightimage' => 'required',
        ]);

        if ($request->hasFile('lfetimage')) {
            $image = $request->file('lfetimage');
            $lfetimage = time() . '.' . $image->getClientOriginalExtension();
            $destinationPath = public_path('/about/');
            $image->move($destinationPath, $lfetimage);
        } else {
            $lfetimage = $request->leftoldImage;
        }

        if ($request->hasFile('rightimage')) {
            $image = $request->file('rightimage');
            $rightimage = time() . '..' . $image->getClientOriginalExtension();
            $destinationPath = public_path('/about/');
            $image->move($destinationPath, $rightimage);
        } else {
            $rightimage = $request->rightoldImage;
        }

        $successJob = AboutUs::find($request->oldId);
        $successJob->title = $request->title;
        $successJob->description = $request->description;
        $successJob->lfetimage = $lfetimage;
        $successJob->rightimage = $rightimage;
        $successJob->save();
        flash('About has been updated!')->success();
        return redirect('admin/aboutIndex');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\AboutUs  $aboutUs
     * @return \Illuminate\Http\Response
     */
    public function destroy(AboutUs $aboutUs)
    {
        //
    }

    public function AboutIndex()
    {

        $alldetails = DB::table('about_detail')
            ->select('about_us.id as aid', 'about_us.title', 'about_detail.id as adid', 'about_detail.date', 'about_detail.details')
            ->join('about_us', 'about_us.id', '=', 'about_detail.about_id')
            ->get();
        return view('admin.about_details.index', compact('alldetails'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function AboutCreate()
    {
        $alldetails = AboutUs::where('status', '1')->get();
        return view('admin.about_details.add', compact('alldetails'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function AboutStore(Request $request)
    {
        $validated = $request->validate([
            'about_id' => 'required',
            'date' => 'required',
            'details' => 'required',
            // 'image' => 'required|image|mimes:jpg,png,jpeg,gif,svg|max:2048',
        ]);

        $data = array(
            "about_id" => $request->about_id,
            "date" => $request->date,
            "details" => $request->details
        );

        DB::table('about_detail')->insert($data);

        flash('About details data has been added!')->success();
        return redirect('admin/aboutDetailsIndex');
    }

    public function AboutEdit($id)
    {
        $alldetails = AboutUs::get();
        $olduserdata = DB::table('about_detail')->where('id', $id)->first();
        return view('admin.about_details.edit', compact('alldetails', 'olduserdata'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\AboutUs  $aboutUs
     * @return \Illuminate\Http\Response
     */
    public function AboutUpdate(Request $request, AboutUs $aboutUs)
    {
        $validated = $request->validate([
            'about_id' => 'required',
            'date' => 'required',
            'details' => 'required',
        ]);

        $data = array(
            "about_id" => $request->about_id,
            "date" => $request->date,
            "details" => $request->details
        );

        DB::table('about_detail')->where('id', $request->oldId)->update($data);

        flash('About details data has been updated!')->success();
        return redirect('admin/aboutDetailsIndex');
    }
}
