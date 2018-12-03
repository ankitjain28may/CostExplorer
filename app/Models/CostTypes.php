<?php

namespace App\Models;
use App\Models\Costs;

use Illuminate\Database\Eloquent\Model;

class CostTypes extends Model
{
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'Name', 'Parent_Cost_Type_ID',
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
    public function projectCosts()
    {
        return $this->hasMany(Costs::class, 'Cost_Type_ID');
    }

    public function costs()
    {
        return $this->hasMany(Self::class, 'Parent_Cost_Type_ID');
    }

    public function sumCosts()
    {
      return $this->projectCosts()
        ->selectRaw('Cost_Type_ID, sum(amount) as amount')
        ->groupBy('Cost_Type_ID');
    }

    // public function projects()
    // {
    //     return $this->belongsToMany('App\Models\Projects')
    //                     ->using('App\Models\Costs');
    // }
}
