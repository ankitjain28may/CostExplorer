<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Models\Costs;
use App\Models\CostTypes;
use DB;

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


    public static function projects($client_id, $projects_id = [], $cost_types_id = [])
    {
        $query = DB::table('projects')
            ->join('clients as c', 'projects.Client_ID', '=', 'c.id')
            ->select('projects.id as id', 'projects.Title as title')
            ->where('Client_ID', $client_id);

        if (count($projects_id)) {
            $query->whereIn('projects.id', $projects_id);
        }

        $data = $query->get();

        $results = [];

        foreach ($data as $index => $project) {

            $results[$index] = $project;
            $results[$index]->amount = Costs::costs($project->id)[0]->amount;

            $cost_types = Costs::costTypes($project->id, NULL, $cost_types_id);
            $costs = Self::childCostTypes($cost_types, $project, $cost_types_id);
            $results[$index]->costs = $costs;
        }

        return $results;
    }

    public static function childCostTypes($cost_types, $project, $cost_types_id) {
        $costs = [];
        if (count($cost_types)) {
            foreach ($cost_types as $index => $cost_type) {
                $costs[$index] = $cost_type;
                $costs[$index]->costs = Self::childCostTypes(Costs::costTypes($project->id, $cost_type->id, $cost_types_id), $project, $cost_types_id);
                // $costs[$index]->amount += Self::calculateAmount($costs[$index]->costs);
            }
        }
        return $costs;
    }

    // public static function calculateAmount($costs)
    // {
    //     $amount = 0;
    //     foreach ($costs as $index => $cost) {
    //         $amount += $cost->amount;
    //     }
    //     return $amount;
    // }
}
