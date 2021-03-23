<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
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


class Trigger extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'command:name';

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
                if($array[$i]["db"] == "and"){
                    if($array[$i]["option"] == "is"){

                             $Job =User::where($array[$i]["db"],'=',$array[$i]["value"])->get();

                             if($Job){
                                array_push($work, "true");
                             }else{
                                 array_push($work, "false");
                             }

                    }else if($array[$i]["option"] == "is_not"){


                              $Job =User::where($array[$i]["db"],'=',$array[$i]["value"])->get();

                             if($Job){
                                array_push($work, "true");
                             }else{
                                 array_push($work, "false");
                             }


                    }else if($array[$i]["option"] == "contains"){


                              $Job =User::where($array[$i]["db"],'like','%'.$array[$i]["value"].'%')->get();

                             if($Job){
                                array_push($work, "true");
                             }else{
                                 array_push($work, "false");
                             }
                               

                    }else if($array[$i]["option"] == "does_not_contain"){
                             $Job =User::where($array[$i]["db"],'!=',$array[$i]["value"])->isEmpty();

                             if($Job){
                                array_push($work, "true");
                             }else{
                                 array_push($work, "false");
                             }



                    }else if($array[$i]["option"] == "starts_with"){

                                $Job =User::where($array[$i]["db"],'like',$array[$i]["value"].'%')->get();

                             if($Job){
                                array_push($work, "true");
                             }else{
                                 array_push($work, "false");
                             }
            
                    }else if($array[$i]["option"] == "end_with"){
                                $Job =User::where($array[$i]["db"],'like','%'.$array[$i]["value"].'%')->get();

                             if($Job){
                                array_push($work, "true");
                             }else{
                                 array_push($work, "false");
                             }

                    }else if($array[$i]["option"] == "is_empth"){

                             $Job =User::where($array[$i]["db"],'=',$array[$i]["value"])->isEmpty();

                             if($Job){
                                array_push($work, "true");
                             }else{
                                 array_push($work, "false");
                             }
                    }else if($array[$i]["option"] == "is_not_empth"){
                             $Job =User::where($array[$i]["db"],'!=',' ')->isEmpty();

                             if($Job){
                                array_push($work, "true");
                             }else{
                                 array_push($work, "false");
                             }

                        
                    }else if($array[$i]["option"] == "taday"){
                           $Job =User::where('created_at','==',strtotime( "today" ))->get();

                             if($Job){
                                array_push($work, "true");
                             }else{
                                 array_push($work, "false");
                             }

 
                        
                    }else if($array[$i]["option"] == "tomorrow"){
                             $time = date( 'Y-m-d', strtotime('previous days'));
                            $Job =User::where('created_at','==', $time)->get();

                             if($Job){
                                array_push($work, "true");
                             }else{
                                 array_push($work, "false");
                             }
                        
                    }else if($array[$i]["option"] == "yestrday"){
                             $Job =User::where('created_at','==', date( "Y-m-d", strtotime( "next days" ) ))->get();

                             if($Job){
                                array_push($work, "true");
                             }else{
                                 array_push($work, "false");
                             }

                        
                    }else if($array[$i]["option"] == "last_week"){
                              $Job =User::where('created_at','==', date( "Y-m-d", strtotime( "previous week" ) ))->get();

                             if($Job){
                                array_push($work, "true");
                             }else{
                                 array_push($work, "false");
                             }


                        
                    }else if($array[$i]["option"] == "current_week"){
                         $Job =User::where('created_at','==', date( "Y-m-d", strtotime( "this week" ) ))->get();

                             if($Job){
                                array_push($work, "true");
                             }else{
                                 array_push($work, "false");
                             }

                        
                    }else if($array[$i]["option"] == "next_week"){
                        $Job =User::where('created_at','==', date( "Y-m-d", strtotime( "next week" ) ))->get();

                             if($Job){
                                array_push($work, "true");
                             }else{
                                 array_push($work, "false");
                             }


                        
                    }else if($array[$i]["option"] == "last_7_days"){
                         $Job =User::where('created_at','==', date( "Y-m-d", strtotime( "this week" ) ))->get();

                             if($Job){
                                array_push($work, "true");
                             }else{
                                 array_push($work, "false");
                             }


                        
                    }else if($array[$i]["option"] == "last_month"){
                         $Job =User::where('created_at','==', date( "Y-m-d", strtotime( "previous month" ) ))->get();

                             if($Job){
                                array_push($work, "true");
                             }else{
                                 array_push($work, "false");
                             }


                        
                    }else if($array[$i]["option"] == "this_month"){
                         $Job =User::where('created_at','==', date( "Y-m-d", strtotime( "this month" ) ))->get();

                             if($Job){
                                array_push($work, "true");
                             }else{
                                 array_push($work, "false");
                             }

                        
                    }else if($array[$i]["option"] == "next_month"){
                        $Job =User::where('created_at','==', date( "Y-m-d", strtotime( "next month" ) ))->get();

                             if($Job){
                                array_push($work, "true");
                             }else{
                                 array_push($work, "false");
                             }

                        
                    }else if($array[$i]["option"] == ">"){

                             $Job =User::where($array[$i]["db"],'>',$array[$i]["value"])->get();

                             if($Job){
                                array_push($work, "true");
                             }else{
                                 array_push($work, "false");
                             }
                        
                    }else if($array[$i]["option"] == "="){

                              $Job =User::where($array[$i]["db"],'=',$array[$i]["value"])->get();

                             if($Job){
                                array_push($work, "true");
                             }else{
                                 array_push($work, "false");
                             }
                    }else if($array[$i]["option"] == "<"){

                             $Job =User::where($array[$i]["db"],'<',$array[$i]["value"])->get();

                             if($Job){
                                array_push($work, "true");
                             }else{
                                 array_push($work, "false");
                             }
                    }else if($array[$i]["option"] == ">="){
                              $Job =User::where($array[$i]["db"],'>=',$array[$i]["value"])->get();

                             if($Job){
                                array_push($work, "true");
                             }else{
                                 array_push($work, "false");
                             }
                             
                    }else if($array[$i]["option"] == "<="){

                               $Job =User::where($array[$i]["db"],'<=',$array[$i]["value"])->get();

                             if($Job){
                                array_push($work, "true");
                             }else{
                                 array_push($work, "false");
                             }
                    }else if($array[$i]["option"] == "!="){
                               $Job =User::where($array[$i]["db"],'!=',$array[$i]["value"])->get();

                             if($Job){
                                array_push($work, "true");
                             }else{
                                 array_push($work, "false");
                             }
                        
                    }else if($array[$i]["option"] == "is_empth"){
                                 $Job =User::where($array[$i]["db"],'!=',$array[$i]["value"])->isEmpty();

                             if($Job){
                                array_push($work, "true");
                             }else{
                                 array_push($work, "false");
                             }
                        
                    }else if($array[$i]["option"] == "is_not_empth"){
                        $Job =User::where($array[$i]["db"],'!=',' ')->isEmpty();

                             if($Job){
                                array_push($work, "true");
                             }else{
                                 array_push($work, "false");
                             }

                        
                    }



                }

         }

            for($i=0;$i<count($work);$i++){
                if($i == 0 && $i == 1){
                 if($array[$i]["job"]=="and"){
                   if($work[$i] == $work[$i+1]){
                        $details = [
        'title' => $array[0]["sentfrom"],
        'body' => $array[0]["tamp"]
    ];
   
    \Mail::to($array[0]["sentto"])->send(new \App\Mail\MyTestMail($details));}
                   }
                 }else{
                     if($work[$i] != $work[$i+1]){
                        $details = [
        'title' => $array[0]["sentfrom"],
        'body' => $array[0]["tamp"]
    ];
   
    \Mail::to($array[0]["sentto"])->send(new \App\Mail\MyTestMail($details));}

                 }
             }

            }

   }






  
    }
}
