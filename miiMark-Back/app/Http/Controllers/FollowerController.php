<?php
namespace App\Http\Controllers;
use Illuminate\Support\Facades\Auth;
use App\Models\User;
use App\Models\Follower;
use Illuminate\Http\Request;

class FollowerController extends Controller
{
    public function follow(Request $request)
    {
        $user = Auth::user();
        $follower = User::find($request->follower_id);

        if ($user && $follower) {
           $foll = Follower::create([
            'user_id' => $user->id,
            'follower_id' =>$request->input('follower_id'),
        ]);
            return response()->json(['message' => 'تمت المتابعة بنجاح',
            'foll' => $foll
        ]);
        }

        return response()->json(['message' => 'فشل في المتابعة']);
    }

    public function checkFollowing(Request $request)
    {

    $user = Auth::user();
    $follower = User::find($request->follower_id);

    if ($user && $follower) {
        $isFollowing = Follower::where('user_id', $user->id)
    ->where('follower_id', $request->follower_id)
    ->exists();

$isFollower = Follower::where('user_id', $request->follower_id)
    ->where('follower_id', $user->id)
    ->exists();

$response = [];

if ($isFollowing) {
    $response['isFollowing'] = true;
}

if ($isFollower) {
    $response['isFollower'] = true;
}

if (empty($response)) {
    $response['message'] = 'لا يتابع ولا يتابعك';
}

return response()->json($response);


        return response()->json(['message' => 'يمكنك متابعة هذا المستخدم']);
    }

    return response()->json(['message' => 'فشل في التحقق من المتابعة']);
    }

    public function unfollow(Request $request)
    {
        $user = Auth::user();
        $follower = User::find($request->follower_id);

        if ($user && $follower) {
            Follower::where('user_id', $user->id)
            ->where('follower_id', $request->follower_id)
            ->delete();

            return response()->json(['message' => 'تم إلغاء المتابعة بنجاح']);
        }

        return response()->json(['message' => 'فشل في إلغاء المتابعة']);
    }
}
