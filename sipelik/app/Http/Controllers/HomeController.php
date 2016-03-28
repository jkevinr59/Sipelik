<?php

namespace App\Http\Controllers;

//use Request;
use Illuminate\Http\Request;
use App\Http\Requests;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Input;
use Auth;
use Session;
use Validator;
use DB;
use App\User;
use App\Iklan;
// use Input;



class HomeController extends controller{

	Public function register(){
		return view("register");
	}

	public function daftar(){
		$data=Input::all();
		if($data['password']==$data['conpassword'])
		{
        	$pass=bcrypt( $data['password']);
        	Profile::insertGetId(array(
           	 'username'=> $data['username'],
           	 'password'=> $pass,
           	 'nama_user'=> $data['nama'],
           	 'no_telp'=> $data['telp'],
           	 'alamat_user'=> $data['asal'],
           	 'alamat_kirim'=> $data['kirim'],
           	 'email'=> $data['email']
          	 
           	 ));
         	return 'register berhasil';
    }
    else
    {
      Session::flash('message','konfirmasi password gagal');
			return redirect('register');
    }
	}

  public function loginform()
  {
    return view('login');
  }

  public function login()
  {
            
    // $credentials = Input::only('username','password');
    $new = Input::only('username','password');
    // $this->data['username'] = Input::get('username');
            
    // dd($credentials);

    if (Auth::attempt($new,true))
    {
      //if(Auth::role()==1)
      // return 'asdf';
      $id=Auth::user()->id;
      //return view('tes');
      return redirect('iklan');
      // echo $id;
      //return 'asdfjhdsafasdf';
    }
    else
    {
      Session::flash('message','Login anda gagal, silahkan cek kembali username dan password');
      return redirect('masuk');
    } 
            // return redirect('loginadmin');
  }
    
  public function testo()
  {
    if(Auth::check())
    {
      return view('tes');
    }
    else
    {
      return 'gak masuk cuk';
    }
  }

  public function iklan(){
    $data=array();
    $data['iklan']=DB::table('iklan')->join('profileuser','iklan.idpenjual','=','profileuser.id')->select('iklan.*','profileuser.nama_user')->get();
    return view('iklan',$data);
  }

  Public function tambahbarang(){
    return view("tambahbarang");
  }

  public function tambahbarangproses(){
    $data=Input::all();
    Iklan::insertGetId(array(
    'judul_iklan'=> $data['judul'],
    'harga'=> $data['harga'],
    'deskripsi_iklan'=> $data['deskripsi'],
    'stok'=> $data['stok']));
    return 'oke iklan bisa';
  }

  public function logout()
  {
    Auth::logout();
    return redirect('iklan');
  }
}

?>
