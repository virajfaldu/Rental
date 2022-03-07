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
    
        $server="localhost";
        $username="root";
        $password="";

        $conn = new mysqli($server, $username, $password);

    
        if($conn->error){
            die("connection has been failed bcoz of ".$conn->error);
        }

        $sql="create database phpPrograms";
        
        if($conn->query($sql)===TRUE){
            echo "database created successfully";
        }
        else{
            echo $conn->error;
        }
        $conn->close();
    
    ?>
</body>
</html>