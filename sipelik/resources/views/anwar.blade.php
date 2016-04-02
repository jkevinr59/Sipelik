<?php
use Carbon\Carbon;
$url = Request::path();
?>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Detail</title>
<link rel="icon" href="" type="image/x-icon">
<link href="{{URL::to ('assets/css/bootstrap.min.css')}}" rel="stylesheet">
<link href="{{URL::to ('assets/css/styles.css')}}" rel="stylesheet">
<script src="{{URL::to('assets/js/jquery-1.11.2.min.js')}}"></script>
<link href="{{URL::to ('assets/plugin/datatables/css/dataTables.bootstrap.css')}}" rel="stylesheet">
<script src="{{URL::to ('assets/plugin/datatables/js/jquery.dataTables.js')}}"></script>
<script src="{{URL::to ('assets/plugin/datatables/js/dataTables.bootstrap.js')}}"></script>
<script src="{{URL::to ('assets/js/bootstrap.min.js')}}"></script>
<script src="{{URL::to ('assets/plugin/TT/js/dataTables.tableTools.js')}}"></script>
<link href="{{URL::to ('assets/plugin/TT/css/dataTables.tableTools.css')}}" rel="stylesheet">

</head>
<a href="{{URL::to('iklan')}}" class="button">Katalog</a>
@if(Auth::check())
<h4>{{Auth::user()->username}}</h4>
<a href="{{URL::to('logout')}}" class="button">Logout</a>
<a href="{{URL::to('lihatakun')}}" class="button">Lihat Akun</a>
<a href="{{URL::to('editakun')}}" class="button">Edit Akun</a>
<a href="{{URL::to('tambahbarang')}}" class="button">Buat Iklan</a>
<a href="{{URL::to('transaksibeli')}}">Transaksi Pembelian</a>
<a href="{{URL::to('transaksijual')}}">Transaksi Penjualan</a>
<!-- <a href="{{URL::to('hapusakun')}}/{{Auth::user()->id}}">Hapus Akun</a -->
@else
<a href="{{URL::to('register')}}" class="button">Register</a>
<a href="{{URL::to('masuk')}}" class="button">Login</a>
@endif
@if (Session::has('message'))
<div class="alert alert-info">{{ Session::get('message') }}</div>
@endif

<table style="width:100%">
  <tr>
    <td>Judul_iklan</td> 
    <td>Harga(/kg)</td>
    <td>Deskripsi</td>
    <td>Stok(kg)</td>
    <td>Penjual</td>
    <td>Lokasi</td>
    <td>gambar</td>
  </tr>
  <tr>
  	@foreach($iklan as $post)
    <td>{{$post->judul_iklan}}</td>
    <td>{{$post->harga}}</td>
    <td>{{$post->deskripsi_iklan}}</td>
    <td>{{$post->stok}}</td>
    <td>{{$post->nama_user}}</td>
    <td>{{$post->alamat_kirim}}</td>
    <td> <?php $bukti=$post->gambar;?><img src="{{URL::to($bukti)}}" height="42" width="42">
  </tr>
    @if(Auth::check() && Auth::user()->id==$post->idpenjual)
    @if($post->status==0)
     <h4>barang sudah terjual</h4>
     @endif
     @if($post->status==1)
    <a href="{{URL::to('editbarang')}}/{{$post->id_iklan}}">Edit Barang</a>
      @endif
    <!-- <a href="{{URL::to('hapusbarang')}}/{{$post->id_iklan}}">Hapus Barang</a> -->
    @endif
    @if(Auth::check() && Auth::user()->id!=$post->idpenjual)
    @if($post->status==0)
     <h4>barang sudah terjual</h4>
     <a href="{{URL::to('testimoni')}}/{{$post->id_iklan}}">Buat Testimoni</a>
     <a href="{{URL::to('penjual')}}/{{$post->id_iklan}}">Data Penjual</a>
    @endif
     @if($post->status==1)
        <div>
          <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Beli</button>
        </div>
  
  @endif
  @endif
  @endforeach
</table>



<!-- Modal -->
<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Modal Header</h4>
      </div>
      <div class="modal-body">
        <p>Apakah anda yakin ingin membeli barang ini?</p>
      </div>
      <div class="modal-footer">
        <form action="{{URL::to('transaksi')}}" method="POST" enctype="multipart/form-data">
              <div class="form-group">
                <input class="form-control" name="idiklan" type="hidden" value="{{$post->id_iklan}}">
              </div>
              <div class="form-group">
                <input class="form-control" name="idpenjual" type="hidden" value="{{$post->idpenjual}}">
              </div>
              @if(Auth::check())
              <div class="form-group">
                <input class="form-control" name="idpembeli" type="hidden" value="{{Auth::user()->id}}">
              </div>
              @endif
              <div class="form-group">
                <input class="form-control" name="tanggal" type="hidden" value="{{Carbon::now()}}">
              </div>
               <div class="form-group">
                <input class="form-control" name="url" type="hidden" value="{{$url}}">
              </div>
              {{csrf_field()}}
            
              <button type="submit" class="btn btn-default" >Yes</button>
              <button type="button" class="btn btn-default" data-dismiss="modal">No</button>
 
         </form>
      </div>
    </div>
  </div>
</div>
</html>