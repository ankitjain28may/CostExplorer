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
     * Handle the incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function __invoke(Request $request)
    {

        // Get query params
        $input = $request->all();
        $qclients = [];
        $qprojects = [];
        $qcost_types = [];
        if (isset($input['clients'])) {
            $qclients = $input['clients'];
        }
        if (isset($input['projects'])) {
            $qprojects = $input['projects'];
        }
        if (isset($input['cost_types'])) {
            $qcost_types = $input['cost_types'];
        }

        // Get the clients
        $clients = Clients::getClients($qclients);
        $data = [];
        foreach ($clients as $index => $client) {
            $data[$index] = $client;
            $data[$index]->amount = 0;
            // Get data of each projects
            $projects = Projects::projects($client->id, $qprojects, $qcost_types);
            foreach ($projects as $key => $project) {
                $data[$index]->amount += $project->amount;
            }
            $data[$index]->breakdown = $projects;
        }

        return response()->json($data, 200);


        /* Eager Loading--------------------------------------------------------
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
        End Eager Loading-------------------------------------------------------
         */
    }
}
