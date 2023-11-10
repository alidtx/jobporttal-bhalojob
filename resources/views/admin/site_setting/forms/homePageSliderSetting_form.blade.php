{!! APFrmErrHelp::showErrorsNotice($errors) !!}
@include('flash::message')
<div class="form-body">
    <fieldset>
        <legend>Home Page :</legend>
        <div class="form-group {!! APFrmErrHelp::hasError($errors, 'is_slider_active') !!}">
            {!! Form::label('is_slider_active', 'Is Home Page Slider active?', ['class' => 'bold']) !!}
            <div class="radio-list">
                <label class="radio-inline">{!! Form::radio('is_slider_active', 1, null, ['id' => 'is_slider_active_yes']) !!} Yes </label>
                <label class="radio-inline">{!! Form::radio('is_slider_active', 0, true, ['id' => 'is_slider_active_no']) !!} No </label>
            </div>
            {!! APFrmErrHelp::showErrors($errors, 'is_slider_active') !!}
        </div>        
    </fieldset>

    <div  class="row">
        <div class="col-md-12">
            <div class="form-group {!! APFrmErrHelp::hasError($errors, 'user_reviews_title') !!}">
                {!! Form::label('user_reviews_title', 'Statistics title', ['class' => 'bold']) !!}
                {!! Form::text('user_reviews_title', null, array('class'=>'form-control', 'id'=>'user_reviews_title', 'placeholder'=>'user reviews title')) !!}
                {!! APFrmErrHelp::showErrors($errors, 'user_reviews_title') !!}
            </div>

        </div>
        <div class="col-md-12">
            <div class="form-group {!! APFrmErrHelp::hasError($errors, 'user_reviews_short_title') !!}">
                {!! Form::label('user_reviews_short_title', 'Statistics short title', ['class' => 'bold']) !!}
                {!! Form::text('user_reviews_short_title', null, array('class'=>'form-control', 'id'=>'user_reviews_short_title', 'placeholder'=>'user reviews short title')) !!}
                {!! APFrmErrHelp::showErrors($errors, 'user_reviews_short_title') !!}
            </div>

        </div>

    </div>

</div>
