<?php

namespace App\Http\Controllers;

//use Request;
//use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redirect;
//use App\Http\Requests;
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
use App\Profile;
use Request;
// use Input;



class HomeController extends controller{

  //form register
	public function register(){
    if(!Auth::check())
    {
		  return view("register");
    }
    else
    {
      return redirect('/');
    }
	}
  //proses register
	public function daftar()
  {
    if(Request::isMethod('post'))
    {
      $data=Input::all();
      $userexist = DB::table('profileuser')->select('profileuser.username')->where(strtolower('profileuser.username'),'=',strtolower($data['username']))->get();
  		if($userexist)
      {
        Session::flash('message','username sudah digunakan');
        return redirect('register');
      }
      elseif(!$userexist && $data['password']==$data['conpassword'])
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
           	return redirect('/');
      }
      else
      {
        Session::flash('message','konfirmasi password gagal');
  			return redirect('register');
      }
    }
    elseif(Request::isMethod('get'))
    {
      return redirect('/');
    }
  }

  //form login
  public function loginform()
  {
    if(!Auth::check())
    {
      return view('login');
    }
    else
    {
      return redirect('/');
    }
  }

  //proses login
  public function login()
  {
    if(Request::isMethod('post'))
    {
      $new = Input::only('username','password');
  
      if (Auth::attempt($new,true))
      {

        $id=Auth::user()->id;
        return redirect('/');
      }
        else
      {
        Session::flash('message','Login anda gagal, silahkan cek kembali username dan password');
        return redirect('masuk');
      }
    }
    elseif(Request::isMethod('get'))
    {
      return redirect('/');
    } 
  }
    
  //masuk katalog
  public function iklan(){
    $data=array();
    $data['iklan']=DB::table('iklan')->join('profileuser','iklan.idpenjual','=','profileuser.id')->select('iklan.*','profileuser.nama_user')->where('iklan.status','=',1)->get();
    return view('iklan',$data);
  }

  //buat iklan
  public function tambahbarang(){
    if(Auth::check())
    {
      return view("tambahbarang");
    }
    else
    {
      return redirect('/');
    }
  }

  //proses pembuatan iklan
  public function tambahbarangproses(){
    if(Request::isMethod('post'))
    {
      $data=Input::all();
        $rules = array(
              'file' => 'image|max:3000',
          );
      
         // PASS THE INPUT AND RULES INTO THE VALIDATOR
          $validation = Validator::make($data, $rules);
             $file = array_get($data,'file');
             // SET UPLOAD PATH
              $destinationPath = 'uploads';
              // GET THE FILE EXTENSION
              $extension = $file->getClientOriginalExtension();
              $nama= $file->getClientOriginalName();

              // RENAME THE UPLOAD WITH RANDOM NUMBER
              $fileName = $nama; 
              // MOVE THE UPLOADED FILES TO THE DESTINATION DIRECTORY
              $upload_success = $file->move($destinationPath, $fileName);
              $filepath = $destinationPath . '/' . $nama;
      Iklan::insertGetId(array(
      'judul_iklan'=> $data['judul'],
      'harga'=> $data['harga'],
      'deskripsi_iklan'=> $data['deskripsi'],
      'stok'=> $data['stok'],
      'gambar'=>$filepath,
      'idpenjual'=> $data['idpenjual']));
     
      return redirect('/');
    }
    elseif(Request::isMethod('get'))
    {
      return redirect('/');
    } 
  }

  //proses logout
  public function logout()
  {
    Auth::logout();
    return redirect('/');
  }

  //masuk detail barang
  public function iklan2($id)
  {
    $status1=DB::table('iklan')->select('iklan.id_iklan')->where('iklan.id_iklan','=',$id)->where('iklan.status','=',1)->get();
    $status0=DB::table('iklan')->select('iklan.id_iklan')->where('iklan.id_iklan','=',$id)->where('iklan.status','=',0)->get();
    $status2=DB::table('iklan')->select('iklan.id_iklan')->where('iklan.id_iklan','=',$id)->where('iklan.status','=',2)->get();
    if(!Auth::check())
    {
      if($status1)
      {
        $data=array();
        $data['iklan']=DB::table('iklan')->join('profileuser','iklan.idpenjual','=','profileuser.id')->select('iklan.*','profileuser.nama_user','profileuser.alamat_kirim')->where('iklan.id_iklan','=',$id)->get();
        return view('anwar',$data);
      }
      elseif($status0 || $status2)
      {
        return redirect('/');
      }
      else
      {
        return redirect('/');
      }
    }
    elseif(Auth::check()) 
    {
      if($status1)
      {
        $data=array();
        $data['iklan']=DB::table('iklan')->join('profileuser','iklan.idpenjual','=','profileuser.id')->select('iklan.*','profileuser.nama_user','profileuser.alamat_kirim')->where('iklan.id_iklan','=',$id)->get();
        return view('anwar',$data);
      }
      elseif($status0 || $status2)
      {
        $pembeli=DB::table('transaksi')->select('id_transaksi')->where('transaksi.idiklan','=',$id)->where('transaksi.idpembeli','=',Auth::user()->id)->get();
        $penjual=DB::table('transaksi')->select('id_transaksi')->where('transaksi.idiklan','=',$id)->where('transaksi.idpenjual','=',Auth::user()->id)->get();
        if($pembeli || $penjual)
        {
          $data=array();
          $data['iklan']=DB::table('iklan')->join('profileuser','iklan.idpenjual','=','profileuser.id')->select('iklan.*','profileuser.nama_user','profileuser.alamat_kirim')->where('iklan.id_iklan','=',$id)->get();
          return view('anwar',$data);
        }
        else
        {
          return redirect('/');
        }
      }
      else
      {
        return redirect('/');
      }
    }
  }

  //form testimoni
  public function testimoni($id)
  {
    if(Auth::check())
    {
      $pembeli=DB::table('transaksi')->select('id_transaksi')->where('transaksi.idiklan','=',$id)->where('transaksi.idpembeli','=',Auth::user()->id)->get();
      if($pembeli)
      {
        return view("testimoni",compact('id'));
      }
      else
      {
        return redirect('/');
      }
    }
    else
    {
      return redirect('/');
    }
  }

  //proses testimoni
  public function testimoniproses(){
    if(Request::isMethod('post'))
    {
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
    elseif(Request::isMethod('get'))
    {
      return redirect('/');
    }
  }

  //proses pembelian
   public function transaksi(){
    if(Request::isMethod('post'))
    {
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
    elseif(Request::isMethod('get'))
    {
    return redirect('/');
    }
  }

  //data penjual
  public function penjual($id){
    if(Auth::check())
    {
      $data=array();
      $data['penjual']=DB::table('transaksi')->join('iklan','transaksi.idiklan','=','iklan.id_iklan')
                                           ->join('profileuser','transaksi.idpenjual','=','profileuser.id')
                                           ->select('profileuser.*')
                                           ->where('transaksi.idpembeli','=',Auth::user()->id)
                                           ->where('transaksi.idiklan','=',$id)->get();
      $dataa=DB::table('transaksi')->join('iklan','transaksi.idiklan','=','iklan.id_iklan')
                                           ->join('profileuser','transaksi.idpembeli','=','profileuser.id')
                                           ->select('transaksi.id_transaksi')
                                           ->where('transaksi.idpembeli','=',Auth::user()->id)
                                           ->where('transaksi.idiklan','=',$id)->get();
      if($dataa)
      {                                   
        return view('penjual',$data);
      }
      else
      {
        return redirect('/');
      }
    }
    else
    {
      return redirect('/');
    }
  }

  //lihat akun
  public function lihatakun(){
    if(Auth::check())
    {
      return view('lihatakun');
    }
    else
    {
      return redirect('/');
    }
  }

  //edit akun
  public function editakun(){
    if(Auth::check())
    {
      return view('editakun');
    }
    else
    {
      return redirect('/');
    }
  }

  //proses edit akun
  public function editproses(){
    if(Request::isMethod('post'))
    {
      $data=Input::all();

      if($data['password']==$data['conpassword'])
      {
            $pass=bcrypt( $data['password']);
            DB::table('profileuser')
              ->where('id', $data['idakun'])
              ->update(['username' => $data['username'], 'password' => $pass, 'nama_user' => $data['nama'],'alamat_user' => $data['asal'], 'no_telp' => $data['telp'], 'alamat_kirim' => $data['kirim'],'email' => $data['email']]);
            Session::flash('message','Berhasil edit akun');
            return redirect('/');
      }
      else
      {
        Session::flash('message','konfirmasi password gagal, akun gagal diedit');
        return redirect('/');
      }
    }
    elseif(Request::isMethod('get'))
    {
      return redirect('/');
    }
  }


  //form edit barang
  public function editbarang($id){
    if(Auth::check())
    {
      $dibeli=DB::table('transaksi')->select('id_transaksi')->where('transaksi.idiklan','=',$id)->where('transaksi.idpenjual','=',Auth::user()->id)->get();
      $penjual=DB::table('iklan')->select('id_iklan')->where('iklan.id_iklan','=',$id)->where('iklan.idpenjual','=',Auth::user()->id)->get();
      if($penjual && !$dibeli)
      {
        return view("editbarang",compact('id'));
      }
      else
      {
        return redirect('/');
      }
    }
     else
    {
      return redirect('/');
    }
  }

  //proses edit barang
  public function editbarangproses(){
    if(Request::isMethod('post'))
    {
      $data=Input::all();
       $rules = array(
              'file' => 'image|max:3000',
          );
      
         // PASS THE INPUT AND RULES INTO THE VALIDATOR
          $validation = Validator::make($data, $rules);
             $file = array_get($data,'file');
             // SET UPLOAD PATH
              $destinationPath = 'uploads';
              // GET THE FILE EXTENSION
              $extension = $file->getClientOriginalExtension();
              $nama= $file->getClientOriginalName();

              // RENAME THE UPLOAD WITH RANDOM NUMBER
              $fileName = $nama; 
              // MOVE THE UPLOADED FILES TO THE DESTINATION DIRECTORY
              $upload_success = $file->move($destinationPath, $fileName);
              $filepath = $destinationPath . '/' . $nama;
      DB::table('iklan')
          ->where('id_iklan', $data['idiklan'])
          ->update(['gambar'=> $filepath, 'judul_iklan' => $data['judul'], 'harga' => $data['harga'], 'deskripsi_iklan' => $data['deskripsi'],'stok' => $data['stok']]);
      Session::flash('message','Berhasil edit barang');
      return redirect('/');
    }
      elseif(Request::isMethod('get'))
    {
      return redirect('/');
    }
  }

  //transaksi pembelian
  public function transaksibeli()
  {
    if(Auth::check())
    {
      $data=array();
      $data['transaksi']=DB::table('transaksi')->join('iklan','transaksi.idiklan','=','iklan.id_iklan')
                                           ->join('profileuser','transaksi.idpenjual','=','profileuser.id')
                                           ->select('iklan.*','profileuser.nama_user')
                                           ->where('transaksi.idpembeli','=',Auth::user()->id)->get();
      return view("transaksibeli",$data);
    }
    else
    {
      return redirect('/');
    }
  }

  //transaksi penjualan
  public function transaksijual()
  {
    if(Auth::check())
    {
      $data=array();
      $data['transaksi']=DB::table('transaksi')->join('iklan','transaksi.idiklan','=','iklan.id_iklan')
                                           ->join('profileuser','transaksi.idpembeli','=','profileuser.id')
                                           ->select('iklan.*','profileuser.nama_user')
                                           ->where('transaksi.idpenjual','=',Auth::user()->id)->get();
      return view("transaksijual",$data);
    }
    else
    {
      return redirect('/');
    }
  }

  //pembatalan transaksi pembelian
  public function batal($id){
    if(Auth::check())
    {
      $beli=DB::table('iklan')->select('iklan.id_iklan')->where('iklan.id_iklan','=',$id)->where('iklan.status','=',0)->get();
      $pembeli=DB::table('transaksi')->select('id_transaksi')->where('transaksi.idiklan','=',$id)->where('transaksi.idpembeli','=',Auth::user()->id)->get();
      if($pembeli && $beli)
      {
        DB::table('transaksi')->where('transaksi.idiklan', '=', $id)->delete();
        DB::table('iklan')->where('id_iklan', $id)->update(['status' => 1]);
        return Redirect::back();
      }
      elseif(!$pembeli || !$beli)
      {
        return redirect('/');
      }
    }
    else
    {
      return redirect('/');
    }
  }

  //konfirmasi transaksi penjualan
  public function konfirmasi($id){
    if(Auth::check())
    {
      $penjual=DB::table('transaksi')->select('id_transaksi')->where('transaksi.idiklan','=',$id)->where('transaksi.idpenjual','=',Auth::user()->id)->get();
      if($penjual)
      {
        DB::table('iklan')->where('id_iklan', $id)->update(['status' => 2]);
        return Redirect::back();
      }
      elseif(!$penjual)
      {
        return redirect('/');
      }
    }
    else
    {
      return redirect('/');
    }
  }

  //pencarian barang
  public function search()
  {
    $datas=Input::all();
    $data=array();
    $data['iklan']=DB::table('iklan')->join('profileuser','iklan.idpenjual','=','profileuser.id')->select('iklan.*','profileuser.nama_user')->where('iklan.status','=',1)->where('iklan.judul_iklan','LIKE','%'.$datas['barang'].'%')->get();
    return view('search',$data);
  }


  /*public function hapusakun($id){
    if(Auth::check())
    {
      if(Auth::user()->id==$id)
      {
        DB::table('profileuser')->where('profileuser.id','=',$id)->delete();
        return redirect('logout');
      }
      else
      {
        return redirect('/');
      }
    }
    else
    {
      return redirect('/');
    }
  }*/

    /*public function hapusbarang($id){
    if(Auth::check())
    {
      $con=DB::table('iklan')->select('iklan.idpenjual')->where('iklan.id_iklan','=',$id)->get();
      if($con!=NULL)
      {
        DB::table('iklan')->where('iklan.id_iklan','=',$id)->delete();
        Session::flash('message','Barang telah dihapus');
        return redirect('/');
      }
      else
      {
        return redirect('/');
      }
    }
    else
    {
      return redirect('/');
    }
  }*/

}

?>
