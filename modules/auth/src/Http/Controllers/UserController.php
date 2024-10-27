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
    public function show(User $user){
$resource=new UserResource($user);

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
        /*$user->update([
            'nome' => $campos['nome'],
            'email' => $campos['email'],
            "BI"=>$campos['BI'],
        "NUIT"=> $campos['NUIT'],
        ]);
        $user->save();*/
        $resource=new UserResource($user);
        return new UserResource($user);

    }
}
