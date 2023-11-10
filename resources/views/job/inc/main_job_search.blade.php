@php
    //$jobcategoryJob = App\Models\jobSubCategory::select('id', 'sub_name as name')->where("category_id",1)->get();

    $city = App\City::select('id', 'city as name')->get();
    $jobSeekerSubcategory = App\Models\jobSubCategory::select('id', 'sub_name as name')->where("category_id",1)->get();
    $jobcategoryStudent = App\Models\jobSubCategory::select('id', 'sub_name as name')->where("category_id",2)->get();
    $jobcategoryEmployee = App\Models\jobSubCategory::select('id', 'sub_name as name')->where("category_id",3)->get();

   // $jobCategoryList = App\Models\jobCategory::get();
    $subcategories = App\Models\jobIndustry::select('job_industries.*',  'industries.id as industries_id', 'industries.industry')


            ->join('industries', 'industries.id', '=', 'job_industries.industry_id')

            ->get();


@endphp



@if(\Route::currentRouteName()=="index")
    <div class="banner-bottom">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                <div class="banner-bottom-main">
                <div class="cycle-tab-container">
                    <ul class="nav nav-tabs">
                        <li class="cycle-tab-item">
                            <a class=" active nav-link job" role="tab" data-toggle="tab" href="#job"> 求職者 </a>
                        </li>
                        <li class="cycle-tab-item">
                            <a class="nav-link student" role="tab" data-toggle="tab" href="#student"> 学生 </a>
                        </li>
                        <li class="cycle-tab-item">
                            <a class="nav-link employer" role="tab" data-toggle="tab" href="#employer"> 企業向け
                            </a>
                        </li>
                    </ul>


                    <div class="tab-content">

                        <div class="tab-pane fade active in" id="job" role="tabpanel" aria-labelledby="home-tab">
                            <form action="{{ route('job.list') }}" method="get">
                                <input type="hidden" name="search" value=""/>
                                <div class="select-and-search">
                                    <div class="form-group">
                                        <select class="form-select select-category category_id"
                                                onchange="changeCategory(this.value,1)" name="sub_category_id[]"
                                                id="category" aria-label="Default select example">
                                                
                                            <option class="select"> カテゴリー選択し <span style="font-size: 13px !important;"> てください</span></option>
                                            @foreach ($jobSeekerSubcategory as $cat)
                                                <option value="{{ $cat->id }}" {{ (isset($sub_category_id[0]) && $sub_category_id[0] == $cat->id) ? 'selected' : '' }} >{{ $cat->name }}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <select class="form-select select-subject subcategory subcategory_id"
                                                name="industry_id[]" id="subcategory"
                                                aria-label="Default select example">
                                            <option class="select"> 業種　選択してください </span></option>
                                            @foreach($subcategories as $item)
                                                <option value="{{$item->id}}"{{ (isset($industry_ids[0]) && $industry_ids[0] == $item->id) ? 'selected' : '' }}>{{$item->industry}}</option>
                                            @endforeach


                                        </select>
                                    </div>

                                    <div class="form-group">
                                        <select name="city_id[]" class="form-select select-place place_id"
                                                aria-label="Default select example">
                                            <option value="" selected>  エリア　選択してください </option>
                                            @foreach ($city as $ct)
                                                <option value="{{ $ct->id }}" {{ (isset($city_ids[0]) && $city_ids[0] == $ct->id) ? 'selected' : '' }}>{{ $ct->name }}</option>
                                            @endforeach
                                        </select>
                                    </div>

                                    <div class="search-button">
                                        @auth
                                            <button type="submit" class="btn"> 検索 <i class="fa fa-search"
                                                                                         aria-hidden="true"></i>
                                            </button>

                                        @else
                                            <button type="button" class="btn  login_alart">
                                             検索 <i class="fa fa-search" aria-hidden="true"></i>
                                            </button>
                                        @endauth

                                    </div>
                                </div>
                            </form>
                        </div>

                        <!--                    Job Seeker end-->
                        <div class="tab-pane fade" id="student" role="tabpanel" aria-labelledby="profile-tab">
                            <form action="{{ route('job.list') }}" method="get">
                                <input type="hidden" name="search" value=""/>
                                <div class="select-and-search">
                                    <div class="form-group">
                                        <select class="form-select select-category"
                                                onchange="changeCategory(this.value,2)" name="category[]"
                                                aria-label="Default select example">
                                            <option selected> カテゴリー選択してください </option>
                                            @foreach ($jobcategoryStudent as $cat)
                                                <option value="{{ $cat->id }}" {{ (isset($sub_category_id[0]) && $sub_category_id[0] == $cat->id) ? 'selected' : '' }} >{{ $cat->name }}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <select class="form-select select-subject subcategory" name="industry_id[]"
                                                id="subcategory"
                                                aria-label="Default select example">
                                            <option selected> 業種　選択してください </option>
                                            @foreach($subcategories as $item)
                                                <option value="{{$item->id}}"{{ (isset($industry_ids[0]) && $industry_ids[0] == $item->id) ? 'selected' : '' }}>{{$item->industry}}</option>
                                            @endforeach

                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <select name="city_id[]" class="form-select select-place"
                                                aria-label="Default select example">
                                            <option value="" selected> エリア　選択してください </option>
                                            @foreach ($city as $ct)
                                                <option value="{{ $ct->id }}" {{ (isset($city_ids[0]) && $city_ids[0] == $ct->id) ? 'selected' : '' }}>{{ $ct->name }}</option>
                                            @endforeach
                                        </select>
                                    </div>

                                    <div class="search-button">
                                        @auth
                                            <button type="submit" class="btn"> 検索 <i class="fa fa-search"
                                                                                         aria-hidden="true"></i>
                                            </button>

                                        @else
                                            <button type="button" class="btn  login_alart">
                                            検索 <i class="fa fa-search"
                                                                                         aria-hidden="true"></i>
                                            </button>
                                        @endauth
                                    </div>
                                </div>
                            </form>
                        </div>


                        <!--                        Student end-->
                        <div class="tab-pane fade" id="employer" role="tabpanel" aria-labelledby="messages-tab">
                            <form action="{{ route('job.list') }}" method="get">
                                <input type="hidden" name="search" value="search"/>
                                <div class="select-and-search">
                                    <div class="form-group">
                                        <select class="form-select select-category"
                                                onchange="changeCategory(this.value,3)" name="category[]"
                                                aria-label="Default select example">
                                            <option value="" selected> カテゴリー選択してください </option>
                                            @foreach ($jobcategoryEmployee as $cat)
                                                <option value="{{ $cat->id }}" {{ (isset($sub_category_id[0]) && $sub_category_id[0] == $cat->id) ? 'selected' : '' }} >{{ $cat->name }}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <select class="form-select select-subject subcategory" name="industry_id[]"
                                                id="subcategory"
                                                aria-label="Default select example">
                                            <option selected> 業種　選択してください </option>
                                            @foreach($subcategories as $item)
                                                <option value="{{$item->id}}"{{ (isset($industry_ids[0]) && $industry_ids[0] == $item->id) ? 'selected' : '' }}>{{$item->industry}}</option>
                                            @endforeach

                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <select name="city_id[]" class="form-select select-place"
                                                aria-label="Default select example">
                                            <option value="" selected> エリア　選択してください </option>
                                            @foreach ($city as $ct)
                                                <option value="{{ $ct->id }}" {{ (isset($city_ids[0]) && $city_ids[0] == $ct->id) ? 'selected' : '' }}>{{ $ct->name }}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                    <div class="search-button">

                                        @auth
                                            <button type="submit" class="btn"> 検索 <i class="fa fa-search"
                                                                                         aria-hidden="true"></i>
                                            </button>

                                        @else
                                            <button type="button" class="btn  login_alart">
                                            検索 <i class="fa fa-search"
                                                                                         aria-hidden="true"></i>
                                            </button>
                                        @endauth
                                    </div>
                                </div>
                            </form>
                            <!--                        Employer end-->
                        </div>


                    </div>

                </div>
            </div>
                </div>
            </div>
        </div>
    </div>
@else
    <div class="container" style="display:none">
        <div class="pageSearch">


            <div class="banner-bottom">
                <div class="container">
                    <div class="banner-bottom-main">
                        <div class="cycle-tab-container">
                            <ul class="nav nav-tabs">
                                <li class="cycle-tab-item">
                                    <a class=" active nav-link job" role="tab" data-toggle="tab" href="#job"> 求職者 </a>
                                </li>
                                <li class="cycle-tab-item">
                                    <a class="nav-link student" role="tab" data-toggle="tab" href="#student">
                                    学生 </a>
                                </li>
                                <li class="cycle-tab-item">
                                    <a class="nav-link employer" role="tab" data-toggle="tab" href="#employer"> 企業向け
                                    </a>
                                </li>
                            </ul>


                            <div class="tab-content">

                                <div class="tab-pane fade active in" id="job" role="tabpanel"
                                     aria-labelledby="home-tab">
                                    <form action="{{ route('job.list') }}" method="get">
                                        <input type="hidden" name="search" value=""/>
                                        <div class="select-and-search">
                                            <div class="form-group">
                                                <select class="form-select select-category category_id"
                                                        onchange="changeCategory(this.value,1)" name="sub_category_id[]"
                                                        id="category" aria-label="Default select example">
                                                    <option class="select">カテゴリー選択してください</option>
                                                    @foreach ($jobSeekerSubcategory as $cat)
                                                        <option value="{{ $cat->id }}" {{ (isset($sub_category_id[0]) && $sub_category_id[0] == $cat->id) ? 'selected' : '' }} >{{ $cat->name }}</option>
                                                    @endforeach
                                                </select>
                                            </div>
                                            <div class="form-group">
                                                <select class="form-select select-subject subcategory subcategory_id"
                                                        name="industry_id[]" id="subcategory"
                                                        aria-label="Default select example">
                                                    <option class="select"> 業種選択してください </option>
                                                    @foreach($subcategories as $item)
                                                        <option value="{{$item->id}}"{{ (isset($industry_ids[0]) && $industry_ids[0] == $item->id) ? 'selected' : '' }}>{{$item->industry}}</option>
                                                    @endforeach


                                                </select>
                                            </div>

                                            <div class="form-group">
                                                <select name="city_id[]" class="form-select select-place place_id"
                                                        aria-label="Default select example">
                                                    <option value="" selected> エリア選択してください </option>
                                                    @foreach ($city as $ct)
                                                        <option value="{{ $ct->id }}" {{ (isset($city_ids[0]) && $city_ids[0] == $ct->id) ? 'selected' : '' }}>{{ $ct->name }}</option>
                                                    @endforeach
                                                </select>
                                            </div>

                                            <div class="search-button">
                                                @auth
                                                    <button type="submit" class="btn"> 検索 <i class="fa fa-search"
                                                                                                 aria-hidden="true"></i>
                                                    </button>

                                                @else
                                                    <button type="button" class="btn  login_alart">
                                                    検索 <i class="fa fa-search"
                                                                                                 aria-hidden="true"></i>
                                                    </button>
                                                @endauth

                                            </div>
                                        </div>
                                    </form>
                                </div>

                                <!--                    Job Seeker end-->
                                <div class="tab-pane fade" id="student" role="tabpanel" aria-labelledby="profile-tab">
                                    <form action="{{ route('job.list') }}" method="get">
                                        <input type="hidden" name="search" value=""/>
                                        <div class="select-and-search">
                                            <div class="form-group">
                                                <select class="form-select select-category"
                                                        onchange="changeCategory(this.value,2)" name="category[]"
                                                        aria-label="Default select example">
                                                    <option selected>カテゴリー選択してください</option>
                                                    @foreach ($jobcategoryStudent as $cat)
                                                        <option value="{{ $cat->id }}" {{ (isset($sub_category_id[0]) && $sub_category_id[0] == $cat->id) ? 'selected' : '' }} >{{ $cat->name }}</option>
                                                    @endforeach
                                                </select>
                                            </div>
                                            <div class="form-group">
                                                <select class="form-select select-subject subcategory"
                                                        name="industry_id[]"
                                                        id="subcategory"
                                                        aria-label="Default select example">
                                                    <option selected>業種選択してください </option>
                                                    @foreach($subcategories as $item)
                                                        <option value="{{$item->id}}"{{ (isset($industry_ids[0]) && $industry_ids[0] == $item->id) ? 'selected' : '' }}>{{$item->industry}}</option>
                                                    @endforeach

                                                </select>
                                            </div>
                                            <div class="form-group">
                                                <select name="city_id[]" class="form-select select-place"
                                                        aria-label="Default select example">
                                                    <option value="" selected> エリア選択してください </option>
                                                    @foreach ($city as $ct)
                                                        <option value="{{ $ct->id }}" {{ (isset($city_ids[0]) && $city_ids[0] == $ct->id) ? 'selected' : '' }}>{{ $ct->name }}</option>
                                                    @endforeach
                                                </select>
                                            </div>

                                            <div class="search-button">
                                                @auth
                                                    <button type="submit" class="btn"> 検索 <i class="fa fa-search"
                                                                                                 aria-hidden="true"></i>
                                                    </button>

                                                @else
                                                    <button type="button" class="btn  login_alart">
                                                    検索 <i class="fa fa-search"
                                                                                                 aria-hidden="true"></i>
                                                    </button>
                                                @endauth
                                            </div>
                                        </div>
                                    </form>
                                </div>


                                <!--                        Student end-->
                                <div class="tab-pane fade" id="employer" role="tabpanel" aria-labelledby="messages-tab">
                                    <form action="{{ route('job.list') }}" method="get">
                                        <input type="hidden" name="search" value="search"/>
                                        <div class="select-and-search">
                                            <div class="form-group">
                                                <select class="form-select select-category"
                                                        onchange="changeCategory(this.value,3)" name="category[]"
                                                        aria-label="Default select example">
                                                    <option value="" selected> カテゴリー選択してください </option>
                                                    @foreach ($jobcategoryEmployee as $cat)
                                                        <option value="{{ $cat->id }}" {{ (isset($sub_category_id[0]) && $sub_category_id[0] == $cat->id) ? 'selected' : '' }} >{{ $cat->name }}</option>
                                                    @endforeach
                                                </select>
                                            </div>
                                            <div class="form-group">
                                                <select class="form-select select-subject subcategory"
                                                        name="industry_id[]"
                                                        id="subcategory"
                                                        aria-label="Default select example">
                                                    <option selected> 業種選択してください </option>
                                                    @foreach($subcategories as $item)
                                                        <option value="{{$item->id}}"{{ (isset($industry_ids[0]) && $industry_ids[0] == $item->id) ? 'selected' : '' }}>{{$item->industry}}</option>
                                                    @endforeach

                                                </select>
                                            </div>
                                            <div class="form-group">
                                                <select name="city_id[]" class="form-select select-place"
                                                        aria-label="Default select example">
                                                    <option value="" selected> エリア選択してください </option>
                                                    @foreach ($city as $ct)
                                                        <option value="{{ $ct->id }}" {{ (isset($city_ids[0]) && $city_ids[0] == $ct->id) ? 'selected' : '' }}>{{ $ct->name }}</option>
                                                    @endforeach
                                                </select>
                                            </div>
                                            <div class="search-button">

                                                @auth
                                                    <button type="submit" class="btn"> 検索 <i class="fa fa-search"
                                                                                                 aria-hidden="true"></i>
                                                    </button>

                                                @else
                                                    <button type="button" class="btn  login_alart">
                                                    検索 <i class="fa fa-search"
                                                                                                 aria-hidden="true"></i>
                                                    </button>
                                                @endauth
                                            </div>
                                        </div>
                                    </form>
                                    <!--                        Employer end-->
                                </div>

                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endif


<script type="application/javascript">


    function seekersearchjob() {
        var category_id = $('.category_id').val();
        // alert(32)
        var subcategory_id = $('.subcategory_id').val();
        var place_id = $('.place_id').val();


        $.ajax({
            // url:'/settings/profile',
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            },
            url: '/searchingJob',
            method: 'POST',
            data: {

                "category_id": category_id,
                "subcategory_id": subcategory_id,
                "place_id": place_id
            },
            success: function (bolUpdated) {
                if (bolUpdated) {
                    window.location.href = "/jobs";
                }
            },
            fail: function () {
                alert('NO');
            }
        });


    }

    function changeCategory(id, job_type_user) {
        // e.preventDefault();
        //al function ok

        var category_id = id;
        var job_user_type = job_type_user;
        // alert(job_user_type)
        // console.log(cat_id);
        //ajax
        $.get('{{ route('ajax.subcat') }}', {
            category_id: category_id,
            job_user_type: job_user_type,

            _method: 'GET'

        }, function (data) {
            //success data
            console.log(data);
            var subcat = $('.subcategory').empty();
            $.each(data, function (create, subcatObj) {

                // console.log(subcatObj);
                // alert(subcatObj.sub_name);
                var option = $('<option/>', {
                    id: create,
                    value: subcatObj
                });
                subcat.append('<option  value ="' + subcatObj.id + '">' + subcatObj
                        .industry +
                    '</option>');
            });
        });


    }
</script>