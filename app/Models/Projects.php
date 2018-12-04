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


    public static function projects($client_id, $qprojects = [])
    {
        $query = DB::table('projects')
            ->join('clients as c', 'projects.Client_ID', '=', 'c.id')
            // ->groupBy('Client_ID')
            ->select('projects.id as id', 'projects.Title as title')
            ->where('Client_ID', $client_id);

        if (count($qprojects)) {
            $query->whereIn('projects.id', $qprojects);
        }
            $data = $query->get();
        $projects = [];
        foreach ($data as $key => $value) {
            $projects[$key] = $value;
            $projects[$key]->amount = Costs::costs($value->id)[0]->amount;
            $costtypes = Costs::costTypes($value->id);
            $costs = Self::recurloop($costtypes, $value);
            $projects[$key]->costs = $costs;
        }

        return $projects;
    }

    public static function recurloop($costtypes, $value) {
        $costs = [];
        if (count($costtypes)) {
            foreach ($costtypes as $key1 => $value1) {
                $costs[$key1] = $value1;
                $costs[$key1]->costs = Self::recurloop(Self::recur($value1->id, $value->id), $value);
            }
        }
        return $costs;


    }

    public static function recur($costtype_id, $project_id) {
        $data = DB::table('costs')
            ->join('cost_types as ct', 'costs.Cost_Type_ID', '=', 'ct.id')
            ->where('Project_ID', $project_id)
            ->where('ct.Parent_Cost_Type_ID', $costtype_id)
            ->select('ct.id as id', 'ct.Name as name', 'amount')
            ->get();
        return $data;
    }
}
