@extends('layouts.app')
@section('content')
    <!-- Header start -->
    @include('includes.header')
    <!-- Header end -->
    <!-- Search start -->

    <div class="listpgWraper service-view">
<section id="blog-content">
    <div class="container">
       
        <!-- Blog start -->
        <div class="row">
       

       


            <div class="col-lg-9">

            <?php
            if(!empty($serviceDetails)):
   $data = DB::table('service_categories')->where('id', $serviceDetails->category_id)->get();
   $cate_array = array();
   foreach ($data as $cat) {
       $cate_array[] = "<a href='" . url('/service/category/') . "/" . $cat->id . "'>$cat->name</a>";
   }
   ?>


                <!-- Blog List start -->
                <div class="blogWraper">
                    <ul class="blogList">
                        <li>
                            <div class="bloginner">


                                <div class="postimg">
                                @if(!empty($serviceDetails->image))
                                            <img  src="{{ asset('service/' . $serviceDetails->image) }}"  alt=""> 
                                            @else
                                            <img src="{{ asset('company_logos/dontdelete/nologo.png') }}"   alt="no logo">
                                            @endif
                              
                                </div>


                                <div class="post-header">
                                    <h2>{{$serviceDetails->name}}</h2>
                                    <div class="postmeta">Category : {!!implode(', ',$cate_array)!!}</div>
                                </div>
                                <p>{!! $serviceDetails->description !!}</p>


                            </div>
                        </li>

                    </ul>
                </div>

<?php endif;?>
            </div>
			
			 <div class="col-lg-3">
				 
				 <div class="sidebar"> 
          <!-- Search -->
          <div class="widget">
            <h5 class="widget-title">Search</h5>
            <div class="search">
              <form action="{{route('service-search')}}" method="GET">
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
    </div>
</section>
</div>


    <!-- Search End -->

@endsection
@push('scripts')

@endpush
