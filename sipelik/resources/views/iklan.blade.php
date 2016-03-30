<html>

@if(Auth::check())
<a href="{{URL::to('logout')}}" class="button">Logout</a>
<a href="{{URL::to('tambahbarang')}}" class="button">Buat Iklan</a>
@else
<a href="{{URL::to('register')}}" class="button">Register</a>
<a href="{{URL::to('masuk')}}" class="button">Login</a>
@endif
<table style="width:100%">
  <tr>
    <td>Judul_iklan</td> 
    <td>Harga</td>
    <td>Deskripsi</td>
    <td>Stok(kg)</td>
    <td>Penjual</td>
  </tr>
  <tr>
  	@foreach($iklan as $post)
    @if($post->status==1)
    <td><a href="{{URL::to('iklan_detail')}}/{{$post->id_iklan}}">{{$post->judul_iklan}}</a></td>
    <td>{{$post->harga}}</td>
    <td>{{$post->deskripsi_iklan}}</td>
    <td>{{$post->stok}}</td>
    <td>{{$post->nama_user}}</td>
    @endif
  </tr>
  @endforeach
</table>
</html>