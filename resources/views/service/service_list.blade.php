@extends('layouts.app')
@section('content')
    <!-- Header start -->
    @include('includes.header')
    <!-- Header end -->

    {{-- Bhalojob Service --}}

    {{-- ('jdc', $jdc)
    ->with('fop', $fop)
    ->with('fhrj', $fhrj)
    ->with('fsj', $fsj) --}}
    <div class="our-service">

    






<div class="listpgWraper">
<section id="blog-content">
    <div class="container">

        <!-- Blog start -->
        <div class="row">
            <div class="col-lg-9">
                <!-- Blog List start -->
                <div class="blogwrapper">
                    <ul class="blogList row">
                        @if(null!==($serviceLists))
                        <?php
                        $count = 1;
                       
                        ?>
                        @foreach($serviceLists as $blog)
                        <?php
                       
                     
                     
                        $data = DB::table('service_categories')->where('id', $blog->category_id)->get();
                      
                        $cate_array = array();
                        foreach ($data as $cat) {
                            $cate_array[] = "<a href='" . url('/service/category/') . "/" . $cat->id . "'>$cat->name</a>";
                        }
                     
                        ?>
                        <li class="col-lg-6">
                            <div class="bloginner">
                                <div class="postimg">
                                @if(!empty($blog->image))
                                            <img  src="{{ asset('service/' . $blog->image) }}"  alt=""> 
                                            @else
                                            <img src="{{ asset('company_logos/dontdelete/nologo.png') }}"   alt="no logo">
                                            @endif


                               
                                </div>

                                <div class="post-header">
                                    <!-- <h4><a href="{{route('service-view',$blog->id)}}">{{$blog->name}}</a></h4> -->
                                    <h4><a href="{{route('service-view',$blog->id)}}"> add service name </a></h4>
                                    <div class="postmeta">Category : {!!implode(', ',$cate_array)!!}
                                    </div>
                                </div>
                                <p>{!! \Illuminate\Support\Str::limit($blog->description, $limit = 150, $end = '...') !!}</p>

                            </div>
                        </li>

                        
                        <?php $count++; ?>
                        @endforeach
                        @endif

                    </ul>
                </div>

                <!-- Pagination -->
                <div class="pagiWrap">
                    <nav aria-label="Page navigation example">
                        @if(isset($serviceLists) && count($serviceLists))
                        {{ $serviceLists->appends(request()->query())->links() }} @endif
                    </nav>
                </div>
            </div>
			 <div class="col-lg-3">
				 
				 <div class="sidebar"> 
          <!-- Search -->
          <div class="widget">
            <h5 class="widget-title">Search</h5>
            <div class="search">
              <form action="{{route('blog-search')}}" method="GET">
                <input type="text" class="form-control" placeholder="Search" name="search">
                <button type="submit" class="btn"><i class="fa fa-search"></i></button>
              </form>
            </div>
          </div>
          <!-- Categories -->
          @if(null!==($serviceCategory))
          <div class="widget">
            <h5 class="widget-title">Categories</h5>
            <ul class="categories">
            @foreach($serviceCategory as $category)
              <li><a href="{{url('/service/category/').'/'.$category->id}}">{{$category->name}}</a></li>
            @endforeach
            <li><a href="{{url('service-list')}}">All Service</a></li>
            </ul>
          </div>
          @endif
        </div>
			</div>
        </div>
		<div class="py-5"></div>
    </div>
</section>

</div>





@endsection
@push('scripts')

@endpush