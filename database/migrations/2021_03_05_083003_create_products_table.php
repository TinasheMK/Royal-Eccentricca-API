<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProductsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('products', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('name');
            $table->string('brand')->nullable();
            $table->string('sku')->nullable();
            $table->string('slug')->nullable();
            $table->integer('quantity')->nullable();
            $table->float('weight')->nullable();
            $table->foreignId('shop_id')->references('id')->on('shops')->onDelete('cascade');
            $table->string('description');
            $table->string('full_specs')->nullable;
            $table->float('price');
            $table->float('sale_price')->nullable();
            $table->integer('rating')->nullable();
            $table->boolean('status')->default(true);
            $table->boolean('featured')->default(false);
            $table->string('cover_img')->nullable();
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
        Schema::dropIfExists('products');
    }
}
