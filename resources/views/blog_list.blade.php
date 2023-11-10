@extends('layouts.app')
@section('content')
    <!-- Header start -->
    @include('includes.header')
    <!-- Header end -->
    <!-- Inner Page Title start -->
    @include('includes.inner_page_title', ['page_title'=>__('Blog')])
    <!-- Inner Page Title end -->



    <section class="blog-list">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="section-title">
                        <h4> Blog List </h4>
                    </div>
                </div>
                <div class="col-md-12 mb-3">
                    <div class="card">
                        <div class="card-body">
                            <div class="date">
                                <p> 12-12-2022 </p>
                            </div>
                            <div class="content">
                                <a href="#"> <h4> laboriosam dolore dolorem obcaecati quo ducimus </h4> </a>
                                <article>
                                    <p> Lorem ipsum dolor sit amet consectetur adipisicing elit. Accusamus 
                                        repellendus nostrum laboriosam dolore dolorem obcaecati quo ducimus 
                                        vel quibusdam odio provident voluptas doloribus, aspernatur ad in omnis 
                                        Pariatur corporis quae non voluptatibus ipsum enim, atque eligendi molestiae 
                                        earum ratione asperiores eius beatae fugit itaque facere aliquam excepturi 
                                        sed aperiam? Dolore at odio optio nemo asperiores debitis deleniti. </p>
                                </article>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-12 mb-3">
                    <div class="card">
                        <div class="card-body">
                            <div class="date">
                                <p> 12-12-2022 </p>
                            </div>
                            <div class="content">
                                <a href="#"> <h4> laboriosam dolore dolorem obcaecati quo ducimus </h4> </a>
                                <article>
                                    <p> Lorem ipsum dolor sit amet consectetur adipisicing elit. Accusamus 
                                        repellendus nostrum laboriosam dolore dolorem obcaecati quo ducimus 
                                        vel quibusdam odio provident voluptas doloribus, aspernatur ad in omnis 
                                        Pariatur corporis quae non voluptatibus ipsum enim, atque eligendi molestiae 
                                        earum ratione asperiores eius beatae fugit itaque facere aliquam excepturi 
                                        sed aperiam? Dolore at odio optio nemo asperiores debitis deleniti. </p>
                                </article>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-12 mb-3">
                    <div class="card">
                        <div class="card-body">
                            <div class="date">
                                <p> 12-12-2022 </p>
                            </div>
                            <div class="content">
                                <a href="#"> <h4> laboriosam dolore dolorem obcaecati quo ducimus </h4> </a>
                                <article>
                                    <p> Lorem ipsum dolor sit amet consectetur adipisicing elit. Accusamus 
                                        repellendus nostrum laboriosam dolore dolorem obcaecati quo ducimus 
                                        vel quibusdam odio provident voluptas doloribus, aspernatur ad in omnis 
                                        Pariatur corporis quae non voluptatibus ipsum enim, atque eligendi molestiae 
                                        earum ratione asperiores eius beatae fugit itaque facere aliquam excepturi 
                                        sed aperiam? Dolore at odio optio nemo asperiores debitis deleniti. </p>
                                </article>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-12 mb-3">
                    <div class="card">
                        <div class="card-body">
                            <div class="date">
                                <p> 12-12-2022 </p>
                            </div>
                            <div class="content">
                                <a href="#"> <h4> laboriosam dolore dolorem obcaecati quo ducimus </h4> </a>
                                <article>
                                    <p> Lorem ipsum dolor sit amet consectetur adipisicing elit. Accusamus 
                                        repellendus nostrum laboriosam dolore dolorem obcaecati quo ducimus 
                                        vel quibusdam odio provident voluptas doloribus, aspernatur ad in omnis 
                                        Pariatur corporis quae non voluptatibus ipsum enim, atque eligendi molestiae 
                                        earum ratione asperiores eius beatae fugit itaque facere aliquam excepturi 
                                        sed aperiam? Dolore at odio optio nemo asperiores debitis deleniti. </p>
                                </article>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-12 mb-3">
                    <div class="card">
                        <div class="card-body">
                            <div class="date">
                                <p> 12-12-2022 </p>
                            </div>
                            <div class="content">
                                <a href="#"> <h4> laboriosam dolore dolorem obcaecati quo ducimus </h4> </a>
                                <article>
                                    <p> Lorem ipsum dolor sit amet consectetur adipisicing elit. Accusamus 
                                        repellendus nostrum laboriosam dolore dolorem obcaecati quo ducimus 
                                        vel quibusdam odio provident voluptas doloribus, aspernatur ad in omnis 
                                        Pariatur corporis quae non voluptatibus ipsum enim, atque eligendi molestiae 
                                        earum ratione asperiores eius beatae fugit itaque facere aliquam excepturi 
                                        sed aperiam? Dolore at odio optio nemo asperiores debitis deleniti. </p>
                                </article>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-12 mb-3">
                    <div class="card">
                        <div class="card-body">
                            <div class="date">
                                <p> 12-12-2022 </p>
                            </div>
                            <div class="content">
                                <a href="#"> <h4> laboriosam dolore dolorem obcaecati quo ducimus </h4> </a>
                                <article>
                                    <p> Lorem ipsum dolor sit amet consectetur adipisicing elit. Accusamus 
                                        repellendus nostrum laboriosam dolore dolorem obcaecati quo ducimus 
                                        vel quibusdam odio provident voluptas doloribus, aspernatur ad in omnis 
                                        Pariatur corporis quae non voluptatibus ipsum enim, atque eligendi molestiae 
                                        earum ratione asperiores eius beatae fugit itaque facere aliquam excepturi 
                                        sed aperiam? Dolore at odio optio nemo asperiores debitis deleniti. </p>
                                </article>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    


@include('includes.footer')
@endsection
@push('styles')
    
@endpush
@push('scripts')
@include('includes.immediate_available_btn')
<script>
</script>
@endpush