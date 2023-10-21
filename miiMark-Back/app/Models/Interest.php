<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;
class Interest extends Model
{
    use HasFactory;
    protected $fillable = ['user_id', 'activity_id'];

    protected static function boot()
    {
        parent::boot();

        static::saving(function ($interest) {
            $rules = [
                'activity_id' => [
                    'required',
                    Rule::unique('interests')->where(function ($query) use ($interest) {
                        return $query->where('user_id', $interest->user_id);
                    })->ignore($interest->getKey())
                ]
            ];

            $validator = Validator::make($interest->toArray(), $rules);

            if ($validator->fails()) {
                throw new \Exception('Duplicate entry found.');
            }
        });
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function activity()
    {
        return $this->belongsTo(Activity::class);
    }
}
