<?php

namespace Modules\Auth\Http\Controllers;

use App\Http\Requests\StoreUserRequest;
use Modules\Auth\Http\Requests\UpdateUserRequest;
use Modules\Auth\Models\User;
use Modules\Auth\Http\Requests\UserRequest;
use Modules\Auth\Http\Resources\UserResource;
use Modules\Auth\Http\Resources\UserCollection;
use Modules\Auth\Models\UserPapel;

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
    public function show($id){

        $user = User::where('id',$id)->first();
        $resource=new UserResource($user);
        if(!$user){
            return response()->json(["message" => "User not found"], 404);
        }
        return $resource->getUser();

    }
    public function store(UserRequest $request){
        $campos = $request->validated();
        $user = User::create($campos);
        foreach ($campos['papel_id'] as $papeis){
            UserPapel::create(["user_id" => $user->id, "papel_id" => $papeis]);
        }
            return new UserResource($user);
    }


    /**
     * Remove the specified resource from storage.
     */
    public function destroy($id)
    {
        //
        User::destroy($id);
        return response()->json(null, 204);
    }
    public function edit(UserRequest $request){

    }
    public function update(UpdateUserRequest $request, $id)

    {

        //$user->update($request->all());
        $user=User::where('id', $id)->first();

        $campos = $request->validated();
        $user->nome=$campos['nome'];
        $user->email=$campos['email'];
        $user->BI=$campos['BI'];
        $user->save();
        foreach ($campos['papel_id'] as $papel){
            if(UserPapel::where('user_id', $user->id)->where('papel_id', $papel)->count()==0){
                UserPapel::create(["user_id" => $user->id, "papel_id" => $papel]);
            }

        }


        $resource=new UserResource($user);
        return new UserResource($user);

    }
}
