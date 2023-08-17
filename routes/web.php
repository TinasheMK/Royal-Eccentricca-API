<?php

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

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

// Route::get('/', function () {
//     return view('welcome');
// });

// Route::redirect('/','/home');
Route::redirect('/dashboard','/home');

Route::get('/', [HomeController::class, 'index'])->name('home.home');
Route::get('/home', [HomeController::class, 'index'])->name('home.home');
Route::middleware(['auth:sanctum', 'verified'])->get('/explore', [HomeController::class, 'explore'])->name('home.explore');
Route::get('/search', [HomeController::class, 'search'])->name('home.search');
Route::get('/shop/{shop}', [HomeController::class, 'shop'])->name('home.shop');
Route::get('/shop/post/{post}', [HomeController::class, 'post'])->name('home.post');
Route::get('/category/{category}', [HomeController::class, 'category'])->name('home.category');
Route::get('/tag/{tag}', [HomeController::class, 'tag'])->name('home.tag');
Route::get('/product/{product}', [HomeController::class, 'product'])->name('home.product');
Route::get('/location', [HomeController::class, 'location'])->name('home.location');
Route::middleware(['auth:sanctum', 'verified'])->get('/openshop', [HomeController::class, 'openshop'])->name('shop.open');
Route::middleware(['auth:sanctum', 'verified'])->get('/dashboard', [HomeController::class, 'index'])->name('dashboard');


Route::middleware(['auth:sanctum', 'verified'])->get('/owner', [ShopController::class, 'index'])->name('shop.shop');
Route::middleware(['auth:sanctum', 'verified'])->get('/owner/orders', [ShopController::class, 'orders'])->name('shop.orders');
Route::middleware(['auth:sanctum', 'verified'])->get('/owner/history', [ShopController::class, 'history'])->name('shop.history');
Route::middleware(['auth:sanctum', 'verified'])->get('/owner/products', [ShopController::class, 'products'])->name('shop.products');
Route::middleware(['auth:sanctum', 'verified'])->get('/owner/posts', [ShopController::class, 'posts'])->name('shop.posts');
Route::middleware(['auth:sanctum', 'verified'])->get('/owner/settings', [ShopController::class, 'settings'])->name('shop.settings');
Route::middleware(['auth:sanctum', 'verified'])->post('/owner/store', [ShopController::class, 'store'])->name('shop.store');
Route::middleware(['auth:sanctum', 'verified'])->post('/owner/update', [ShopController::class, 'update'])->name('shop.update');


Route::middleware(['auth:sanctum', 'verified'])->get('/admin', [AdminController::class, 'index'])->name('admin.shop');
Route::middleware(['auth:sanctum', 'verified'])->get('/admin/orders', [AdminController::class, 'orders'])->name('admin.orders');
Route::middleware(['auth:sanctum', 'verified'])->get('/admin/history', [AdminController::class, 'history'])->name('admin.history');
Route::middleware(['auth:sanctum', 'verified'])->get('/admin/products', [AdminController::class, 'products'])->name('admin.products');
Route::middleware(['auth:sanctum', 'verified'])->get('/admin/users', [AdminController::class, 'users'])->name('admin.users');
Route::middleware(['auth:sanctum', 'verified'])->get('/admin/tasks', [AdminController::class, 'tasks'])->name('admin.tasks');
Route::middleware(['auth:sanctum', 'verified'])->get('/admin/posts', [ShopController::class, 'posts'])->name('admin.posts');
Route::middleware(['auth:sanctum', 'verified'])->get('/admin/settings', [AdminController::class, 'settings'])->name('admin.settings');
Route::middleware(['auth:sanctum', 'verified'])->post('/admin/store', [AdminController::class, 'store'])->name('admin.store');
Route::middleware(['auth:sanctum', 'verified'])->post('/admin/update', [AdminController::class, 'update'])->name('admin.update');

Route::middleware(['auth:sanctum', 'verified'])->get('/admin/details/{order}', [OrderController::class, 'showadmin'])->name('admin.order.details');

Route::middleware(['auth:sanctum', 'verified'])->post('/complete/order/payment', [OrderController::class, 'update'])->name('order.delivered');
Route::middleware(['auth:sanctum', 'verified'])->post('/owner/order/payment', [OrderController::class, 'index'])->name('order.done');
Route::middleware(['auth:sanctum', 'verified'])->get('/owner/order/resend/{order}', [OrderController::class, 'resend'])->name('order.resendemail');
Route::post('/owner/order/payment-process-complete', [OrderController::class, 'callback'])->name('order.complete');
Route::middleware(['auth:sanctum', 'verified'])->get('/owner/order/payment-complete/{order}', [OrderController::class, 'received'])->name('order.received');
Route::middleware(['auth:sanctum', 'verified'])->get('/owner/details/{order}', [OrderController::class, 'show'])->name('order.details');
Route::middleware(['auth:sanctum', 'verified'])->get('/owner/details/user/{order}', [OrderController::class, 'showuser'])->name('order.detailsuser');
Route::middleware(['auth:sanctum', 'verified'])->get('/order/select-delivery-place', [OrderController::class, 'deliveries'])->name('order.deliveries');
Route::middleware(['auth:sanctum', 'verified'])->get('/order/select-payment-method', [OrderController::class, 'payments'])->name('order.payment');


Route::middleware(['auth:sanctum', 'verified'])->get('/wallet/add-funds', [WalletController::class, 'index'])->name('wallet.wallet');
Route::middleware(['auth:sanctum', 'verified'])->post('/wallet/make-payment', [WalletController::class, 'add_funds'])->name('wallet.pay');
Route::middleware(['auth:sanctum', 'verified'])->get('/wallet/order/payment-complete/{order}', [WalletController::class, 'received'])->name('wallet.received');


Route::get('auth/social', [LoginController::class,'show'])->name('social.login');
Route::get('oauth/{driver}', [LoginController::class,'redirectToProvider'])->name('social.oauth');
Route::get('oauth/{driver}/callback', [LoginController::class,'handleProviderCallback'])->name('social.callback');


Route::post('/owner/post/add', [PostController::class, 'store'])->name('post.add');
Route::get('/owner/post/delete/{post}', [PostController::class, 'destroy'])->name('post.delete');


Route::middleware(['auth:sanctum', 'verified'])->post('/owner/products/add', [ProductController::class, 'store'])->name('product.add');
Route::middleware(['auth:sanctum', 'verified'])->post('/owner/products/update', [ProductController::class, 'update'])->name('product.update');
Route::middleware(['auth:sanctum', 'verified'])->get('/owner/products/delete/{product}', [ProductController::class, 'destroy'])->name('product.delete');
Route::middleware(['auth:sanctum', 'verified'])->get('/owner/products/edit/{product}', [ProductController::class, 'edit'])->name('product.edit');


Route::middleware(['auth:sanctum', 'verified'])->get('/add-to-cart/{product}', [CartController::class, 'add'])->name('cart.add');
Route::middleware(['auth:sanctum', 'verified'])->post('/add-to-cart/advanced', [CartController::class, 'add_advanced'])->name('cart.advanced.add');
Route::middleware(['auth:sanctum', 'verified'])->get('/up-from-cart/{product}', [CartController::class, 'up'])->name('cart.up');
Route::middleware(['auth:sanctum', 'verified'])->get('/down-from-cart/{product}', [CartController::class, 'down'])->name('cart.down');
Route::middleware(['auth:sanctum', 'verified'])->get('/down-from-cart/{product}', [CartController::class, 'delete'])->name('cart.delete');
Route::middleware(['auth:sanctum', 'verified'])->get('/cart', [CartController::class, 'index'])->name('cart.index');
Route::middleware(['auth:sanctum', 'verified'])->get('/add-to-wishlist/{product}', [WishlistController::class, 'add'])->name('wishlist.add');
Route::middleware(['auth:sanctum', 'verified'])->get('/delete-from-wishlist/{product}', [WishlistController::class, 'destroy'])->name('wishlist.delete');
Route::middleware(['auth:sanctum', 'verified'])->get('/wishlist', [WishlistController::class, 'index'])->name('wishlist.index');


Route::middleware(['auth:sanctum', 'verified'])->get('/messages', [MessageController::class, 'messages'])->name('messages');
Route::middleware(['auth:sanctum', 'verified'])->get('/contacts',[MessageController::class, 'contacts'])->name('contacts');
Route::middleware(['auth:sanctum', 'verified'])->get('/subscriptions',[MessageController::class, 'subscriptions'])->name('subscriptions');
Route::middleware(['auth:sanctum', 'verified'])->get('/message/{user_id}', [MessageController::class, 'index'])->name('message');
Route::middleware(['auth:sanctum', 'verified'])->post('/twilla', [MessageController::class, 'create'])->name('message.create');
Route::middleware(['auth:sanctum', 'verified'])->get('/contact/add/{contact}', [MessageController::class, 'addcontacts'])->name('contact.add');
Route::middleware(['auth:sanctum', 'verified'])->get('/subscribe/{shop}', [MessageController::class, 'subscribe'])->name('subscribe');
Route::middleware(['auth:sanctum', 'verified'])->get('/unsubscribe/{shop}', [MessageController::class, 'unsubscribe'])->name('unsubscribe');

Route::middleware(['auth:sanctum', 'verified'])->get('/notifications', [NotificationController::class, 'index'])->name('notifications');


Route::middleware(['auth:sanctum', 'verified'])->post('/twist', [CommentController::class, 'store'])->name('comment.store');

Route::middleware(['auth:sanctum', 'verified'])->get('/twimbo', [RatingController::class, 'store'])->name('rating.rate');


Route::middleware(['auth:sanctum', 'verified'])->get('/owner/delete', function () {
    return view('shop.confirmdelete');
})->name('shop.delete');

Route::middleware(['auth:sanctum', 'verified'])->get('/shops/explore-shops', [HomeController::class, 'shops'])->name('shops');

Route::middleware(['auth:sanctum', 'verified'])->get('/profile', [HomeController::class, 'profile'])->name('profile');

Route::get('/categories', [HomeController::class, 'categories'])->name('categories');


Route::group(['prefix'=>'api','middleware' => 'auth'], function(){
	Route::get('find', function(Illuminate\Http\Request $request){
		$keyword = $request->input('keyword');
		Log::info($keyword);
		$skills = DB::table('tagss')->where('name','like','%'.$keyword.'%')
				  ->select('tags.id','tags.name','tags.display')
				  ->get();
		return json_encode($skills);
	})->name('api.skills');
});
