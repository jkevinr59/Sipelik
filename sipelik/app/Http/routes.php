<?php

/*
|--------------------------------------------------------------------------
| Routes File
|--------------------------------------------------------------------------
|
| Here is where you will register all of the routes in an application.
| It's a breeze. Simply tell Laravel the URIs it should respond to
| and give it the controller to call when that URI is requested.
|
*/

Route::get('/', function () {
    return view('welcome');
});


/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| This route group applies the "web" middleware group to every route
| it contains. The "web" middleware group is defined in your HTTP
| kernel and includes session state, CSRF protection, and more.
|
*/

Route::group(['middleware' => ['web']], function () {
    Route::get('register','HomeController@register');
	Route::post('daftar','HomeController@daftar');
	Route::get('masuk','HomeController@loginform');
	Route::post('login','HomeController@login');
	Route::get('test','HomeController@testo');
	Route::get('logout','HomeController@logout');
	Route::get('iklan','HomeController@iklan');
	Route::get('tambahbarang','HomeController@tambahbarang');
	Route::post('tambahbarangproses','HomeController@tambahbarangproses');
    Route::get('iklan_detail/{id}','HomeController@iklan2');
    Route::get('testimoni/{id}','HomeController@testimoni');
    Route::post('testimoniproses','HomeController@testimoniproses');
    Route::post('transaksi','HomeController@transaksi');
    Route::get('penjual/{id}','HomeController@penjual');
    Route::get('editakun','HomeController@editakun');
    Route::post('editproses','HomeController@editproses');
    Route::get('hapusakun/{id}','HomeController@hapusakun');
    Route::get('editbarang/{id}','HomeController@editbarang');
    Route::post('editbarangproses','HomeController@editbarangproses');
    Route::get('hapusbarang/{id}','HomeController@hapusbarang');
});
