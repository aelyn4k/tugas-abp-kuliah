<?php

use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return view('welcome');
});

Route::controller(App\Http\Controllers\AuthController::class)->group(function () {
    Route::middleware('guest')->group(function () {
        Route::get('/login', 'login')->name('login');
        Route::post('/auth', 'auth')->name('auth');
        Route::get('/registration', 'registration')->name('registration');
        Route::post('/register', 'register')->name('register');
    });

    Route::middleware('auth')->group(function () {
        Route::get('/home', 'home')->name('dashboard');
        Route::get('/logout', 'logout')->name('logout');
    });
});
