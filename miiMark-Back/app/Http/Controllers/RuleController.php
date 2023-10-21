<?php


namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Rule;
use Illuminate\Support\Facades\Auth;


class RuleController extends Controller
{

    public function index()
    {
        $rules = Rule::all();
        return response()->json([

            'rules' => $rules,
        ]);
    }

    public function store(Request $request)
    {
      //  $request->validate([



    }
}
