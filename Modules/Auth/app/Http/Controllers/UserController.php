<?php

namespace Modules\Auth\Http\Controllers;

use App\Http\Controllers\Controller;
use Modules\Auth\Models\User;
use Illuminate\Http\Request;
use Modules\Auth\Http\Requests\UserRequest;
use Modules\Auth\Transformers\UserCollection;
use Modules\Auth\Transformers\UserResource;

class UserController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //return view('auth::index');
        return new UserCollection(User::all());
    }

    /**
     * Show the form for creating a new resource.
     */
    public function show(User $user){

        
        return new UserResource($user);
        
    }
    public function store(UserRequest $request){
        /*$fields = $request->validate([
            'nome'=>'required|max:255',
            'email'=>'required|email|unique:users',
            'password'=>'required',
            'BI'=>'required',
            'NUIT'=>'required',
            'contacto_1'=>'required|max:11',
            'contacto_2'=>'max:11'
            ]);
            $user=User::create($fields);
            $token = $user->createToken($request->name);
            return $fields;*/

            return new UserResource(User::create($request->all()));
    }


    /**
     * Remove the specified resource from storage.
     */
    public function destroy($id)
    {
        //
    }
}
