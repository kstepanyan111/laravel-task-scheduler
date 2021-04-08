<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Http\Request;
use Mail;
use App\Mail\OfferMail;
use App\Models\User;
use App\Models\Logjob;
use App\Models\Email;
use App\Models\Job;
use App\Models\Operator;
use App\Models\Emailtemps;
use App\Models\Type;
use App\Mail\MyTestMail;
use Auth;
use Hash;
use App\Http\Requests;
use App\Http\Controllers\Controller;
use DB;
use App\Models\Table;


class Trigger extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'start:trigger';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Command description';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
      parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return int
     */
    public function handle()
    {

     $Job =Job::where('status','active')->get();
     foreach ($Job as  $val) {
      $array = json_decode($val->job, true);
      print_r($array);
      $work=array();
      for($i=0;$i<count($array);$i++){
       echo  $addjob= Logjob::create([
        'from'=>$array[0]["sentfrom"],
        'to'=>$array[0]["sentto"],
        'date'=>$val->job,
        'status'=>"start good",
      ]);
       $dbname =$array[$i]["db"];


       if($array[$i]["options"] == "is"){


        $Job = DB::table($dbname)->where($array[$i]["dbname"],'=',$array[$i]["value"])->get();

        if($Job){
          array_push($work, "true");
        }else{
         array_push($work, "false");
       }

     }else if($array[$i]["options"] == "is_not"){


      $Job = DB::table($dbname)->where($array[$i]["dbname"],'=',$array[$i]["value"])->get();

      if($Job){
        array_push($work, "true");
      }else{
       array_push($work, "false");
     }


   }else if($array[$i]["options"] == "contains"){


    $Job = DB::table($dbname)->where($array[$i]["dbname"],'like','%'.$array[$i]["value"].'%')->get();

    if($Job){
      array_push($work, "true");
    }else{
     array_push($work, "false");
   }


 }else if($array[$i]["options"] == "does_not_contain"){
   $Job = DB::table($dbname)->where($array[$i]["dbname"],'!=',$array[$i]["value"])->isEmpty();

   if($Job){
    array_push($work, "true");
  }else{
   array_push($work, "false");
 }

}else if($array[$i]["options"] == "starts_with"){

  $Job = DB::table($dbname)->where($array[$i]["dbname"],'like',$array[$i]["value"].'%')->get();

  if($Job){
    array_push($work, "true");
  }else{
   array_push($work, "false");
 }

}else if($array[$i]["options"] == "end_with"){
  $Job = DB::table($dbname)->where($array[$i]["dbname"],'like','%'.$array[$i]["value"].'%')->get();

  if($Job){
    array_push($work, "true");
  }else{
   array_push($work, "false");
 }

}else if($array[$i]["options"] == "is_empth"){

 $Job = DB::table($dbname)->where($array[$i]["dbname"],'=',$array[$i]["value"])->isEmpty();

 if($Job){
  array_push($work, "true");
}else{
 array_push($work, "false");
}
}else if($array[$i]["options"] == "is_not_empth"){
 $Job = DB::table($dbname)->where($array[$i]["dbname"],'!=',' ')->isEmpty();

 if($Job){
  array_push($work, "true");
}else{
 array_push($work, "false");
}


}else if($array[$i]["options"] == "taday"){
 $Job = DB::table($dbname)->where('created_at','==',strtotime( "today" ))->get();

 if($Job){
  array_push($work, "true");
}else{
 array_push($work, "false");
}



}else if($array[$i]["options"] == "tomorrow"){
 $time = date( 'Y-m-d', strtotime('previous days'));
 $Job = DB::table($dbname)->where('created_at','==', $time)->get();

 if($Job){
  array_push($work, "true");
}else{
 array_push($work, "false");
}

}else if($array[$i]["options"] == "yestrday"){
 $Job = DB::table($dbname)->where('created_at','==', date( "Y-m-d", strtotime( "next days" ) ))->get();

 if($Job){
  array_push($work, "true");
}else{
 array_push($work, "false");
}


}else if($array[$i]["options"] == "last_week"){
  $Job = DB::table($dbname)->where('created_at','==', date( "Y-m-d", strtotime( "previous week" ) ))->get();

  if($Job){
    array_push($work, "true");
  }else{
   array_push($work, "false");
 }



}else if($array[$i]["options"] == "current_week"){
 $Job = DB::table($dbname)->where('created_at','==', date( "Y-m-d", strtotime( "this week" ) ))->get();

 if($Job){
  array_push($work, "true");
}else{
 array_push($work, "false");
}


}else if($array[$i]["options"] == "next_week"){
  $Job = DB::table($dbname)->where('created_at','==', date( "Y-m-d", strtotime( "next week" ) ))->get();

  if($Job){
    array_push($work, "true");
  }else{
   array_push($work, "false");
 }



}else if($array[$i]["options"] == "last_7_days"){
 $Job = DB::table($dbname)->where('created_at','==', date( "Y-m-d", strtotime( "this week" ) ))->get();

 if($Job){
  array_push($work, "true");
}else{
 array_push($work, "false");
}



}else if($array[$i]["options"] == "last_month"){
 $Job = DB::table($dbname)->where('created_at','==', date( "Y-m-d", strtotime( "previous month" ) ))->get();

 if($Job){
  array_push($work, "true");
}else{
 array_push($work, "false");
}



}else if($array[$i]["options"] == "this_month"){
 $Job = DB::table($dbname)->where('created_at','==', date( "Y-m-d", strtotime( "this month" ) ))->get();

 if($Job){
  array_push($work, "true");
}else{
 array_push($work, "false");
}


}else if($array[$i]["options"] == "next_month"){
  $Job = DB::table($dbname)->where('created_at','==', date( "Y-m-d", strtotime( "next month" ) ))->get();

  if($Job){
    array_push($work, "true");
  }else{
   array_push($work, "false");
 }


}else if($array[$i]["options"] == ">"){

 $Job = DB::table($dbname)->where($array[$i]["dbname"],'>',$array[$i]["value"])->get();

 if($Job){
  array_push($work, "true");
}else{
 array_push($work, "false");
}

}else if($array[$i]["options"] == "="){

  $Job = DB::table($dbname)->where($array[$i]["dbname"],'=',$array[$i]["value"])->get();

  if($Job){
    array_push($work, "true");
  }else{
   array_push($work, "false");
 }
}else if($array[$i]["options"] == "<"){

 $Job = DB::table($dbname)->where($array[$i]["dbname"],'<',$array[$i]["value"])->get();

 if($Job){
  array_push($work, "true");
}else{
 array_push($work, "false");
}
}else if($array[$i]["options"] == ">="){
  $Job = DB::table($dbname)->where($array[$i]["dbname"],'>=',$array[$i]["value"])->get();

  if($Job){
    array_push($work, "true");
  }else{
   array_push($work, "false");
 }

}else if($array[$i]["options"] == "<="){

 $Job = DB::table($dbname)->where($array[$i]["dbname"],'<=',$array[$i]["value"])->get();

 if($Job){
  array_push($work, "true");
}else{
 array_push($work, "false");
}
}else if($array[$i]["options"] == "!="){
 $Job = DB::table($dbname)->where($array[$i]["dbname"],'!=',$array[$i]["value"])->get();

 if($Job){
  array_push($work, "true");
}else{
 array_push($work, "false");
}

}else if($array[$i]["options"] == "is_empth"){
 $Job = DB::table($dbname)->where($array[$i]["dbname"],'!=',$array[$i]["value"])->isEmpty();

 if($Job){
  array_push($work, "true");
}else{
 array_push($work, "false");
}

}else if($array[$i]["options"] == "is_not_empth"){
  $Job = DB::table($dbname)->where($array[$i]["dbname"],'!=',' ')->isEmpty();

  if($Job){
    array_push($work, "true");
  }else{
   array_push($work, "false");
 }

}


}
}

function send($a,$b){
 echo  $data =$b;
 echo  $sendto =$a;
 Mail::to( $sendto)->send(new OfferMail($data));

          //Check if sending email failure
 if (!Mail::failures()) {
            //Give response message success if success to send email
   echo  $addjob= Logjob::create([
        'from'=>'from',
        'to'=>$a,
        'date'=>$b,
        'status'=>"send good",
      ]);
 } else {
            //Give response message failed if failed to send email
    echo  $addjob= Logjob::create([
        'from'=>'from',
        'to'=>$a,
        'date'=>$b,
        'status'=>"send error",
      ]);
   
 }

}
try{ for($i=0;$i<count($work);$i++){
  if($i == 0 && $i == 1){
   if($array[$i]["job"]=="and"){
     if($work[$i] == $work[$i+1]){
      
      echo send( $array[0]["sentto"],$array[0]["tamp"]);
      echo  $addjob= Logjob::create([
        'from'=>$array[0]["sentfrom"],
        'to'=>$array[0]["sentto"],
        'date'=>$val->job,
        'status'=>"send good",
      ]);
    }
  }
}else{
 
 echo send($array[0]["sentto"],$array[0]["tamp"]);
 
}
}}catch (ArithmeticError | Exception $e) {
  echo  $addjob= Logjob::create([
    'from'=>$array[0]["sentfrom"],
    'to'=>$array[0]["sentto"],
    'date'=>$val->job,
    'status'=>"error",
  ]);
}



}

}