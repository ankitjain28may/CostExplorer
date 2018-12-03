<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Models\Projects;

class Clients extends Model
{
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'Name',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
    ];

    /**
     * Get the projects for the clients.
     */
    public function breakdown()
    {
        return $this->hasMany(Projects::class, 'Client_ID');
    }
}
