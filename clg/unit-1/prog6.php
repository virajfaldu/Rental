
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

    $parent=array(array("volvo",4,2),array("BMW",4,2),array("odi",4,2));

    // echo $parent[1][0];
    foreach($parent as $p){
        foreach($p as $child){
            echo $child." ";
        }
        echo "<br>";
    }
?>
</body>
</html>