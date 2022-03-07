
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
   
   $x=4;
   $y=5;

    if ($x>$y){
       echo "x is greater than y <br>";
    }
    else{
       echo "y is greater than x <br>";
    }

    $Course="BCA";

    switch($Course){
        case "BCA":
            echo "Bechelor of computer application <br>";
            break;
        case "BBA":
            echo "Bechelor of Business administration <br>";    
            break;
    }
?>
</body>
</html>