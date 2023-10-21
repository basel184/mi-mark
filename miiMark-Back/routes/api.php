<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\TodoController;
use App\Models\User;
// Public routes
//Route::post('/login', 'AuthController@login');
Route::post('/login', [AuthController::class, 'login']);
Route::post('/register', [AuthController::class, 'register']);
Route::get('/user', [AuthController::class, 'user']);
Route::post('logout', [AuthController::class, 'logout']);
    Route::post('refresh', [AuthController::class, 'refresh']);
   // Route::get('me', [AuthController::class, 'me']);
    Route::get('/users/{id}',[AuthController::class, 'userInfo']  );
    Route::post('/info', [AuthController::class, 'add_info']);
   // Route::get('/users/{userId}',[AuthController::class, 'getUser']);
    Route::get('/user/me/',[AuthController::class, 'getUser']);

    Route::get('/rules', 'App\Http\Controllers\RuleController@index');
   // Route::post('posts', [PostController::class, 'store']);
    Route::post('/info', 'App\Http\Controllers\AuthController@add_info');
    Route::post('/post', 'App\Http\Controllers\PostController@store');
    Route::get('/posts', 'App\Http\Controllers\PostController@index');
    Route::get('/activities', 'App\Http\Controllers\PostController@activity');
    Route::get('/links', 'App\Http\Controllers\PostController@side_bar');
    Route::get('/myposts', 'App\Http\Controllers\PostController@my_posts');
    Route::post('/comments', 'App\Http\Controllers\CommentController@store');
    Route::get('/posts/{Id}/comments', 'App\Http\Controllers\CommentController@index');
  // Route::get('/users/{id}', function ($id) {
  //     $user = User::find($id);
  //     return $user;
  // });
    Route::get('/user', 'App\Http\Controllers\AuthController@user');
   // Route::get('/users/{userId}','App\Http\Controllers\AuthController@getUser');
    //  Route::post('/posts', 'App\Http\Controllers\PostController');

         Route::post('/follow','App\Http\Controllers\FollowerController@follow');
         Route::post('/check-following','App\Http\Controllers\FollowerController@checkFollowing');
         Route::post('/unfollow','App\Http\Controllers\FollowerController@unfollow');
         Route::get('/marks','App\Http\Controllers\ActivityController@index');
         Route::post('/cards', 'App\Http\Controllers\InterestController@store');
         Route::get('/myinterest/{id}', 'App\Http\Controllers\InterestController@index');
       //  Route::get('/myinterest','App\Http\Controllers\ActivityController@following');


    Route::get('todos', [TodoController::class, 'index']);
    Route::post('todo', [TodoController::class, 'store']);
    Route::get('todo/{id}', [TodoController::class, 'show']);
    Route::put('todo/{id}', [TodoController::class, 'update']);
    Route::delete('todo/{id}', [TodoController::class, 'destroy']);
// Protected routes
Route::middleware('auth:sanctum')->group(function () {

});
