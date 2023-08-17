<?php

namespace App\Models;

use Laravel\Jetstream\HasTeams;
use Laravel\Sanctum\HasApiTokens;
use Bavix\Wallet\Traits\HasWallet;
use Bavix\Wallet\Interfaces\Wallet;
use Laravel\Jetstream\HasProfilePhoto;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;
use Laravel\Fortify\TwoFactorAuthenticatable;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;

class User extends Authenticatable implements MustVerifyEmail , Wallet
{

    use HasWallet;
    use HasApiTokens;
    use HasFactory;
    use HasProfilePhoto;
    use HasTeams;
    use Notifiable;
    use TwoFactorAuthenticatable;



    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'last_name', 'email', 'password', 'address',
        'city',
        'country',
        'phone',
        'facebook_id',
        'avatar', 'provider_id', 'provider',
        'access_token','social_id',
        'social_type'
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password',
        'remember_token',
        'two_factor_recovery_codes',
        'two_factor_secret',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    /**
     * The accessors to append to the model's array form.
     *
     * @var array
     */
    protected $appends = [
        'profile_photo_url',
    ];

    public function shop()
    {
        return $this->hasOne(Shop::class);
    }
    public function subscriptions()
    {
        return $this->belongsToMany(Shop::class, 'subscriptions');
    }
    public function messages()
    {
        return $this->hasMany(Message::class, 'user_id');
    }

    public function contacts()
    {
        return $this->belongsToMany(User::class, 'contacts');
    }

    public function order()
    {
        return $this->hasMany(Order::class, 'user_id');
    }

    public function notification()
    {
        return $this->hasMany(Notification::class, 'user_id');
    }

}
