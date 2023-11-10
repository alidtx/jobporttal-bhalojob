<?php

Route::post('filter-default-cities-dropdown', 'AjaxController@filterDefaultCities')->name('filter.default.cities.dropdown');
Route::post('filter-default-states-dropdown', 'AjaxController@filterDefaultStates')->name('filter.default.states.dropdown');
Route::post('filter-default-sub-category-dropdown', 'AjaxController@filterSubCategory')->name('filter.default.sub.category.dropdown');
Route::post('filter-default-industry-dropdown', 'AjaxController@filterIndustry')->name('filter.default.industry.dropdown');
Route::post('filter-lang-cities-dropdown', 'AjaxController@filterLangCities')->name('filter.lang.cities.dropdown');
Route::post('filter-lang-cities-dropdown-bd', 'AjaxController@filterLangCitiesDB')->name('filter.lang.cities.dropdown.bd');
Route::post('filter-lang-states-dropdown', 'AjaxController@filterLangStates')->name('filter.lang.states.dropdown');
Route::post('filter-cities-dropdown', 'AjaxController@filterCities')->name('filter.cities.dropdown');
Route::post('filter-states-dropdown', 'AjaxController@filterStates')->name('filter.states.dropdown');
Route::post('filter-degree-types-dropdown', 'AjaxController@filterDegreeTypes')->name('filter.degree.types.dropdown');

Route::get('ajax-subcat', 'AjaxController@ajaxSubcat')->name('ajax.subcat');

Route::post('filter-lang-states-dropdown-bd', 'AjaxController@filterLangStatesbd')->name('filter.lang.states.dropdown.bd');
