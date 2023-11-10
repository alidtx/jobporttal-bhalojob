<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateLanguageConvertsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('language_converts', function (Blueprint $table) {
            $table->id();
            $table->integer('user_id');
            $table->json('personal_information')->nullable();
            $table->json('education_history')->nullable();
            $table->json('working_experience')->nullable();
            $table->json('language_certification')->nullable();
            $table->json('other_certification')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('language_converts');
    }
}
