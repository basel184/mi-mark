<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Follower extends Model
{
    protected $fillable = ['user_id', 'follower_id'];

    // تعريف العلاقة مع جدول المستخدمين
    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }

    // تعريف العلاقة مع جدول المتابعين
    public function follower()
    {
        return $this->belongsTo(User::class, 'follower_id');
    }
}
