<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use DB;

class Costs extends Model
{
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'Amount', 'Cost_Type_ID', 'Project_ID',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
    ];

    // Calculate the cost of the project
    public static function costs($project_id, $cost_types_id = [])
    {
        $query = DB::table('costs')
            ->join('cost_types as ct', 'costs.Cost_Type_ID', '=', 'ct.id')
            ->groupBy('Project_ID')
            ->select(DB::raw('sum(Amount) as amount'))
            ->where('Project_ID', $project_id)
            ->where('ct.Parent_Cost_Type_ID', NULL);

        if (count($cost_types_id)) {
            $query->whereIn('ct.id', $cost_types_id);
        }

        $data = $query->get();
        return $data;
    }

    // Get the cost_type wrt to project_id and cost_type_id
    public static function costTypes($project_id, $cost_type_id = NULL, $cost_types_id = [])
    {
        $query = DB::table('costs')
            ->join('cost_types as ct', 'costs.Cost_Type_ID', '=', 'ct.id')
            ->where('Project_ID', $project_id)
            ->where('ct.Parent_Cost_Type_ID', $cost_type_id)
            ->select('ct.id as id', 'ct.Name as name', 'amount');

        if (count($cost_types_id)) {
            $query->whereIn('ct.id', $cost_types_id);
        }

        $data = $query->get();
        return $data;
    }

    public static function costTypesNot($project_id, $cost_types_ids)
    {
        $query = DB::table('costs')
            ->join('cost_types as ct', 'costs.Cost_Type_ID', '=', 'ct.id')
            ->where('Project_ID', $project_id)
            ->select('ct.id as id', 'ct.Name as name', 'amount')
            ->whereIn('ct.id', $cost_types_ids);

        $data = $query->get();
        return $data;
    }
}
