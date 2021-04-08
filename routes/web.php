<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\MailController;
use App\Http\Controllers\Auth\AuthController;

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
// Route::post('add', [MailController::class, 'add']);
Route::post('cron', [MailController::class, 'cron']);
Route::post('sendmail', [MailController::class, 'sendmail']);
Route::get('/', [MailController::class, 'sendmailpage']);
Route::post('operator', [MailController::class, 'operator']);
Route::post('db', [MailController::class, 'db']);
Route::post('/type', [MailController::class, 'type']);




//Route::post('/test',[MainController::class, 'html_email']);
//Route::post('test',[MainController::class, 'attachment_email']);



Auth::routes();

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');
