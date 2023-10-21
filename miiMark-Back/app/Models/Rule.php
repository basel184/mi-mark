<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Rule extends Model
{
    use HasFactory;

    protected $fillable = [
        'id',
        'name',
        'image',
     ];

     public function users()
     {
         return $this->hasMany(User::class);
     }

}
