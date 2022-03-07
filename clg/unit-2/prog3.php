<?php
    
   include 'databaseConn.php';

    $sql="create table product(
        pro_id int(6) auto_increment primary key,
        pro_name varchar(30) not null,
        pro_price int(5) not null,
        pro_QOH int(4) not null
    )";

    if($conn->query($sql)===TRUE){
        echo "table created successfully";
    }
    else{
        echo $conn->error;
    }
    $conn->close();

?>