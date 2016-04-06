<html>
<a href="{{URL::to('/')}}" class="button">Katalog</a>
<a href="{{URL::to('logout')}}" class="button">Logout</a>
<a href="{{URL::to('tambahbarang')}}" class="button">Buat Iklan</a>
<a href="{{URL::to('editakun')}}" class="button">Edit Akun</a>
<!-- <a href="{{URL::to('hapusakun')}}/{{Auth::user()->id}}">Hapus Akun</a> -->
<table style="width:100%">
  <tr>
    <td>Username</td> 
    <td>Nama</td>
    <td>Alamat Asal</td>
    <td>Alamat Kirim</td>
    <td>Nomor Telepon</td>
    <td>Email</td>
  </tr>
  <tr>
    <td>{{Auth::user()->username}}</td>
    <td>{{Auth::user()->nama_user}}</td>
    <td>{{Auth::user()->alamat_user}}</td>
    <td>{{Auth::user()->alamat_kirim}}</td>
    <td>{{Auth::user()->no_telp}}</td>
    <td>{{Auth::user()->email}}</td>
  </tr>
</table>
</html>