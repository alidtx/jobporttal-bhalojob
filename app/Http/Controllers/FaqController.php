<?php

namespace App\Http\Controllers;

use DB;
use App\Faq;
use App\Seo;
use App\Http\Controllers\Controller;


class FaqController extends Controller
{

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $faqcategories = DB::table('faqcategories')->get();
        $seo = SEO::where('seo.page_title', 'like', 'faq')->first();
        //print_r($seo);exit;
        $faqs = Faq::select(
            [
                'faqs.id',
                'faqs.faq_question',
                'faqs.faq_answer',
                'faqs.sort_order',
                'faqs.created_at',
                'faqs.updated_at'
            ]
        )
            ->lang()

            ->where('category_id','id')
            ->get();

        //    dd($faqs);

        return view('faq.list_faq')->with('faq', $faqs)->with('seo', $seo)->with('faqcategories',$faqcategories);
    }

    public function faqView($id){

        $faqs = Faq::select(
            [
                'faqs.id',
                'faqs.faq_question',
                'faqs.faq_answer',
                'faqs.sort_order',
                'faqs.created_at',
                'faqs.updated_at'
            ]
        )
            ->lang()
            ->where('category_id',$id)
            ->get();
        $faqcategories = DB::table('faqcategories')->get();
        $seo = SEO::where('seo.page_title', 'like', 'faq')->first();
        return view('faq.faq_view')->with('faqs', $faqs)->with('seo', $seo)->with('faqcategories',$faqcategories);
    }

}
