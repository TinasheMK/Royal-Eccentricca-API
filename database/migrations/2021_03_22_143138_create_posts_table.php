<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePostsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('posts', function (Blueprint $table) {
            $table->id();
            $table->string('title')->nullable();
            $table->text('caption')->nullable();
            $table->foreignId('shop_id')->references('id')->on('shops')->onDelete('cascade');
            $table->string('media_link');
            $table->string('location');
            $table->bigInteger('product_id')->nullable();
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
        Schema::dropIfExists('posts');
    }
}
