<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Projects;
use App\Models\Clients;
use App\Models\Costs;
use App\Models\CostTypes;
use DB;

class CostExplorerController extends Controller
{

    /**
     * [index description]
     * @return [type] [description]
     */
    public function index()
    {
        $pro = [];
          // dd(Clients::find(1)->projects);

        $users = Clients::with([
            'breakdown' => function ($project) {
                $project->with([
                    'costs' => function ($costtypes) {
                        $costtypes->join('projects as p', 'p.id', '=', 'costs.Project_ID')
                        ->with([
                            'costs' => function ($cost) {
                                $cost->with('sumCosts')
                                ->where('Parent_Cost_Type_ID', '!=', NULL);
                            },
                            'sumCosts',
                        ])
                        ->where('Parent_Cost_Type_ID', NULL);
                    },
                    'sumCosts',
                ]);
            },
        ])->find(1);


        // dd($users);

        // $users = CostTypes::with(['costs' => function ($cost) {
        //     $cost->with(['projectCosts']);
        // }])->find(1);



        die(json_encode($users, true));
        // foreach (Clients::find(1)->projects as $projects) {
        //     foreach ($projects->costTypes as $costtypes) {
        //         $pro[] = $costtypes->costTypes;
        //     }
        //     // $pro[] = $projects->costTypes;
        // }
        // die(json_encode($pro, true));
        // dd(Projects::find(1)->projectCosts);
        // dd(CostTypes::find(1)->costTypes);
    }
}
