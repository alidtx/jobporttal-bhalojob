<?php
$lang = config('default_lang');
if (isset($faq)) {
    $lang = $faq->lang;
}


$lang = MiscHelper::getLang($lang);
$direction = MiscHelper::getLangDirection($lang);
$queryString = MiscHelper::getLangQueryStr();

$faqdata = \App\Models\Faqcategory::all();
//$faqss = \App\Models\Faqcategory::find($faq->category_id);





?>
{!! APFrmErrHelp::showErrorsNotice($errors) !!}
@include('flash::message')
<div class="form-body">

    

    <div class="form-group {!! APFrmErrHelp::hasError($errors, 'lang') !!}">
        {!! Form::label('lang', 'Language', ['class' => 'bold']) !!}
        {!! Form::select('lang', ['' => 'Select Language'] + $languages, $lang, [
            'class' => 'form-control',
            'id' => 'lang',
            'onchange' => 'setLang(this.value)',
        ]) !!}
        {!! APFrmErrHelp::showErrors($errors, 'lang') !!}
    </div>

    <div class="form-group {!! APFrmErrHelp::hasError($errors, 'lang') !!}">

        <label for="inputEmail4">Category</label>
        <select name="category_id" id="" class="form-control">
            <option selected disabled>Select</option>
            @foreach ($faqdata as $each)
                <option @if (!empty($faq->category_id) && $faq->category_id === $each->id) selected='selected' @endif value="{{ $each->id }}">
                    {{ $each->category_name }}</option>
            @endforeach
        </select>

    </div>


    <div class="form-group {!! APFrmErrHelp::hasError($errors, 'faq_question') !!}">
        {!! Form::label('faq_question', 'Question', ['class' => 'bold']) !!}
        {!! Form::textarea('faq_question', null, [
            'class' => 'form-control',
            'id' => 'faq_question',
            'placeholder' => 'Question',
        ]) !!}
        {!! APFrmErrHelp::showErrors($errors, 'faq_question') !!}
    </div>
    <div class="form-group {!! APFrmErrHelp::hasError($errors, 'faq_answer') !!}">
        {!! Form::label('faq_answer', 'Answer', ['class' => 'bold']) !!}
        {!! Form::textarea('faq_answer', null, [
            'class' => 'form-control',
            'id' => 'faq_answer',
            'placeholder' => 'Answer',
        ]) !!}
        {!! APFrmErrHelp::showErrors($errors, 'faq_answer') !!}
    </div>
    <div class="form-actions">
        {!! Form::button('Update <i class="fa fa-arrow-circle-right" aria-hidden="true"></i>', [
            'class' => 'btn btn-large btn-primary',
            'type' => 'submit',
        ]) !!}
    </div>
</div>
@push('scripts')
    <script type="text/javascript">
        function setLang(lang) {
            window.location.href = "<?php echo url(Request::url()) . $queryString; ?>" + lang;
        }
    </script>
    @include('admin.shared.tinyMCE')
@endpush
