<html>
<a href="{{URL::previous()}}" class="button">Back</a>
<table style="width:100%">
  <tr>
    <td>Nama Penjual</td> 
    <td>Lokasi</td>
    <td>Nomor Telepon</td>
    <td>E-mail</td>
  </tr>
  <tr>
  	@foreach($penjual as $post)
    <td>{{$post->nama_user}}</td>
    <td>{{$post->alamat_kirim}}</td>
    <td>{{$post->no_telp}}</td>
    <td>{{$post->email}}</td>
  </tr>
  @endforeach
</table>
</html>