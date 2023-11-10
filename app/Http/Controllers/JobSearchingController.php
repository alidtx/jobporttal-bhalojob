<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redirect;

class JobSearchingController extends Controller
{
    public function findjob(Request $request)
    {
        $catId = $request->category_id;
        $subId = $request->subcategory_id;
        $placeId = $request->place_id;

        $myarray = [
            'catId' => $catId,
            'subId' => $subId,
            'placeId' => $placeId
        ];


        // return response->json(['url' => url('/jobs')])->with(['myarray' => $myarray]);


        return redirect('jobs')->with(['myarray' => $myarray]);
        // return redirect()->route('jobs', ['catId' => $catId, 'subId' => $subId, 'placeId' => $placeId]);
        return redirect()->route('jobs', [$myarray]);
        // return redirect()->to('/jobs/', ['catId' => $catId, 'subId' => $subId, 'placeId' => $placeId]);
    }
}
