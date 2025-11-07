<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\Rule;

class UserController extends Controller
{
    public function getList()
    {
        $users = User::latest()->get();
        return view('users.list', compact('users'));
    }
    
    public function getAdd()
    {
        $roles = ['user', 'admin', 'staff'];
        return view('users.add', compact('roles'));
    }
    
   public function postAdd(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|email|unique:users,email',
            'password' => 'required|string|min:8|confirmed',
            'username' => 'nullable|unique:users,username|max:50',
            'id_card' => 'nullable|unique:users,id_card|max:20',
            'roles' => ['required', Rule::in(['user', 'admin', 'staff'])],
        ]);
        
        User::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => Hash::make($request->password), 
            'username' => $request->username,
            'phone' => $request->phone,
            'id_card' => $request->id_card,
            'is_active' => $request->boolean('is_active', true),
            'roles' => $request->roles,
        ]);
        
        return redirect()->route('users.list')->with('success', 'Added user successfully.');
    }
    
    public function getUpdate($id)
    {
        $user = User::findOrFail($id);
        $roles = ['user', 'admin', 'staff'];
        return view('users.edit', compact('user', 'roles'));
    }
    
    public function postUpdate(Request $request, $id)
    {
        $user = User::findOrFail($id);
        
        $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|email|unique:users,email,'.$id, 
            'username' => 'nullable|unique:users,username,'.$id.'|max:50',
            'id_card' => 'nullable|unique:users,id_card,'.$id.'|max:20',
            'password_new' => 'nullable|string|min:8|confirmed', 
            'roles' => ['required', Rule::in(['user', 'admin', 'staff'])],
        ]);
        
        $data = $request->only(['name', 'email', 'username', 'phone', 'id_card', 'roles']);
        $data['is_active'] = $request->boolean('is_active', $user->is_active);
        
        if ($request->filled('password_new')) {
            $data['password'] = Hash::make($request->password_new);
        }
        
        $user->update($data);
        
        return redirect()->route('users.list')->with('success', 'Updated user successfully.');
    }
    
    public function getDelete($id)
    {
        $user = User::findOrFail($id);
        
        if ($user->id === auth()->id()) {
            return redirect()->route('users.list')->with('error', 'Cannot delete your own account.');
        }

        if ($user->orders()->count() > 0) {
             return redirect()->route('users.list')->with('error', 'Cannot delete user with existing orders.');
        }
        
        $user->delete();
        
        return redirect()->route('users.list')->with('success', 'Deleted user successfully.');
    }
}