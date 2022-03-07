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
        include 'databaseConn.php';
    ?>

    <form action="prog7.php" method="post">
        <label for="">Product ID : </label>
        <input type="number" placeholder="" name="id"><br><br>
        <button type="submit">Delete</button>
    </form>
    <?php

        if(isset($_POST['id']) ){
            // if($_POST['id']!=''){
                $productId=$_POST['id'];

                // $sql="select pro_name from product where pro_id = $productId";
                // $result=$conn->query($sql);

                // if($result->num_rows==0){
                //     die("<br><br><b>product not found</b>");
                // }

                $sql="delete from product where pro_id = $productId";

                if($conn->query($sql)===TRUE){
                    echo"<br><br><b>product Delete successfully</b>";
                }
                else{
                    echo $conn->error;
                }
            // }
        }

    ?>
</body>
</html>