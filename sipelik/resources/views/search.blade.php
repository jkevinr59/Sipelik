@extends('app')
@section('content')
<div class="container-fluid">
  <div class="row">
    <div class="col-md-8 col-md-offset-2">
    @if(empty($iklan))
      <h1>Tidak ada barang yang dijual</h1>
    @else
      <div class="panel panel-info">        
        <div class="panel-heading">Daftar Ikan</div>
        <div class="panel-body">
          <table class="table table-hover table-stripped">
            <tr>
              <td>Judul_iklan</td> 
              <td>Harga(/kg)</td>
              <td>Deskripsi</td>
              <td>Stok(kg)</td>
              <td>Penjual</td>
              <td>gambar</td>
            </tr>
            @foreach($iklan as $post)
            <tr>
              <td><a href="{{URL::to('iklan_detail')}}/{{$post->id_iklan}}">{{$post->judul_iklan}}</a></td>
              <td>{{$post->harga}}</td>
              <td>{{$post->deskripsi_iklan}}</td>
              <td>{{$post->stok}}</td>
              <td>{{$post->nama_user}}</td>
              <td> <?php $bukti=$post->gambar;?><img src="{{URL::to($bukti)}}" height="42" width="42"></td>
            </tr>
            @endforeach
          </table>
        </div>
      </div>
    @endif
    </div>
  </div>
</div>
@endsection