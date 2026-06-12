<?php

use App\Http\Controllers\ApiWeb;
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

Route::group(["middleware" => ["auth:sanctum"]], function () {
    // Transaction
    Route::group(["prefix" => "transaction"], function () {
        Route::get("/", [ApiWeb\TransactionController::class, "index"]);
        Route::get("/summary", [
            ApiWeb\TransactionController::class,
            "summary",
        ]);
        Route::get("/filters", [
            ApiWeb\TransactionController::class,
            "filters",
        ]);
        Route::post("/sync", [ApiWeb\TransactionController::class, "sync"]);
    });

    // Master
    Route::group(["prefix" => "master"], function () {
        // Product
        Route::group(["prefix" => "product"], function () {
            Route::get("/", [
                ApiWeb\MasterProductController::class,
                "index",
            ])->middleware(["role:admin"]);
            Route::post("/", [
                ApiWeb\MasterProductController::class,
                "store",
            ])->middleware(["role:admin"]);
            Route::get("/category", [
                ApiWeb\MasterProductController::class,
                "getCategory",
            ])->middleware(["role:admin"]);
            Route::get("/{id}", [ApiWeb\MasterProductController::class, "show"])
                ->middleware(["role:admin"])
                ->whereUuid("id");
            Route::post("/{id}/update", [
                ApiWeb\MasterProductController::class,
                "update",
            ])
                ->middleware(["role:admin"])
                ->whereUuid("id");
            Route::delete("/{id}", [
                ApiWeb\MasterProductController::class,
                "delete",
            ])
                ->middleware(["role:admin"])
                ->whereUuid("id");
        });
    });
});
