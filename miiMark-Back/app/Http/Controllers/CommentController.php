<?php


namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Comment;
use Illuminate\Support\Facades\Auth;


class CommentController extends Controller
{

    public function index($Id)
    {
        $comments = Comment::where('post_id', $Id)->with('user')->get();
        return response()->json([

            'comments' => $comments,
        ]);
    }

    public function store(Request $request)
    {
      //  $request->validate([

     //       'body' => 'required',
      //  ]);
      $data = request()->validate([
        'body' => 'required|string'
    ]);
    $comment = Comment::create([

        'body' => $request->body,
        'post_id' =>  $request->post_id,
        'user_id' => $request->user_id
    ]);

    $comment->save();


        return response()->json([
            'status' => 'success',
            'message' => 'Post created successfully',
            'post' => $comment,

        ]);

    }
}
