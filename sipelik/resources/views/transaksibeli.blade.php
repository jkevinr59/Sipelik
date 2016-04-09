<html>
<a href="{{URL::to('/')}}" class="button">Katalog</a>
@if(Auth::check())
<h4>{{Auth::user()->username}}</h4>
<a href="{{URL::to('logout')}}" class="button">Logout</a>
<a href="{{URL::to('tambahbarang')}}" class="button">Buat Iklan</a>
<a href="{{URL::to('editakun')}}" class="button">Edit Akun</a>
<a href="{{URL::to('transaksibeli')}}">Transaksi Pembelian</a>
<a href="{{URL::to('transaksijual')}}">Transaksi Penjualan</a>
<!-- <a href="{{URL::to('hapusakun')}}/{{Auth::user()->id}}">Hapus Akun</a> -->
@else
<a href="{{URL::to('register')}}" class="button">Register</a>
<a href="{{URL::to('masuk')}}" class="button">Login</a>
@endif
@if (Session::has('message'))
<div class="alert alert-info">{{ Session::get('message') }}</div>
@endif

@if(empty($transaksi))
<h2>Anda belom melakukan pembelian apapun</h2>
@else
<table style="width:100%">
  <tr>
    <td>Judul_iklan</td> 
    <td>Harga(/kg)</td>
    <td>Deskripsi</td>
    <td>Stok(kg)</td>
    <td>Penjual</td>
    <td>gambar</td>
  </tr>
  <tr>
  	@foreach($transaksi as $post)
    <td><a href="{{URL::to('iklan_detail')}}/{{$post->id_iklan}}">{{$post->judul_iklan}}</a></td>
    <td>{{$post->harga}}</td>
    <td>{{$post->deskripsi_iklan}}</td>
    <td>{{$post->stok}}</td>
    <td>{{$post->nama_user}}</td>
    <td> <?php $bukti=$post->gambar;?><img src="{{URL::to($bukti)}}" height="42" width="42">
  </tr>
  @endforeach
</table>
@endif
</html>