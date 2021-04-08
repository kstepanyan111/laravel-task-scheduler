    function sum(a) {

      let currentSum = a;

      function f(b) {
        currentSum += b;
        return f;
      }

      f.toString = function() {
        return currentSum;
      };

      return f;
    }

    function add(id){
     var p = document.getElementById("number").value;
     var number = p.split('.');

     console.log(id);
     var h= 1+p ;
     console.log(h);
     document.getElementById("number").value = p+1;
     var o = document.getElementById("div"+id);
     var p_prime = o.cloneNode(true);
     var updatedId = id+8;
     document.getElementById("add").appendChild(p_prime);
     document.getElementById(id).id =h;
     document.getElementById(id).value =h;
     document.getElementById(id+"operator").id = h+"operator";
     document.getElementById(id+"dbname").id =h+"dbname";
     document.getElementById("div"+id).id = "div"+h;
     document.getElementById("all"+id).id = "all"+h;
     document.getElementById("functionadd"+id).id = "functionadd"+h;
     document.getElementById("functionremove"+id).id = "functionremove"+h ;
     document.getElementById("functionadd"+id).value = h;
     document.getElementById("functionremove"+id).value = h ;
     // document.getElementById("functionadd"+h).addEventListener("onclick", add(h));
   }
   function remove($id){
     var p = document.getElementById("number").value;
     var numberre = document.getElementById("number").value;
     var numberre = numberre.split('.');
     var count = p;
     if(count == 1){
     }else{
      var elem = document.getElementById("div"+$id);
      elem.remove();
      if( $id == count-1){
        var elem = document.getElementById("divtwo"+$id);
        elem.remove();
      }else{
        var elem = document.getElementById("divtwo"+$id);
        elem.remove();
      }
      if(count == 1){
        var elem = document.getElementById("divtwo"+$id);
        elem.remove();
      }
      document.getElementById("number").value = p-1;
      console.log($id)
      p =document.getElementById("number").value;
      console.log(p)
      for(var a=0;a==100;a++){
        console.log( document.getElementById("number").value)
        if(document.getElementById(a).value == a)
          document.getElementById(a).id = a;
        document.getElementById(a).value = a;
        document.getElementById(a+"operator").id = a+"operator";
        document.getElementById(a+"dbname").id =a+"dbname";
        document.getElementById("div"+a).id = "div"+a;
        document.getElementById("all"+a).id = "all"+a;
        document.getElementById("functionadd"+a).id = "functionadd"+a;
        document.getElementById("functionremove"+a).id = "functionremove"+a;
      }
    }
  }

  function operator($value,$id){
   var value = $value;
   var id =$id;
   if(value == "DB filde name"){}else{
    $.ajaxSetup({
     headers: {'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')}});$.ajax({type:'POST',url:"operator",data:{value:value,id:id},success: function(data){
       if(data != null){
        document.getElementById($id+"operator").innerHTML = data;

      }}});
   }
 }
 function db($value,$id){
   var value = $value;
   var id =$id;
   if(value == "DB filde name"){}else{
    $.ajaxSetup({
     headers: {'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')}});$.ajax({type:'POST',url:"db",data:{value:value,id:id},success: function(data){
       if(data != null){
        document.getElementById($id+"dbname").innerHTML = data;

      }}});
   }
 }

 function savetage(){
   var p = document.getElementById("number").value;
   var data = [];
   for(var i=1;i<4;i++){
     var db = document.getElementById(i+"db").value;
    var dbname = document.getElementById(i+"dbname").value;
    var options = document.getElementById(i+"operator").value;
    var value = document.getElementById("velue"+i).value;
    if(i<3){
      var k = document.getElementById("radio-one"+i).checked;
      if(k == true){
       var job = document.getElementById("radio-one"+i).value;
     }
     var r =document.getElementById("radio-two"+i).checked;
     if(r == true){
       var job = document.getElementById("radio-two"+i).value;
     }}
     var sentfrom =  document.getElementById("exampleFormControlSelect1").value;
     var sentto = document.getElementById("exampleFormControlSelect2").value;
     var tamp = document.getElementById("inputState").value;
     var status = document.getElementById("flexCheckDefault").value;
     var obj =  {"db":db,"dbname":dbname,"options":options,"value":value,"job":job,"sentto":sentto,"sentfrom":sentfrom,"tamp":tamp,"status":status}
     data.push(obj);
   }
   var myJSON = JSON.stringify(data);
   $.ajaxSetup({
     headers: {'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')}});$.ajax({type:'POST',url:"sendmail",data:{myJSON:myJSON},success: function(data){
       if(data != null){
        if(data == "good"){
          location.reload();
        }
      }}});
 }

