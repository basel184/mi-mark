<?php
namespace App\Http\Controllers;

use Illuminate\Support\Facades\Auth;
use App\Models\User;
use App\Models\Interest;
use Illuminate\Http\Request;

class InterestController extends Controller
{

public function index($id){


         $user_id = Interest::all();
         $user =$id;
         $interests = Interest::join('activities', 'interests.activity_id', '=', 'activities.id')
         ->where('interests.user_id', $id)
         ->select('interests.*', 'activities.*')
         ->get()->map(function ($card) {
            $card['selected'] = false;
            return $card;
        });
        return response()->json([
            'cards' =>  $interests,
            'message' => 'Selected cards saved successfully'
         ]);;



        return response()->json([ 'message' => 'a7a ted cards saved successfully']);

        }

    public function store(Request $request)
    {

        $selectedCard = $request->input('selectedCards', []);
        $user = Auth::user();
        $interests = [];

        // Save the selected card IDs
        if($user &&  $selectedCard ){
        foreach ($selectedCard as $card) {
            $activityId = $card['id'];
          
            $interests['activity_id'] = $activityId;
            $interests['user_id'] = $user['id'];

            $interest = Interest::where('user_id', $user->id)
            ->where('activity_id', $activityId)
            ->exists();
            if ($interest) {
                continue; // Skip this iteration if the interest already exists
            }
            try {
                Interest::insertOrIgnore($interests);

            } catch (\Illuminate\Database\QueryException $e) {
                // Handle the exception if needed
            }

            }
            return response()->json(['card'=>$selectedCard, 'message' => 'Selected cards saved successfully']);
        }

        // Return a response indicating success
        return response()->json(['message' => 'erorr Selected cards not saved successfully']);
    }



}
?>
