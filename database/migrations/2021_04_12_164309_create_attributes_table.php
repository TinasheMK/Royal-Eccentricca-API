<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateAttributesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('attributes', function (Blueprint $table) {
            $table->id();
            $table->string('code')->nullable();
            $table->string('name')->nullable();
            $table->smallInteger('frontend_type')->nullable();
            $table->boolean('is_filterable')->default(false);
            $table->boolean('is_required')->default(false);

            // $table->foreignId('shop_id')->references('id')->on('shops')->onDelete('cascade');
            // $table->string('media_link');
            // $table->string('location');
            // $table->bigInteger('product_id')->nullable();
            // $table->unsignedBigInteger('user_id');
            //$table->boolean('is_active')->default(false);
            //$table->float('rating')->nullable();
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
        Schema::dropIfExists('attributes');
    }
}
