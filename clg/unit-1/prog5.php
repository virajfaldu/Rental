
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

    $student=array("pratixa bam"=>19,"krupa badi"=>34,"dhruv"=>23,"ishani limbu"=>18,"viraj"=>28);

    echo $student['pratixa bam']."hello<br>";

    foreach($student as $s=>$s_value){
        echo $s.":".$s_value."<br>";
    }

?>
</body>
</html>