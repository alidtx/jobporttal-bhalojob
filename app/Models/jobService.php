<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

use Illuminate\Database\Eloquent\Relations\BelongsTo;

class jobService extends Model
{
    use HasFactory;


    public function category()
    {
        return $this->belongsTo(\App\Models\ServiceCategory::class,'category_id', 'id');
    }
}
