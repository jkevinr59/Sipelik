<?php
use Carbon\Carbon;
$url = Request::path();
?>
<html>
<a href="{{URL::to('iklan')}}" class="button">Katalog</a>
@if(Auth::check())
<a href="{{URL::to('logout')}}" class="button">Logout</a>
<a href="{{URL::to('tambahbarang')}}" class="button">Buat Iklan</a>
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
    <td>Harga</td>
    <td>Deskripsi</td>
    <td>Stok(kg)</td>
    <td>Penjual</td>
  </tr>
  <tr>
  	@foreach($iklan as $post)
    <td>{{$post->judul_iklan}}</td>
    <td>{{$post->harga}}</td>
    <td>{{$post->deskripsi_iklan}}</td>
    <td>{{$post->stok}}</td>
    <td>{{$post->nama_user}}</td>
    @if(Auth::check() && Auth::user()->id!=$post->idpenjual)
    @if($post->status==0)
     <a href="{{URL::to('testimoni')}}/{{$post->id_iklan}}">Buat Testimoni</a>
     <a href="{{URL::to('penjual')}}/{{$post->idpenjual}}">Data Penjual</a>
    @endif
     @if($post->status==1)
        <div>
           <form action="{{URL::to('transaksi')}}" method="POST" enctype="multipart/form-data">
              <div class="form-group">
                <input class="form-control" name="idiklan" type="hidden" value="{{$post->id_iklan}}">
              </div>
              <div class="form-group">
                <input class="form-control" name="idpenjual" type="hidden" value="{{$post->idpenjual}}">
              </div>
              <div class="form-group">
                <input class="form-control" name="idpembeli" type="hidden" value="{{Auth::user()->id}}">
              </div>
              <div class="form-group">
                <input class="form-control" name="tanggal" type="hidden" value="{{Carbon::now()}}">
              </div>
               <div class="form-group">
                <input class="form-control" name="url" type="hidden" value="{{$url}}">
              </div>
              {{csrf_field()}}
             <button class="btn btn-primary btn btn-block">Beli</button>
          </form>
        </div>
  </tr>
  @endif
  @endif
  @endforeach
</table>
</html>