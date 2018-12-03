<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateCostsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('costs', function (Blueprint $table) {
            $table->increments('id');
            $table->decimal('Amount', 10, 2);
            $table->unsignedInteger('Cost_Type_ID');
            $table->unsignedInteger('Project_ID');
            $table->foreign('Cost_Type_ID')->references('id')->on('cost_types')->onDelete('cascade');
            $table->foreign('Project_ID')->references('id')->on('projects')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('costs');
    }
}
