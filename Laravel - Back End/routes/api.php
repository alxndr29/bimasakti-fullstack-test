<?php

use App\Http\Controllers\Api;
use Illuminate\Support\Facades\Route;

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

Route::post("/auth/login", [Api\AuthController::class, "login"])->middleware([
    "custom.throttle:10,1",
]);

Route::group(["middleware" => "auth:sanctum"], function () {
    // Auth
    Route::group(["prefix" => "auth"], function () {
        Route::post("/logout", [Api\AuthController::class, "logout"]);
        Route::get("/me", [Api\AuthController::class, "me"]);
        Route::put("/me", [Api\AuthController::class, "update"]);
        Route::put("/change-password", [
            Api\AuthController::class,
            "changePassword",
        ]);
    });
});
