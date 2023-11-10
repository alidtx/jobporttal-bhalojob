<?php

namespace App\Http\Controllers;

use App;
use App\Models\Statistics;
use App\Seo;
use App\Job;
use App\Company;
use App\User;
use App\FunctionalArea;
use App\Country;
use App\Video;
use App\Testimonial;
use App\SiteSetting;
use App\Slider;
use App\Blog;
use App\City;
use App\Faq;
use Illuminate\Http\Request;
use Redirect;
use App\Traits\CompanyTrait;
use App\Traits\FunctionalAreaTrait;
use App\Traits\CityTrait;
use App\Traits\JobTrait;
use App\Traits\Active;
use App\Helpers\DataArrayHelper;
use App\Models\AboutUs;
use App\Models\CaseStudie;
use App\Models\Featured;
use App\Models\Growth;
use App\Models\jobCategory;
use App\Models\jobPlace;
use App\Models\jobService;
use App\Models\Merit;
use App\Models\SuccessJob;
use App\Models\jobSubCategory;
use App\Models\ServiceCategory;
use Illuminate\Support\Facades\DB;

class IndexController extends Controller
{

    use CompanyTrait;
    use FunctionalAreaTrait;
    use CityTrait;
    use JobTrait;
    use Active;

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        //$this->middleware('auth');
    }


public function register(){
    return view('auth.register-2');
}
    public function index()
    {
        
        $topCompanyIds = $this->getCompanyIdsAndNumJobs(16);
        $topFunctionalAreaIds = $this->getFunctionalAreaIdsAndNumJobs(12);
        $topIndustryIds = $this->getIndustryIdsFromCompanies(12);
        $topCityIds = $this->getCityIdsAndNumJobs(8);
        $featuredJobs = Job::active()->featured()->notExpire()->limit(12)->orderBy('id', 'desc')->get();
        $latestJobs = Job::active()->notExpire()->orderBy('id', 'desc')->limit(18)->get();
        $blogs = Blog::orderBy('id', 'desc')->where('lang', 'like', \App::getLocale())->limit(3)->get();
        $video = Video::getVideo();
        $testimonials = Testimonial::langTestimonials();

        $functionalAreas = DataArrayHelper::langFunctionalAreasArray();
        $countries = DataArrayHelper::langCountriesArray();
        $sliders = Slider::langSliders();

        $jobsCount = Job::active()->notExpire()->count();
        $seekerCount = User::active()->count();
        $companyCount = Company::active()->count();

        $successJob = SuccessJob::where('is_active', '1')->where('is_feature', '1')->orderBy('id', 'DESC')->limit(4)->get();
        $companyLogos = Company::select('logo')->where('is_active', '1')->where('is_featured', '1')->orderBy('id', 'DESC')->limit(12)->get();
        $merit = Merit::orderBy('id', 'DESC')->first();
        $merits = DB::table('merit_details')->orderBy('date', 'asc')->where('merit_id', $merit->id)->get();

        $faqs = Faq::orderBy('id', 'ASC')->get();

        $casStudy = CaseStudie::select(
            'case_studies.*',
            'companies.id as comp_id',
            'companies.name',
            'companies.no_of_employees',
            'companies.description',
            'companies.location',
            'ownership_types.ownership_type as osname',
            'industries.industry',
        )
            ->join('companies', 'companies.id', '=', 'case_studies.company_id')
            ->join('ownership_types', 'ownership_types.id', '=', 'companies.ownership_type_id')
            ->join('industries', 'industries.id', '=', 'companies.industry_id')
            ->get();
        // dd($casStudy);


        $about = AboutUs::where('status', '1')->orderBy('id', 'DESC')->first();
        $aboutdetails = DB::table('about_detail')->orderBy('date', 'asc')->where('about_id', $about->id)->get();
        $growth = Growth::orderBy('id', 'DESC')->where('status', '1')->first();
        $fop = jobService::orderBy('id', 'ASC')->where('category_id', 1)->limit(3)->get();
        $fhrj = jobService::orderBy('id', 'ASC')->where('category_id', 2)->limit(3)->get();
        $jdc = jobService::orderBy('id', 'ASC')->where('category_id', 3)->limit(3)->get();
        $fsj = jobService::orderBy('id', 'ASC')->where('category_id', 4)->limit(3)->get();
        $company = Featured::orderBy('name', 'ASC')->where('institute', 1)->get();
        $college = Featured::orderBy('name', 'ASC')->where('institute', 2)->get();
        $school = Featured::orderBy('name', 'ASC')->where('institute', 3)->get();

        $statistics = Statistics::get();

       // $jobcategoryJob = jobSubCategory::select('id', 'sub_name as name')->where("category_id",1)->get();
       // $jobcategoryStudent = jobSubCategory::select('id', 'sub_name as name')->where("category_id",2)->get();
       // $jobcategoryEmployee = jobSubCategory::select('id', 'sub_name as name')->where("category_id",3)->get();
        //$city = jobPlace::select('id', 'name')->get();
        $footerCity = City::select('id', 'city as name')->get();

        $seo = SEO::where('seo.page_title', 'like', 'front_index_page')->first();
        return view('welcome')
            ->with('topCompanyIds', $topCompanyIds)
            ->with('topFunctionalAreaIds', $topFunctionalAreaIds)
            ->with('topCityIds', $topCityIds)
            ->with('topIndustryIds', $topIndustryIds)
            ->with('featuredJobs', $featuredJobs)
            ->with('latestJobs', $latestJobs)
            ->with('blogs', $blogs)
            ->with('functionalAreas', $functionalAreas)
            ->with('countries', $countries)
            ->with('sliders', $sliders)
            ->with('company', $company) //featured
            ->with('college', $college)
            ->with('statistics', $statistics)
            ->with('school', $school)
            ->with('video', $video)
            ->with('testimonials', $testimonials)
            ->with('jobsCount', $jobsCount)
            ->with('seekerCount', $seekerCount)
            ->with('companyCount', $companyCount)
            ->with('successJob', $successJob)
            ->with('companyLogos', $companyLogos)
            ->with('merits', $merits)
            ->with('merit', $merit)
            ->with('casStudy', $casStudy)
            ->with('about', $about)
            ->with('aboutdetails', $aboutdetails)
            ->with('growth', $growth)
            ->with('faqs', $faqs)
            ->with('jdc', $jdc)
            ->with('fop', $fop)
            ->with('fhrj', $fhrj)
            ->with('fsj', $fsj)
            ->with('seo', $seo);
    }

    public function setLocale(Request $request)
    {
        $locale = $request->input('locale');
        $return_url = $request->input('return_url');
        $is_rtl = $request->input('is_rtl');
        $localeDir = ((bool) $is_rtl) ? 'rtl' : 'ltr';

        session(['locale' => $locale]);
        session(['localeDir' => $localeDir]);

        return Redirect::to($return_url);
    }

    public function checkTime()

    {
        $siteSetting = SiteSetting::findOrFail(1272);
        $t1 = strtotime(date('Y-m-d h:i:s'));
        $t2 = strtotime($siteSetting->check_time);
        $diff = $t1 - $t2;
        $hours = $diff / (60 * 60);
        if ($hours >= 1) {
            $siteSetting->check_time = date('Y-m-d h:i:s');
            $siteSetting->update();
            Artisan::call('schedule:run');
            echo 'done';
        } else {
            echo 'not done';
        }
    }


    public function search(Request $request)

    { 

        $data['serach_result'] = $request->get('search');

        $data['serviceLists'] =jobService::where('name', 'like', $request->get('search'))

                ->orWhere('description', 'like','%' . $request->get('search') . '%')->where('lang', 'like', \App::getLocale())

                ->paginate(1);

                $data['serviceCategory'] = ServiceCategory::get();

        return view('blog_search')->with($data);

    }
    

    public function serviceCategories($slug)

    {
        

        $category = ServiceCategory::where('id', $slug)->first();
        $data['serviceDetails'] = jobService::where("category_id",$slug)->orderBy('id', 'ASC')->first();
        $data['category'] = $category;
        $data['serviceCategory'] = ServiceCategory::get();
        $data['serviceLists'] = jobService::whereRaw("FIND_IN_SET('$category->id',category_id)")->where('lang', 'like', \App::getLocale())->orderBy('id', 'DESC')->paginate(10);

        return view('service.service_view')->with($data);

    }


    public function serviceList(){
       
        $serviceLists = jobService::orderBy('id', 'ASC')->paginate(10);
        $serviceCategory = ServiceCategory::orderBy('id', 'ASC')->get();
       
        return view('service.service_list',compact('serviceLists','serviceCategory'));
    }

    public function serviceView($id){

       
        $serviceCategory = ServiceCategory::orderBy('id', 'ASC')->get();
        $serviceDetails = jobService::where("id",$id)->orderBy('id', 'ASC')->first();
        return view('service.service_view',compact('serviceDetails','serviceCategory'));
    }
}
