<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Hrefs extends Model
{
    use HasFactory;

    protected $fillable = [
        'id',
        'name',
        'image',
        'created_at'
     ];



}
