<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Models\Costs;
use App\Models\CostTypes;

class Projects extends Model
{
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'Title', 'Client_ID',
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
        return $this->hasMany(Costs::class, 'Project_ID');
    }

    public function sumCosts()
    {
      return $this->projectCosts()
        ->selectRaw('Project_ID, sum(amount) as amount')
        ->groupBy('Project_ID');
    }

    /**
     * Get the projects for the clients.
     */
    public function costs()
    {
        return $this->belongsToMany(CostTypes::class, 'costs', 'Project_ID', 'Cost_Type_ID');
    }
}
