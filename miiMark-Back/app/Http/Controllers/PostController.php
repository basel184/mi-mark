<?php
namespace App\Http\Controllers;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use App\Models\Post;
use App\Models\Activity;
use App\Models\Hrefs;
use App\Models\User;

class PostController extends Controller
{
    public function index()
    {

        $posts = Post::with(['user', 'user.rule', 'comments', 'comments.user', 'activity'])
        ->where('status', 'public')
        ->latest()
        ->get();

    //       $posts_data = [];
    //
    //       foreach ($posts as $post) {
    //        $posts_data[] = [
    //
    //            'posts' =>  $post,
    //            'image_url' => asset('images/'.$post->image),
    //        ];
    //   }
    //

    return response()->json([
        'posts' =>  $posts
        ]);
         }

        public function activity(){
           $activity= Activity::all();
           return response()->json(['activities' => $activity]);
                }

        public function side_bar(){
            $hrefs= Hrefs::all();
            return response()->json(['hrefs' => $hrefs]);
            }

         public function my_posts(){
            $user = Auth::user();
            $posts = Post::with(['user', 'user.rule', 'comments', 'comments.user' , 'activity'])->where('user_id', $user->id)->get();
              return response()->json([
              'status' => 'success',

            'posts' => $posts,
           // 'image_url' => $image_url
              ]);
         }

         public function store(Request $request){
             $request->validate([
            'title' => 'required|string|max:255',
            'body' => 'required|string|max:8000',
            'image' => 'nullable|image|mimes:jpeg,png,jpg,gif,svg|max:2048',

        ]);
        if ($request->image) {
            $imageName = time().'.'.$request->image->extension();
            $path = $request->image->move(public_path('images'), $imageName);
            $image_url = asset('images/'.$path->getFilename());
            $user_id = Auth::id();

            $post = Post::create([
               'title' => $request->title,
               'body' => $request->body,
                'user_id' => $user_id,
                'image' =>  $image_url ?: null,
                'video' =>  null,
               'status' => $request->input('status'),
                'activity_id' => $request->activity_id ,

            ]);
        }  elseif($request->video){

            $videoName = time().'.'.$request->video->extension();
            $path = $request->video->move(public_path('videos'), $videoName);
            $video_url = asset('videos/'.$path->getFilename());
            $user_id = Auth::id();

            $post = Post::create([
               'title' => $request->title,
               'body' => $request->body,
                'user_id' => $user_id,
                'image' =>  null,
                'video' => $video_url ?: null,
               'status' => $request->input('status'),
                'activity_id' => $request->activity_id ,

            ]);
        }
         else {
            $user_id = Auth::id();

            $post = Post::create([
               'title' => $request->title,
               'body' => $request->body,
                'user_id' => $user_id,
                'image' =>  null,
                'video' =>  null,
               'status' => $request->input('status'),
                'activity_id' => $request->activity_id ,

            ]);
        }


        return response()->json([
            'status' => 'success',
            'message' => 'Post created successfully',
            'post' => $post,
           // 'image_url' => $image_url
        ]);
    }

    public function show(Post $post)
    {
        return response()->json($post);
    }

    public function update(Request $request, Post $post)
    {
        $request->validate([
            'title' => 'required',
            'content' => 'required',
        ]);

        $post->update($request->all());

        return response()->json($post);
    }

    public function destroy(Post $post)
    {
        $post->delete();

        return response()->json(null, 204);
    }
}
