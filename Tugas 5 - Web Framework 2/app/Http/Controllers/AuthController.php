<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class AuthController extends Controller
{
    public function login()
    {
        return view('login');
    }

    public function auth(Request $request)
    {
        $data = $request->validate([
            'email' => ['required', 'email', 'max:255', 'exists:users,email'],
            'password' => ['required', 'string', 'min:8'],
        ], [
            'email.required' => 'Email wajib diisi',
            'email.email' => 'Format email tidak valid',
            'email.max' => 'Email tidak boleh lebih dari 255 karakter',
            'email.exists' => 'Email tidak ditemukan',
            'password.required' => 'Password wajib diisi',
            'password.string' => 'Password harus berupa string',
            'password.min' => 'Password harus minimal 8 karakter',
        ]);

        $user = User::where('email', $data['email'])->first();

        if (!$user) {
            return redirect()->back()->withErrors(['email' => 'Email not found']);
        }

        if (!password_verify($data['password'], $user->password)) {
            return redirect()->back()->withErrors(['password' => 'Incorrect password']);
        }

        Auth::login($user);
        $request->session()->regenerate();

        return redirect()->route('dashboard')->with('success', 'Login successful');
    }

    public function registration()
    {
        return view('registration');
    }

    public function register(Request $request)
    {
        $data = $request->validate([
            'name' => ['required', 'string', 'max:255'],
            'email' => ['required', 'string', 'email', 'max:255', 'unique:users,email'],
            'password' => ['required', 'string', 'min:8'],
        ], [
            'email.required' => 'Email wajib diisi',
            'email.string' => 'Email harus berupa string',
            'email.email' => 'Format email tidak valid',
            'email.max' => 'Email tidak boleh lebih dari 255 karakter',
            'email.unique' => 'Email sudah terdaftar',
            'password.required' => 'Password wajib diisi',
            'password.string' => 'Password harus berupa string',
            'password.min' => 'Password harus minimal 8 karakter',
        ]);

        User::create([
            'name' => $data['name'],
            'email' => $data['email'],
            'password' => bcrypt($data['password']),
        ]);

        return redirect()->route('login')->with('success', 'Registration successful. Please login.');
    }

    public function home()
    {
        return view('home');
    }

    public function logout(Request $request)
    {
        Auth::logout();
        $request->session()->invalidate();
        $request->session()->regenerateToken();

        return redirect()->route('login')->with('success', 'Logged out successfully');
    }
}
