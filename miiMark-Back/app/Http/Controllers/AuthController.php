<?php
namespace App\Http\Controllers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use App\Models\User;
use App\Models\Follower;
class AuthController extends Controller
{

    public function __construct()
    {
        $this->middleware('auth:api', ['except' => ['login','register','update','add_info']]);
    }

    public function login(Request $request)
    {
        $request->validate([
            'email' => 'required|string|email',
            'password' => 'required|string',
        ]);

        $credentials = $request->only('email', 'password');

        $token = Auth::attempt($credentials);

        if (!$token) {
            return response()->json([
                'status' => 'error',
                'message' => 'Unauthorized',
            ], 401);
        }

        $user = Auth::user();
        return response()->json([

                'token' => $token,

                'user' => $user,

            ]);

    }

    public function register(Request $request){
        $request->validate([
            'name' => 'required|string|max:255',
             'email' => 'required|string|email|max:255|unique:users',
            'password' => 'required|string|min:6',
            'image' => 'image|mimes:jpeg,png,jpg,gif,svg|max:2048',
        ]);
        if( $request->image ){
            $imageName = time().'.'.$request->image->extension();

           $path =  $request->image->move(public_path('images/profiles'), $imageName);
            $image_url = asset('images/profiles/'.$path->getFilename());
        }

        $user = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'rule_id'=>$request->rule_id,
            'password' => Hash::make($request->password),
            'image' => $image_url,
        ]);


        $token = Auth::login($user);

        return response()->json([
            'status' => 'success',
            'message' => 'User created successfully',
            'user' => $user,

            'authorisation' => [
                'token' => $token,
                'type' => 'bearer',
            ]
        ]);
    }


    public function update(Request $request)
    {
        $user_id = Auth::user();
        $user = User::find($user_id->id);
        $user->name = $request->input('name');
        $user->email = $request->input('email');
        $user->password = Hash::make($request->input('password'));
        $user->save();

        $info = DB::table('user_info')->where('user_id', $user->id)->get()->toArray();

        // Update the user info if it exists
        if (!empty($info)) {
            DB::table('user_info')->where('user_id', $user->id)->update([
                'bio' => $request->input('bio'),
                // Add other fields to update here
            ]);
        }

        return response()->json([
            'status' => 'success',
            'message' => 'User updated successfully',
            'updatedUser' => $user,
            'userInfo' => $info
        ]);
    }

    public function add_info(Request $request){
              $user= Auth::user();

             $userInfo = DB::table('user_info')->insert([
            'user_id'=>$request->input('user_id'),
            'bio' => $request->input('bio'),
            'mobile' => $request->input('mobile'),
            'date_of_birth' => $request->input('date_of_birth'),
            'countery' => $request->input('countery'),
            'city' =>$request->input('city'),
            'gender' => $request->input('gender'),
            'avatar' => $request->input('avatar'),
            'cover' => $request->input('cover'),


            // Add other fields to insert here
        ]);
        return response()->json([
            'status' => 'success',
            'message' => 'User updated successfully',

            'userInfo' => $userInfo
        ]);
    }

    public function getUser() {
    $user = Auth::user();

    $user = User::with('rule')->find($user->id)->toArray();

    $info = DB::table('user_info')->where('user_id', $user['id'])->get()->toArray();

    $user = array_merge($user, ['info' => $info]);
    return response()->json([
        'user' =>  $user,

    ]);
}
    public function userInfo($id){
        $user = User::where('id', $id)->first();

        $user = User::with('rule')->find($user->id)->toArray();

        $info = DB::table('user_info')->where('user_id', $user['id'])->get()->toArray();

        $user = array_merge($user, ['info' => $info]);
        return response()->json([
            'user' =>  $user,

        ]);
    }
    public function logout()
    {
        Auth::logout();
        return response()->json([
            'status' => 'success',
            'message' => 'Successfully logged out',
        ]);
    }

    public function me()
    {
        $user=User::all();
        return response()->json([
            'status' => 'success',
            'user' =>  $user,
        ]);
    }


    public function refresh()
    {
        return response()->json([
            'status' => 'success',
            'user' => Auth::user(),
            'authorisation' => [
                'token' => Auth::refresh(),
                'type' => 'bearer',
            ]
        ]);
    }

    public function user(){
        $user = Auth::user();

        $followingCount = Follower::where('follower_id', $user->id)->count();
        $followersCount = Follower::where('user_id', $user->id)->count();
        //$followingCount = $user->followers()->where('user_id', $user->id)->count();
        $user = User::with('rule')->find($user->id);
            return response()->json([

                'user' => $user,
                'followingCount' => $followingCount,
                'followersCount'=>$followersCount
                // Add any other user data you want to include here
            ]);
    }

}


