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

    <form action="prog6.php" method="post">
        <label for="">Product ID : </label>
        <input type="number" placeholder="" name="id"><br><br>
        <label for="">Product QOH: </label>
        <input type="number" placeholder="" name="QOH"><br><br>
        <button type="submit">Update</button>
    </form>
    <?php

        if(isset($_POST['id'])){
            $productId=$_POST['id'];
            $productQOH=$_POST['QOH'];

            $sql="update product set pro_QOH=$productQOH where pro_id=$productId";
            $result=$conn->query($sql);

            if($result===TRUE){
                echo"<br><br><b>product updated successfully</b>";
            }
            else{
                echo "<br><br><b>$conn->error</b>";
            }
        }

    ?>
</body>
</html>