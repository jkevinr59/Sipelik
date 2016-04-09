<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Profile extends Model
{
	public $table = "profileuser";
    protected $fillable = array(
	'id',
	'nama_user',
	'alamat_user',
	'no_telp',
	'alamat_kirim',
	'email',
	'username',
	'password'

    	);
}
