<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Models\Projects;
use App\Models\CostTypes;
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

    public static function costs($project_id)
    {
        $data = DB::table('costs')
            ->join('cost_types as ct', 'costs.Cost_Type_ID', '=', 'ct.id')
            ->groupBy('Project_ID')
            ->select(DB::raw('sum(Amount) as amount'))
            ->where('Project_ID', $project_id)
            ->get();
        return $data;
    }


    public static function costTypes($project_id)
    {
        $data = DB::table('costs')
            ->join('cost_types as ct', 'costs.Cost_Type_ID', '=', 'ct.id')
            ->where('Project_ID', $project_id)
            ->where('ct.Parent_Cost_Type_ID', NULL)
            ->select('ct.id as id', 'ct.Name as name', 'amount')
            ->get();
        return $data;
    }
}
