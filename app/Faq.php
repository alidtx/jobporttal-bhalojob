<?php

namespace App;

use App;
use App\Traits\Lang;
use App\Traits\IsDefault;
use App\Traits\Active;
use App\Traits\Sorted;

use Illuminate\Database\Eloquent\Model;

class Faq extends Model
{

    use Lang;
    use IsDefault;
    use Active;
    use Sorted;

    protected $table = 'faqs';
    public $timestamps = true;
    protected $guarded = ['id'];
    //protected $dateFormat = 'U';
    protected $dates = ['created_at', 'updated_at'];


    public function category(){
      
     
        return $this->belongsTo('App\Models\Faqcategory', 'category_id', 'id');
        
    }


}
