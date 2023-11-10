<div class="col-lg-12">
    <div class="sidebar search-bar-header">
        <!-- Search -->
        <div class="widget">
            <h5 class="widget-title">Search</h5>
            <div class="search">
                <form action="{{route('blog-search')}}" method="GET">
                    <input type="text" class="form-control" placeholder="Search" name="search" required>
                    <div class="btn-group">
                        <button type="submit" class="btn search"> search <i class="fa fa-search" aria-hidden="true"></i> </button>
                        <a href="{{route('blogs')}}" class="notice btn"> notice </a>

                    </div>
                </form>
            </div>
        </div>
        <!-- Categories -->
        <div class="widget">
            <h5 class="widget-title"> Frequently searched keywords </h5>
            <div class="categories">
                @foreach($faqcategories as $faqcategory)
                    <a href="{{route('faq_view',$faqcategory->id)}}">{{$faqcategory->category_name}}</a>
                @endforeach


            </div>
        </div>
    </div>
</div>