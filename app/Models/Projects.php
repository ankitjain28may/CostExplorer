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

            $cost_types_ids = [];
            $results[$index] = $project;
            $results[$index]->amount = Costs::costs($project->id)[0]->amount;

            $cost_types = Costs::costTypes($project->id, NULL, $cost_types_id);
            [$costs, $tempp] = Self::childCostTypes($cost_types, $project, $cost_types_id);
            $cost_types_ids = array_merge($cost_types_ids, $tempp);

            $cost_types_ids = array_diff($cost_types_id, $cost_types_ids);
            asort($cost_types_ids);


            if (count($cost_types_ids)) {
                $stopRepeat = [];
                foreach ($cost_types_ids as $key => $value) {
                    if (in_array($value, $stopRepeat)) {
                        continue;
                    }
                    $cost_types = Costs::costTypesNot($project->id, [$value]);
                    [$costs_temp, $tempp] = Self::childCostTypes($cost_types, $project, $cost_types_id);
                    $costs = array_merge($costs, $costs_temp);
                    $stopRepeat = array_merge($stopRepeat, $tempp);

                }

            }
            $results[$index]->costs = $costs;

            if (count($cost_types_id)) {
                $temp = Self::calculateAmount($results[$index]->costs);
                if ($temp) {
                    $results[$index]->amount = $temp;
                }
            }
        }
        return $results;
    }

    public static function childCostTypes($cost_types, $project, $cost_types_id) {
        $cost_types_ids = [];
        $costs = [];
        if (count($cost_types)) {
            foreach ($cost_types as $index => $cost_type) {
                $costs[$index] = $cost_type;
                $cost_types_ids[] = $cost_type->id;
                [$costs[$index]->costs, $tempp] = Self::childCostTypes(Costs::costTypes($project->id, $cost_type->id), $project, $cost_types_id);
                $cost_types_ids = array_merge($cost_types_ids, $tempp);

                if (count($cost_types_id)) {
                    $temp = Self::calculateAmount($costs[$index]->costs);
                    if ($temp) {
                        $costs[$index]->amount = $temp;
                    }
                }
            }
        }
        return [$costs, $cost_types_ids];
    }

    public static function calculateAmount($costs)
    {
        $amount = 0;
        foreach ($costs as $index => $cost) {
            $amount += $cost->amount;
        }
        return $amount;
    }
}
