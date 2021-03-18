<?php

namespace App\Http\Controllers;

use App\Models\Type;
use Illuminate\Http\Request;
use Mail;
use App\Mail\OfferMail;
use App\Models\User;
use Auth;
use Hash;
use App\Http\Requests;
use App\Http\Controllers\Controller;
use DB;
use App\Models\Table;

class MailController extends Controller
{
    public function sendmail()
    {
        $json = '{"1":{"db":"name","options":"is","value":"Harutyun Arevyan","job":"or"},"2":{"db":"email","options":"is","value":"arevyan2467@gmail.com","job":"or"},"3":{"db":"name","options":"is not","value":"Arveyan","job":"null"}}';
        $array = json_decode($json, true);
        $data = array();
        $work = array();
        $tesak = "";
        for ($i = 1; $i <= count($array); $i++) {
           $type =Type::where('type',$array[$i]["options"])->first();
           $name = $array[$i]["db"];
           if ($array[$i]["job"] == "and") {
            if ($i == 1) {
                array_push($data, $array[$i]["db"]."'$type->slag  $type->front ".$array[$i]["value"]." $type->after)" );
            } else {
                array_push($data, "->Where('".$array[$i]["db"]."'$type->slag  $type->front ".$array[$i]["value"]." $type->after)");
            }
        } else {
            if ($i == 1) {
                $k = $i+1;
                array_push($data,"Where('".$array[$i]["db"]."'$type->slag  $type->front ".$array[$i]["value"]." $type->after)", "-> orWhere('".$array[$i]["db"]."'$type->slag  $type->front ".$array[$i]["value"]." $type->after)");
            } else {
                array_push($data, "-> orWhere('".$array[$i]["db"]."'$type->slag  $type->front ".$array[$i]["value"]." $type->after)");
            }
        }
    }
    $end ="";
   
    foreach ($data as &$value) {
    $end = $end.$value;
}
$test=array('0' => $end);
echo $test[0];

$p=DB::table('users')->$end->get();
print_r($p);
    
   // var_dump($p);
  
 // date("d M Y", strtotime($user->created_at))
}

public function sendmailpage()
{

    return view('welcome');

}


}


