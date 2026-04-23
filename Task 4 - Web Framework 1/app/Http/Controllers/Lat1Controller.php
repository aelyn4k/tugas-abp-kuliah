<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class Lat1Controller extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $data['nama'] = 'M Aulia Muzzaki N';
        $data['asal'] = 'Brebes';
        return view('v_latihan1', $data);
    }

    /**
     * Display a listing of the resource.
     */
    public function method2()
    {
        $data['title'] = 'Daftar Mahasiswa';
        $data['daf_mhs'] = array(
            array('nama' => 'Aulia', 'asal' => 'Jakarta'),
            array('nama' => 'Muzzaki', 'asal' => 'Brebes'),
            array('nama' => 'Nugraha', 'asal' => 'Kebumen'),
        );
        return view('v_latihan2', $data);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }
}
