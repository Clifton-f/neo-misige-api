<?php

namespace Modules\Auth\Http\Controllers;

use App\Http\Requests\StoreUserRequest;
use App\Http\Requests\UpdateUserRequest;
use Modules\Auth\Models\User;
use Modules\Auth\Http\Requests\UserRequest;
use Modules\Auth\Http\Resources\UserResource;
use Modules\Auth\Http\Resources\UserCollection;

class UserController
{
    public function index()
    {
        //return view('auth::index');
        return new UserCollection(User::all());
    }

    /**
     * Show the form for creating a new resource.
     */
    public function show(User $user){
$resource=new UserResource($user);
        
        return $resource;
        
    }
    public function store(UserRequest $request){
        
        $user = User::create($request->all());
            return new UserResource($user);
    }


    /**
     * Remove the specified resource from storage.
     */
    public function destroy($id)
    {
        //
    }
    public function edit(UserRequest $request){
        
    }
}
