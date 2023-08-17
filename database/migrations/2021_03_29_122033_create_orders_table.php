<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateOrdersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('orders', function (Blueprint $table) {
            $table->id();
            $table->string('order_number');
            $table->foreignId('user_id')->references('id')->on('users')->onDelete('cascade');
            $table->smallInteger('status');
            $table->Integer('item_count');
            $table->float('grand_total');
            $table->boolean('is_paid')->default(false);
            $table->smallInteger('payment_method');
            $table->string('shipping_fullname');
            $table->string('shipping_adress');
            $table->string('shipping_city');
            $table->string('shipping_state');
            $table->smallInteger('shipping_type');
            $table->smallInteger('shipping_zipcode');
            $table->string('shipping_phone');
            $table->text('notes');

            $table->string('billing_fullname');
            $table->string('billing_adress');
            $table->string('billing_city');
            $table->string('billing_state');
            $table->string('billing_zipcode');
            $table->string('billing_phone');

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
        Schema::dropIfExists('orders');
    }
}
