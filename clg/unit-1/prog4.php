
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
<?php
   
   $sub=array("php","sell script","cloud computing","software testing","data mining");

   for($i=0;$i<count($sub);$i++){
       echo "$sub[$i]<br>";
    }
    echo "<br>";
    foreach($sub as $s){
       echo "$s<br>";
   }
    
?>
</body>
</html>