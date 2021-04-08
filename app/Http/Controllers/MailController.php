<?php

namespace App\Http\Controllers;


use Illuminate\Http\Request;
use Mail;
use App\Mail\OfferMail;
use App\Models\User;
use App\Models\Email;
use App\Models\Job;
use App\Models\Operator;
use App\Models\Emailtemps;
use App\Models\Type;
use Auth;
use Hash;
use App\Http\Requests;
use App\Http\Controllers\Controller;
use DB;
use App\Models\Table;

class MailController extends Controller
{
    public function sendmail(Request $data)
    {
    
        $json =$data['myJSON'];
         // '{"1":{"db":"name","options":"is","value":"Harutyun Arevyan","job":"or"},"2":{"db":"email","options":"is","value":"arevyan2467@gmail.com","job":"or"},"3":{"db":"name","options":"is not","value":"Arveyan","job":"null"}}';
        $array = json_decode($json, true);
         $addjob= Job::create([
            'frome'=>$array[0]["sentfrom"],
            'to'=>$array[0]["sentto"],
            'job'=>$json,
            'tamp'=>$array[0]["tamp"],
            'status'=>$array[0]["status"],
        ]);
         echo "good";
  
 // date("d M Y", strtotime($user->created_at))
}

public function sendmailpage()
{
    $email = Email::all();
    $type = Type::all();
    $emailtemps =Emailtemps::all();
    $db =Table::distinct()->get(['table']);

    return view('welcome',['email'=>$email,'emailtemps'=>$emailtemps,'db'=>$db]);
}
public function db(Request $data)
{
    $db =Table::where('table',$data['value'])->get();

   foreach ($db as  $val) {
       echo ' <option value="'.$val->tablefild.'">'.$val->tablefild.'</option>';
   }
}

public function operator(Request $data)
{    $db =Table::where('tablefild',$data['value'])->first();
    $operator =Operator::where('type',$db->type)->get();
   foreach ($operator as  $val) {
       echo ' <option value="'.$val->operator.'">'.$val->operator.'</option>';
   }
}

public function cron()
{




}



}


