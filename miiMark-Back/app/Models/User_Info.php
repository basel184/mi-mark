<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class User_Info extends Model
{
    use HasFactory;

    protected $fillable = [
        
        'bio',
        'gender',
        'avatar',
        'cover',
        'date_of_birth',
        'mobile',
        'countery',
        'city'
     ];

     public function users()
     {
         return $this->belongsTo(User::class);
     }

}
