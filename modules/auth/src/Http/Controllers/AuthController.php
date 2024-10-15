<?php

namespace Modules\Auth\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Modules\Auth\Models\User;
use Illuminate\Support\Facades\Hash;
use Modules\Auth\Http\Resources\UserResource;
use Modules\Models\Papel;
use Illuminate\Support\Facades\Auth;



class AuthController extends Controller
{

    public function login(){
        $credentials = request(['email','password']);
        if(!$token = auth('api')->attempt($credentials)){
            return response()->json(['error'=>'Unauthorized'],401);
        }
        $userResource = new UserResource(User::where('email',request(['email']))->first());
        return response()->json([
            'user_data'=> $userResource,
            'token_data'=>[
                'token'=>$token,
                'token_type'=>'bearer',
                'expires_in' => auth()->factory()->getTTL()*60
            ]
            
            ]);
    }

    public function me(){
        return response()->json(auth()->user());
    }

    public function logout(){
        auth()->logout();
        return reponse()->json(['message'=>'Successfully logged out']);
    }

    public function refresh(){
        return $this->respondWithToken(auth()->refresh());
    }
    protected function respondWithToken(){
        respond()->json([
        'access_token'=>$token,
        'token_type'=>'bearer',
        'expires_in'=>auth()->factory()->getTTL()*60
        ]);
    }
}