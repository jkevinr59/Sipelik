<?php

namespace App\Http\Controllers;

//use Request;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redirect;
use App\Http\Requests;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Input;
use Auth;
use Session;
use Validator;
use DB;
use App\User;
use App\Iklan;
use App\Testimoni;
use App\Transaksi;
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
         	return redirect('iklan');
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

  public function tambahbarang(){
    return view("tambahbarang");
  }

  public function tambahbarangproses(){
    $data=Input::all();
    Iklan::insertGetId(array(
    'judul_iklan'=> $data['judul'],
    'harga'=> $data['harga'],
    'deskripsi_iklan'=> $data['deskripsi'],
    'stok'=> $data['stok'],
    'idpenjual'=> $data['idpenjual']));
    return redirect('iklan');
  }

  public function logout()
  {
    Auth::logout();
    return redirect('iklan');
  }


  public function iklan2($id){
    $data=array();
    $data['iklan']=DB::table('iklan')->join('profileuser','iklan.idpenjual','=','profileuser.id')->select('iklan.*','profileuser.nama_user')->where('iklan.id_iklan','=',$id)->get();
    return view('anwar',$data);
  }

  public function testimoni($id){
    return view("testimoni",compact('id'));
  }

  public function testimoniproses(){
    $data=Input::all();
    Testimoni::insertGetId(array(
    'isi'=> $data['testimoni'],
    'score'=> $data['score'],
    'id_user'=> $data['iduser'],
    'id_iklan'=> $data['idiklan']));
    $id = $data['idiklan'];
    $dataa=array();
    $dataa['iklan']=DB::table('iklan')->join('profileuser','iklan.idpenjual','=','profileuser.id')->select('iklan.*','profileuser.nama_user')->where('iklan.id_iklan','=',$id)->get();
    Session::flash('message','Terima kasih atas testimoni anda');
    return view('anwar',$dataa);
  }

   public function transaksi(){
    $data=Input::all();
    Transaksi::insertGetId(array(
    'tanggal_terjual'=> $data['tanggal'],
    'idpembeli'=> $data['idpembeli'],
    'idpenjual'=> $data['idpenjual'],
    'idiklan'=> $data['idiklan']));

    $id = $data['idiklan'];
    $url = $data['url'];

    DB::table('iklan')
            ->where('id_iklan', $id)
            ->update(['status' => 0]);
    Session::flash('message','Pembelian selesai. Klik data penjual untuk melihat informasi penjual, atau klik testimoni untuk mengisi testimoni singkat');
    return Redirect::to($url);
  }

  public function penjual($id){
    $data=array();
    $data['penjual']=DB::table('profileuser')->select('profileuser.*')->where('profileuser.id','=',$id)->get();
    return view('penjual',$data);
  }
}

?>
