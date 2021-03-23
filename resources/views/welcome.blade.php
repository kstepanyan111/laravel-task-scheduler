<!doctype html>
<html lang="en">
<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="csrf-token" content="{{ csrf_token() }}">
  <!-- Bootstrap CSS -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <script src="js/function.js"></script>
  
  <title>Notification System</title>
</head>
<body>
  <p style="text-align: center;">Notification System</p>
  <div class="container">
    <div class="form-group">
      <div class="row">
        <div class="col">
         <label for="fname" style="margin-left: 182px;">Send Notification From:</label>
       </div>
       <div class="col">
        <select class="form-control" id="exampleFormControlSelect1">

          <option selected>Send Notification From:</option>
          @foreach($email as $mail)
          <option value="{{$mail->email}}">{{$mail->email}}</option>
          @endforeach
        </select>
      </div>
      <div class="col">

      </div>
    </div>
    <div class="row">
      <div class="col">
       <label for="fname" style="margin-left: 182px;">Send Notification To:</label>
     </div>
     <div class="col">
       <select class="form-control" id="exampleFormControlSelect2">
        <option selected>Send Notification To:</option>
        @foreach($email as $mail)
        <option value="{{$mail->email}}">{{$mail->email}}</option>
        @endforeach
      </select>
    </div>
    <div class="col">

    </div>
  </div>   




  <div class="form-group">
  </div>
  <?php 
  $p= "";

  echo ' <input type="hidden" id="number" value="3">';
  echo ' <input type="hidden" id="remove" value="1.2.3">';

  ?>
  @for ($i = 1; $i < 4; $i++)
  @if($i+1 == 4)
  <div class="row"  id="all{{$i}}">
    <div class="col">
      <div class="form-group" id="div{{$i}}">
        <div class="form-row">
          <div class="form-group col-md-1">
            <input type="text" class="form-control" id="{{$i}}" value="{{$i}}" disabled style="border-radius: 33px;width: 35px;">
          </div>
          <div class="form-group col-md-4">
            <select onclick="operator(this.value,'{{$i}}')"  id="{{$i}}dbname" class="form-control">
              <option selected>DB filde name</option>
              @foreach($operator as $mail)
              <option onclick="operator(this.value,'{{$i}}')" value="{{$mail->dbname}}">{{$mail->dbname}}</option>
              @endforeach
            </select>
          </div>
          <div class="form-group col-md-2">
            <select id="{{$i}}operator" class="form-control">
              <option selected>Operator...</option>

            </select>
          </div>
          <div class="form-group col-md-3">
            <input type="text" class="form-control" id="velue{{$i}}">
          </div>
          <div class="form-group col-md-1">
            <input type="image" src="img/plus.png" value="{{$i}}" onclick="add(this.value)"  id="functionadd{{$i}}" alt="Submit" width="30" height="30">
            <input type="image" src="img/minus.png" value="{{$i}}" onclick="remove(this.value)" id="functionremove{{$i}}" alt="Submit" width="30" height="30">
          </div>
        </div>
      </div>


      @else
      <div class="row" id="all{{$i}}">
        <style type="text/css">
          .switch-field{{$i}} {
            display: flex;
            margin-bottom: 36px;
            overflow: hidden;
          }

          .switch-field{{$i}} input {
            position: absolute !important;
            clip: rect(0, 0, 0, 0);
            height: 1px;
            width: 1px;
            border: 0;
            overflow: hidden;
          }

          .switch-field{{$i}} label {
            color:#8999a7;
            padding: 8px 16px;
            transition: all 0.1s ease-in-out;
          }

          .switch-field{{$i}} label:hover {
            cursor: pointer;
          }

          .switch-field{{$i}} input:checked + label {
            color: #191919;
            box-shadow: none;
          }

          .switch-field{{$i}} label:first-of-type {
            border-radius: 4px 0 0 4px;
          }

          .switch-field{{$i}} label:last-of-type {
            border-radius: 0 4px 4px 0;
          }

          /* This is just for CodePen. */

          .form{{$i}} {
            max-width: 600px;
            font-family: "Lucida Grande", Tahoma, Verdana, sans-serif;
            font-weight: normal;
            line-height: 1.625;
            margin: 8px auto;
            padding: 16px;
          }

          h2 {
            font-size: 18px;
            margin-bottom: 8px;
          }
        </style>
        <div class="col">
          <div class="form-group" id="div{{$i}}">
            <div class="form-row">
              <div class="form-group col-md-1">
                <input type="text" class="form-control" id="{{$i}}" value="{{$i}}" disabled style="border-radius: 33px;width: 35px;">
              </div>
              <div class="form-group col-md-4">
                <select onclick="operator(this.value,'{{$i}}')" id="{{$i}}dbname" class="form-control">
                 <option selected>DB filde name</option>
                 @foreach($operator as $mail)
                 <option onclick="operator(this.value,'{{$i}}')" value="{{$mail->dbname}}">{{$mail->dbname}}</option>
                 @endforeach
               </select>
             </div>
             <div class="form-group col-md-2">
              <select id="{{$i}}operator" class="form-control">
                <option selected>Choose...</option>
                <option>...</option>
              </select>
            </div>
            <div class="form-group col-md-3">
              <input type="text" class="form-control" id="velue{{$i}}">
            </div>
            <div class="form-group col-md-1">
             <input type="image" src="img/plus.png" value="{{$i}}" onclick="add(this.value)"  id="functionadd{{$i}}" alt="Submit" width="30" height="30">
             <input type="image" src="img/minus.png" value="{{$i}}" onclick="remove(this.value)" id="functionremove{{$i}}" alt="Submit" width="30" height="30"> 
           </div>
         </div>
       </div>
       <div class="form-group" id="divtwo{{$i}}">
        <p><div class="switch-field{{$i}}">
          <input type="radio" id="radio-one{{$i}}" name="switch-one{{$i}}" value="and" checked/>
          <label for="radio-one{{$i}}">AND</label>
          <span style="margin-top: 0.5%;">|</span>
          <input type="radio" id="radio-two{{$i}}" name="switch-one{{$i}}" value="or" />
          <label for="radio-two{{$i}}">OR</label>
        </div></p>
      </div>
      @endif
      @endfor
      <div id="add">
      </div>
      <div class="row">
        <div class="col">
          <div class="form-group">
            <div class="form-row">
              <div class="col-auto">
                <label for="inputPassword6" class="col-form-label">Send this Natification:</label>
              </div>
              <div class="form-group col-md-2">
                <select id="inputState" class="form-control">
                  <option selected>DB filde name</option>
                  @foreach($emailtemps as $mail)
                  <option  value="{{$mail->id_tamps}}">{{$mail->id_tamps}}</option>
                  @endforeach
                </select>
              </div>
            </div>
          </div>
          <div class="col">
            <div class="form-group">
              <div class="form-row">
                <div class="form-group col-md-4">
                 <div class="form-check">
                  <input class="form-check-input" type="checkbox" value="active" id="flexCheckDefault">
                  <label class="form-check-label" for="flexCheckDefault">
                    Activate this Notification
                  </label>
                </div>
              </div>
              <div class="form-group col-md-4">          
              </div>
              <div class="form-group col-md-4">
                <a href="/"><img src="img/remove.png" style="width: 40px;"></a><button onclick="savetage()" type="button" style="border-radius: 7px;width: 93px;height: 40px;">Save</button>
              </div>
            </div>
          </div>
        </div>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
      </body>
      </html>
