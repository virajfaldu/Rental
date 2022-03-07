<?php
    
    $server="localhost";
    $username="root";
    $password="";
    $dbname="phpPrograms";
    
    $conn = new mysqli($server, $username, $password,$dbname);


    if($conn->error){
        die("connection has been failed bcoz of ".$conn->error);
    }

?>