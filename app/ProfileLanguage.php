<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ProfileLanguage extends Model
{

    protected $table = 'profile_languages';
    public $timestamps = true;
    protected $guarded = ['id'];
    //protected $dateFormat = 'U';
    protected $dates = ['created_at', 'updated_at'];

    public function user()
    {
        return $this->belongsTo('App\User', 'user_id', 'id');
    }


    public function getUser($field = '')
    {
        if (null !== $user = $this->user()->first()) {
            if (empty($field))
                return $user;
            else
                return $user->$field;
        } else {
            return '';
        }
    }

    public function entrance()
    {
        return $this->belongsTo('App\Models\Year', 'entrance_year', 'id');
    }

    public function getEntrance($field = ''){
        if (null !== $entrance = $this->entrance()->first()) {
            if (empty($field))
                return $entrance;
            else
                return $entrance->$field;
        } else {
            return '';
        }
    }

    public function pass()
    {
        return $this->belongsTo('App\Models\Year', 'pass_year', 'id');
    }
    public function getPass($field = ''){
        if (null !== $pass = $this->pass()->first()) {
            if (empty($field))
                return $pass;
            else
                return $pass->$field;
        } else {
            return '';
        }
    }


    public function language()
    {
        return $this->belongsTo('App\Language', 'language_id', 'id');
    }

    public function getLanguage($field = '')
    {
        if (null !== $language = $this->language()->first()) {
            if (empty($field))
                return $language;
            else
                return $language->$field;
        } else {
            return '';
        }
    }

    public function languageLevel()
    {
        return $this->belongsTo('App\LanguageLevel', 'language_level_id', 'id');
    }

    public function getLanguageLevel($field = '')
    {
        $languageLevel = $this->languageLevel()->first();
        if (null === $languageLevel) {
            $languageLevel = $this->languageLevel()->first();
        }
        if (null !== $languageLevel) {
            if (empty($field))
                return $languageLevel;
            else
                return $languageLevel->$field;
        } else {
            return '';
        }
    }

    


    public function languageType()
    {
        return $this->belongsTo('App\Models\LanguageType', 'language_type_id', 'id');
    }
    public function getLanguageType($field = ''){
        if (null !== $pass = $this->languageType()->first()) {
            if (empty($field))
                return $pass;
            else
                return $pass->$field;
        } else {
            return '';
        }
    }




}
