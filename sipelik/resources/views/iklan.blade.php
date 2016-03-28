<html>
<a href="{{URL::to('register')}}" class="button">Register</a>
<a href="{{URL::to('logout')}}" class="button">Logout</a>
<a href="{{URL::to('masuk')}}" class="button">Login</a>
<a href="{{URL::to('tambahbarang')}}" class="button">Buat Iklan</a>
<table style="width:100%">
  <tr>
    <td>Id_iklan</td>
    <td>Judul_iklan</td> 
    <td>Harga</td>
    <td>Deskripsi</td>
    <td>Stok</td>
    <td>Penjual</td>
  </tr>
  <tr>
  	@foreach($iklan as $post)
    <td>{{$post->id_iklan}}</td>
    <td>{{$post->judul_iklan}}</td>
    <td>{{$post->harga}}</td>
    <td>{{$post->deskripsi_iklan}}</td>
    <td>{{$post->stok}}</td>
    <td>{{$post->nama_user}}</td>
  </tr>
  @endforeach
</table>
</html>