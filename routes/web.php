<?php


/*



  |--------------------------------------------------------------------------



  | Web Routes



  |--------------------------------------------------------------------------



  |



  | Here is where you can register web routes for your application. These



  | routes are loaded by the RouteServiceProvider within a group which



  | contains the "web" middleware group. Now create something great!



  |



 */

//socialite

// Route::get('/auth/{provider}/redirect', 'Auth\ProviderController@redirect');

// Route::get('/auth/{provider}/callback', 'Auth\ProviderController@callback');


// Route::get('auth/google', 'GoogleController@redirectToGoogle');
// Route::get('auth/google/callback', 'GoogleController@handleGoogleCallback');


//Route::get('auth/facebook', 'FacebookController@redirectToFacebook');
//Route::get('auth/facebook/callback', 'FacebookController@handleFacebookCallback');

// success
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

// eng to jap
//Route::post('user-profile', 'FaqController@index')->name('faqlist');


Route::prefix('/admin')->group(function () {
    Route::get('/successIndex', 'SuccessJobController@index')->name('admin.successIndex');
    Route::get('/successCreate', 'SuccessJobController@create')->name('admin.successCreate');
    Route::post('/successSave', 'SuccessJobController@store')->name('admin.successSave');
    Route::get('/successEdit/{id}', 'SuccessJobController@edit')->name('admin.successEdit/{id}');
    Route::get('/successDelete/{id}', 'SuccessJobController@delete')->name('admin.successDelete/{id}');
    Route::post('/successUpdate', 'SuccessJobController@update')->name('admin.successUpdate');
});

// marit

Route::prefix('/admin')->group(function () {
    Route::get('/meritIndex', 'MeritController@index')->name('admin.meritIndex');
    Route::get('/meritCreate', 'MeritController@create')->name('admin.meritCreate');
    Route::post('/meritSave', 'MeritController@store')->name('admin.meritSave');
    Route::get('/meritEdit/{id}', 'MeritController@edit')->name('admin.meritEdit/{id}');
    Route::post('/meritUpdate', 'MeritController@update')->name('admin.meritUpdate');
});

//job searching
Route::post('/searchingJob', 'JobSearchingController@findjob')->name('searchingJob');


// marit details
Route::prefix('/admin')->group(function () {

    Route::get('/meritDetailsIndex', 'MeritController@detailsIndex')->name('admin.meritDetailsIndex');
    Route::get('/meritDetailsCreate', 'MeritController@meritDetailsCreate')->name('admin.meritDetailsCreate');
    Route::post('/meritDetailsSave', 'MeritController@meritDetailsSave')->name('admin.meritDetailsSave');
    Route::get('/meritDetailsEdit/{id}', 'MeritController@meritDetailsEdit')->name('admin.meritDetailsEdit/{id}');
    Route::post('/meritDetailsUpdate', 'MeritController@meritDetailsUpdate')->name('admin.meritDetailsUpdate');

});

// case study
Route::prefix('/admin')->group(function () {

    Route::get('/caseIndex', 'CaseStudieController@index')->name('admin.caseIndex');
    Route::get('/caseCreate', 'CaseStudieController@create')->name('admin.caseCreate');
    Route::post('/caseSave', 'CaseStudieController@store')->name('admin.caseSave');
    Route::get('/caseEdit/{id}', 'CaseStudieController@edit')->name('admin.caseEdit/{id}');
    Route::get('/caseDelete/{id}', 'CaseStudieController@delete')->name('admin.caseDelete/{id}');
    Route::post('/caseUpdate', 'CaseStudieController@update')->name('admin.caseUpdate');
    
});


// about us
Route::prefix('/admin')->group(function () {
    Route::get('/aboutIndex', 'AboutUsController@index')->name('admin.aboutIndex');
    Route::get('/aboutCreate', 'AboutUsController@create')->name('admin.aboutCreate');
    Route::post('/aboutSave', 'AboutUsController@store')->name('admin.aboutSave');
    Route::get('/aboutEdit/{id}', 'AboutUsController@edit')->name('admin.aboutEdit/{id}');
    Route::post('/aboutUpdate', 'AboutUsController@update')->name('admin.aboutUpdate');
});
//statistics


Route::prefix('/admin')->group(function () {

    Route::get('/contactDetailsIndex', 'ContactController@ContactIndex')->name('admin.contactDetailsIndex');
    Route::get('/contactList', 'ContactController@ContactList')->name('admin.contactDetailsCreate');
    Route::get('/downloadexcel', 'ContactController@exportExcel')->name('admin.downloadexcel');
   
    // Route::post('/aboutDetailsSave', 'AboutUsController@AboutStore')->name('admin.aboutDetailsSave');
    // Route::get('/aboutDetailsEdit/{id}', 'AboutUsController@AboutEdit')->name('admin.aboutDetailsEdit/{id}');
    // Route::post('/aboutDetailsUpdate', 'AboutUsController@AboutUpdate')->name('admin.aboutDetailsUpdate');
});


//

Route::prefix('/admin')->group(function () {

    Route::get('/statistics-index', 'StatisticsController@index')->name('admin.stIndex');
    Route::get('/statistics-create', 'StatisticsController@create')->name('admin.stCreate');
    Route::post('/statistics-create', 'StatisticsController@store')->name('admin.ststore');
    Route::get('/stEdit/{id}', 'StatisticsController@edit')->name('admin.stEdit/{id}');
    Route::post('/statistics-update/{id}', 'StatisticsController@update')->name('admin.stUpdate');

});

// job service
Route::prefix('/admin')->group(function () {
    Route::get('/jsIndex', 'JobServiceController@index')->name('admin.jsIndex');
    Route::get('/jsCreate', 'JobServiceController@create')->name('admin.jsCreate');
    Route::post('/jsSave', 'JobServiceController@store')->name('admin.jsSave');
    Route::get('/jsEdit/{id}', 'JobServiceController@edit')->name('admin.jsEdit/{id}');
    Route::get('/jsDelete/{id}', 'JobServiceController@delete')->name('admin.jsDelete/{id}');
    Route::post('/jsUpdate', 'JobServiceController@update')->name('admin.jsUpdate');
});

Route::prefix('/admin')->group(function () {
    Route::get('/applicantIndex', 'ApplicantApplicationController@index')->name('admin.applicantIndex');
    Route::get('/applicantCreate', 'ApplicantApplicationController@create')->name('admin.applicantCreate');
    Route::post('/applicantSave', 'ApplicantApplicationController@store')->name('admin.applicantSave');
    Route::get('/applicantEdit/{id}', 'ApplicantApplicationController@edit')->name('admin.applicantEdit/{id}');
    Route::get('/applicantDelete/{id}', 'ApplicantApplicationController@delete')->name('admin.applicantDelete/{id}');
    Route::post('/applicantUpdate', 'ApplicantApplicationController@update')->name('admin.applicantUpdate');
});


// job cateogry
Route::prefix('/admin')->group(function () {
    Route::get('/jcIndex', 'JobCategoryController@index')->name('admin.jcIndex');
    Route::get('/jcCreate', 'JobCategoryController@create')->name('admin.jcCreate');
    Route::post('/jcSave', 'JobCategoryController@store')->name('admin.jcSave');
    Route::get('/jcEdit/{id}', 'JobCategoryController@edit')->name('admin.jcEdit/{id}');
    Route::get('/jcDelete/{id}', 'JobCategoryController@delete')->name('admin.jcDelete/{id}');
    Route::post('/jcUpdate', 'JobCategoryController@update')->name('admin.jcUpdate');
});

// job sub cateogry
Route::prefix('/admin')->group(function () {
    Route::get('/jscIndex', 'JobSubCategoryController@index')->name('admin.jscIndex');
    Route::get('/jscCreate', 'JobSubCategoryController@create')->name('admin.jscCreate');
    Route::post('/jscSave', 'JobSubCategoryController@store')->name('admin.jscSave');
    Route::get('/jscEdit/{id}', 'JobSubCategoryController@edit')->name('admin.jscEdit/{id}');
    Route::get('/jscDelete/{id}', 'JobSubCategoryController@delete')->name('admin.jscDelete/{id}');
    Route::post('/jscUpdate', 'JobSubCategoryController@update')->name('admin.jscUpdate');
});

// job sub cateogry
Route::prefix('/admin')->group(function () {
    Route::get('/jscIndex', 'JobSubCategoryController@index')->name('admin.jscIndex');
    Route::get('/jscCreate', 'JobSubCategoryController@create')->name('admin.jscCreate');
    Route::post('/jscSave', 'JobSubCategoryController@store')->name('admin.jscSave');
    Route::get('/jscEdit/{id}', 'JobSubCategoryController@edit')->name('admin.jscEdit/{id}');
    Route::post('/jscUpdate', 'JobSubCategoryController@update')->name('admin.jscUpdate');
});


// job industry
Route::prefix('/admin')->group(function () {
    Route::get('/jiIndex', 'JobIndustryController@index')->name('admin.jiIndex');
    Route::get('/jiCreate', 'JobIndustryController@create')->name('admin.jiCreate');
    Route::post('/jiSave', 'JobIndustryController@store')->name('admin.jiSave');
    Route::get('/jiEdit/{id}', 'JobIndustryController@edit')->name('admin.jiEdit/{id}');
    Route::get('/jiDelete/{id}', 'JobIndustryController@delete')->name('admin.jiDelete/{id}');
    Route::post('/jiUpdate', 'JobIndustryController@update')->name('admin.jiUpdate');
});
// job place
Route::prefix('/admin')->group(function () {
    Route::get('/jpIndex', 'JobPlaceController@index')->name('admin.jpIndex');
    Route::get('/jpCreate', 'JobPlaceController@create')->name('admin.jpCreate');
    Route::post('/jpSave', 'JobPlaceController@store')->name('admin.jpSave');
    Route::get('/jpEdit/{id}', 'JobPlaceController@edit')->name('admin.jpEdit/{id}');
    Route::post('/jpUpdate', 'JobPlaceController@update')->name('admin.jpUpdate');
});


//Route::get('/ajax-subcat', function (Request $request) {
//  $cat_id = $request->input('cat_id');
////  $subcategories = DB::table('job_sub_categories')
////  ->join('industries','industries.id','=','job_industries.industry_id')
////  ->where('category_id', $cat_id)->get();
//
//    $subcategories = App\Models\jobSubCategory::select('id', 'sub_name as name')->where("job_user_type",1)->get();
//  return Response::json($subcategories);
//});


// featured
Route::prefix('/admin')->group(function () {
    Route::get('/fiIndex', 'FeaturedController@index')->name('admin.fiIndex');
    Route::get('/fiCreate', 'FeaturedController@create')->name('admin.fiCreate');
    Route::post('/fiSave', 'FeaturedController@store')->name('admin.fiSave');
    Route::get('/fiEdit/{id}', 'FeaturedController@edit')->name('admin.fiEdit/{id}');
    Route::get('/fiUpdate', 'FeaturedController@update')->name('admin.update');
    Route::get('/fiDelete/{id}', 'FeaturedController@delete')->name('admin.fiDelete/{id}');
    Route::post('/fiUpdate', 'FeaturedController@update')->name('admin.fiUpdate');
});

// faq category
Route::prefix('/admin')->group(function () {
    Route::get('/faqcIndex', 'FaqcategoryController@index')->name('admin.faqcIndex');
    Route::get('/faqcCreate', 'FaqcategoryController@create')->name('admin.faqcCreate');
    Route::post('/faqcSave', 'FaqcategoryController@store')->name('admin.faqcSave');
    Route::get('/faqcEdit/{id}', 'FaqcategoryController@edit')->name('admin.faqcEdit/{id}');
    Route::get('/faqcDelete/{id}', 'FaqcategoryController@delete')->name('admin.faqcDelete/{id}');
    Route::post('/faqcUpdate', 'FaqcategoryController@update')->name('admin.faqcUpdate');
});


Route::prefix('/admin')->group(function () {
    Route::get('/aboutDetailsIndex', 'AboutUsController@AboutIndex')->name('admin.aboutDetailsIndex');
    Route::get('/aboutDetailsCreate', 'AboutUsController@AboutCreate')->name('admin.aboutDetailsCreate');
    Route::post('/aboutDetailsSave', 'AboutUsController@AboutStore')->name('admin.aboutDetailsSave');
    Route::get('/aboutDetailsEdit/{id}', 'AboutUsController@AboutEdit')->name('admin.aboutDetailsEdit/{id}');
    Route::post('/aboutDetailsUpdate', 'AboutUsController@AboutUpdate')->name('admin.aboutDetailsUpdate');
});


// growth
Route::prefix('/admin')->group(function () {
    Route::get('/growthIndex', 'GrowthController@index')->name('admin.growthIndex');
    Route::get('/growthCreate', 'GrowthController@create')->name('admin.growthCreate');
    Route::post('/growthSave', 'GrowthController@store')->name('admin.growthSave');
    Route::get('/growthEdit/{id}', 'GrowthController@edit')->name('admin.growthEdit/{id}');
    Route::post('/growthUpdate', 'GrowthController@update')->name('admin.growthUpdate');
});

$real_path = realpath(__DIR__) . DIRECTORY_SEPARATOR . 'front_routes' . DIRECTORY_SEPARATOR;


/* * ******** IndexController ************ */


Route::get('/', 'IndexController@index')->name('index');
Route::get('/register-2', 'IndexController@register')->name('register-index');
Route::get('/check-time', 'IndexController@checkTime')->name('check-time');
Route::post('set-locale', 'IndexController@setLocale')->name('set.locale');
Route::get('service-list', 'IndexController@serviceList')->name('service-list');
Route::get('service/search', 'IndexController@serviceSearch')->name('service-search');
Route::get('/service-view/{id}', 'IndexController@serviceView')->name('service-view');
Route::get('/service/category/{id}', 'IndexController@serviceCategories')->name('service-category');


/* * ******** HomeController ************ */
Route::get('home', 'HomeController@index')->name('home');
/* * ******** TypeAheadController ******* */
Route::get('typeahead-currency_codes', 'TypeAheadController@typeAheadCurrencyCodes')->name('typeahead.currency_codes');
/* * ******** FaqController ******* */
Route::get('faqlist', 'FaqController@index')->name('faqlist');
Route::get('faq-view/{id}', 'FaqController@faqView')->name('faq_view');
/* * ******** CronController ******* */
Route::get('check-package-validity', 'CronController@checkPackageValidity');
/* * ******** Verification ******* */
Route::get('email-verification/error', 'Auth\RegisterController@getVerificationError')->name('email-verification.error');
Route::get('email-verification/check/{token}', 'Auth\RegisterController@getVerification')->name('email-verification.check');
Route::get('company-email-verification/error', 'Company\Auth\RegisterController@getVerificationError')->name('company.email-verification.error');
Route::get('company-email-verification/check/{token}', 'Company\Auth\RegisterController@getVerification')->name('company.email-verification.check');


/* * ***************************** */


// Sociallite Start


// OAuth Routes


Route::get('login/jobseeker/{provider}', 'Auth\LoginController@redirectToProvider');


Route::get('login/jobseeker/{provider}/callback', 'Auth\LoginController@handleProviderCallback');


Route::get('login/employer/{provider}', 'Company\Auth\LoginController@redirectToProvider');


Route::get('login/employer/{provider}/callback', 'Company\Auth\LoginController@handleProviderCallback');


// Sociallite End


/* * ***************************** */


Route::post('tinymce-image_upload-front', 'TinyMceController@uploadImage')->name('tinymce.image_upload.front');


Route::get('cronjob/send-alerts', 'AlertCronController@index')->name('send-alerts');


Route::post('subscribe-newsletter', 'SubscriptionController@getSubscription')->name('subscribe.newsletter');


/* * ******** OrderController ************ */


include_once($real_path . 'order.php');


/* * ******** CmsController ************ */


include_once($real_path . 'cms.php');


/* * ******** JobController ************ */


include_once($real_path . 'job.php');


/* * ******** ContactController ************ */


include_once($real_path . 'contact.php');


/* * ******** CompanyController ************ */


include_once($real_path . 'company.php');


/* * ******** AjaxController ************ */


include_once($real_path . 'ajax.php');


/* * ******** UserController ************ */


include_once($real_path . 'site_user.php');


/* * ******** User Auth ************ */


Auth::routes();


/* * ******** Company Auth ************ */


include_once($real_path . 'company_auth.php');


/* * ******** Admin Auth ************ */


include_once($real_path . 'admin_auth.php');


Route::get('blog', 'BlogController@index')->name('blogs');
Route::get('blog-list', 'BlogController@blogList')->name('blogList');


Route::get('blog/search', 'BlogController@search')->name('blog-search');


Route::get('blog/{slug}', 'BlogController@details')->name('blog-detail');


Route::get('/blog/category/{blog}', 'BlogController@categories')->name('blog-category');


Route::get('/company-change-message-status', 'CompanyMessagesController@change_message_status')->name('company-change-message-status');

Route::get('/seeker-change-message-status', 'Job\SeekerSendController@change_message_status')->name('seeker-change-message-status');


Route::get('/sitemap', 'SitemapController@index');


Route::get('/sitemap/companies', 'SitemapController@companies');


Route::get('job8', 'Job8Controller@job8')->name('job8');

Route::get('cronjob/delete-jobs', 'Job8Controller@delete_jobs')->name('delete-jobs');

Route::get('cronjob/amend-jobs', 'Job8Controller@amend_jobs')->name('amend-jobs');

Route::get('cronjob/set-count-industry', 'Job8Controller@set_count_industry')->name('set_count_industry');

Route::get('cronjob/set-total-count', 'Job8Controller@set_total_count')->name('set_total_count');

Route::get('cronjob/set-total-country', 'Job8Controller@set_count_country')->name('set_count_country');

Route::get('cronjob/set-total-companies', 'Job8Controller@set_count_company')->name('set_count_company');

Route::get('cronjob/set-total-jobType', 'Job8Controller@set_count_jobType')->name('set_count_jobType');

Route::get('cronjob/remove-duplicates', 'Job8Controller@remove_duplicates')->name('remove_duplicates');

Route::get('cronjob/set-count-company', 'Job8Controller@set_count_company')->name('set_count_company');

Route::get('cronjob/remove-duplicate-companies', 'Job8Controller@remove_duplicates')->name('remove-duplicate-companies');

Route::get('cronjob/recover-companies', 'Job8Controller@recover_companies')->name('recover-companies');

Route::get('cronjob/recover-jobs', 'Job8Controller@recover_jobs')->name('recover-jobs');


Route::get('set-location', 'Job8Controller@set_location')->name('set_location');


Route::post('ajax_upload_file', 'FilerController::class@upload')->name('filer.image-upload');

Route::post('ajax_remove_file', 'FilerController::class@fileDestroy')->name('filer.image-remove');


Route::get('/clear-cache', function () {


    $exitCode = Artisan::call('config:clear');


    $exitCode = Artisan::call('cache:clear');


    $exitCode = Artisan::call('config:cache');


    return 'DONE'; //Return anything


});
