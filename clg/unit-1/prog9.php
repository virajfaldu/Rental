
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


    $list=array(3,5,7,9,8,2,65,10);
    sort($list);
    echo "asending order<br>";
    foreach($list as $l){
        echo $l." ";
    }
    
    rsort($list);
    echo "<br>desending order<br>";
    foreach($list as $l){
        echo $l." ";
    }
?>
</body>
</html>