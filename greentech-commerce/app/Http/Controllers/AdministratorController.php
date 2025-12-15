<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request; 

class AdministratorController extends Controller  
{
    public function __construct()
    {
        $this->middleware('auth');
    }
    
    // Method index - là method chính cho trang dashboard
    public function index()
    {
        return view('administrator.dashboard');
    }
    
    // Method getHome - có thể dùng cho route khác
    public function getHome()
    {
        return view('administrator.home');
    }
}
