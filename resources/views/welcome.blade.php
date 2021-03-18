<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <style type="text/css">
        #butt{
            border-radius: 7px;
            width: 93px;
            height: 40px;
        }
    </style>
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
                <option selected>Open this select menu</option>
                <option value="1">One</option>
                <option value="2">Two</option>
                <option value="3">Three</option>
            </select>
        </div>
        <div class="col">

        </div>
    </div>
    <div class="row">
        <div class="col">
           <label for="fname" style="margin-left: 182px;">Send Notification From:</label>
       </div>
       <div class="col">
           <select class="form-control" id="exampleFormControlSelect1">
            <option selected>Open this select menu</option>
            <option value="1">One</option>
            <option value="2">Two</option>
            <option value="3">Three</option>
        </select>
    </div>
    <div class="col">

    </div>
</div>   




<div class="form-group">
</div>

<div class="row">
    <div class="col">
        <div class="form-group">
            <div class="form-row">
                <div class="form-group col-md-1">
                  <input type="text" class="form-control" id="inputZip" value="1" disabled style="border-radius: 33px;width: 35px;">
              </div>
              <div class="form-group col-md-4">
                  <select id="inputState" class="form-control">
                    <option selected>Choose...</option>
                    <option>...</option>
                </select>
            </div>
            <div class="form-group col-md-2">
              <select id="inputState" class="form-control">
                <option selected>Choose...</option>
                <option>...</option>
            </select>
        </div>
        <div class="form-group col-md-4">
          <input type="text" class="form-control" id="inputZip">
      </div>
  </div>
</div>
<div class="form-group">
   <p><span disabled="disabled">AND</span> <span>|</span>  <span disabled="disabled">OR</span></p>
</div>
<div class="row">
    <div class="col">
        <div class="form-group">
            <div class="form-row">
                <div class="form-group col-md-1">
                  <input type="text" class="form-control" id="inputZip" value="2" disabled style="border-radius: 33px;width: 35px;">
              </div>
              <div class="form-group col-md-4">
                  <select id="inputState" class="form-control">
                    <option selected>Choose...</option>
                    <option>...</option>
                </select>
            </div>
            <div class="form-group col-md-2">
              <select id="inputState" class="form-control">
                <option selected>Choose...</option>
                <option>...</option>
            </select>
        </div>
        <div class="form-group col-md-4">
          <input type="text" class="form-control" id="inputZip">
      </div>
  </div>
</div>
<div class="form-group">
   <p><span disabled="disabled">AND</span> <span>|</span>  <span disabled="disabled">OR</span></p>
</div>
<div class="row">
    <div class="col">
        <div class="form-group">
            <div class="form-row">
                <div class="form-group col-md-1">
                  <input type="text" class="form-control" id="inputZip" value="3" disabled style="border-radius: 33px;width: 35px;">
              </div>
              <div class="form-group col-md-4">
                  <select id="inputState" class="form-control">
                    <option selected>Choose...</option>
                    <option>...</option>
                </select>
            </div>
            <div class="form-group col-md-2">

              <select id="inputState" class="form-control">
                <option selected>Choose...</option>
                <option>...</option>
            </select>
        </div>
        <div class="form-group col-md-4">
          <input type="text" class="form-control" id="inputZip">
      </div>
  </div>
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
                    <option selected>Select</option>
                    <option>...</option>
                </select>
            </div>
        </div>
    </div>
    <div class="col">
        <div class="form-group">
            <div class="form-row">

                <div class="form-group col-md-4">
                   <div class="form-check">
                      <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                      <label class="form-check-label" for="flexCheckDefault">
                        Activate this Notification
                    </label>
                </div>
            </div>
            <div class="form-group col-md-4">          
            </div>
            <div class="form-group col-md-4">
              <button type="button" style="border-radius: 7px;width: 93px;height: 40px;">Save</button>
          </div>
      </div>
  </div>
</div>


<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>
