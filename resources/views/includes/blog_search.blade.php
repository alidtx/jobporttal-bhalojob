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
                        <button class="notice btn"> notice </button>
                        <a href="{{route('faqlist')}}" class="faq btn"> FAQ </a>
                    </div>
                </form>
            </div>
        </div>
        <!-- Categories -->
        @if(null!==($categories))
            <div class="widget">
                <h5 class="widget-title"> Frequently searched keywords </h5>
                <div class="categories">
                    @foreach($categories as $category)
                        <a href="{{url('/blog/category/').'/'.$category->slug}}">{{$category->heading}}</a>
                    @endforeach
                </div>
            </div>
        @endif
    </div>
</div>