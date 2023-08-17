<?php

use Illuminate\Http\Request;

use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\FbController;
use App\Http\Controllers\CartController;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\PostController;
use App\Http\Controllers\ShopController;
use App\Http\Controllers\AdminController;
use App\Http\Controllers\LoginController;
use App\Http\Controllers\OrderController;
use App\Http\Controllers\RatingController;
use App\Http\Controllers\WalletController;
use App\Http\Controllers\CommentController;
use App\Http\Controllers\MessageController;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\WishlistController;
use App\Http\Controllers\NotificationController;
use App\Http\Controllers\Auth\GoogleSocialiteController;
use App\Http\Controllers\CategoryController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

//Create invoice api
Route::get('/add-funds/{amount}', [OrderController::class, 'addfunds'])->name('order.received');

//Get balance api
Route::get('/get-balance', [WalletController::class, 'getbalance'])->name('wallet.pay');

Route::get('/product/{product}', [ProductController::class, 'getProduct'])->name('product.details');
Route::get('/product/search/{query}', [ProductController::class, 'searchProduct'])->name('product.search');
Route::get('/products', [ProductController::class, 'getProducts'])->name('products');
Route::get('/categories', [CategoryController::class, 'getCategories'])->name('categories');
Route::get('/category/products/{category}', [CategoryController::class, 'getCategoryProducts'])->name('category.products');

