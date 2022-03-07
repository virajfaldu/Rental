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

    <form action="prog5.php" method="get">
        <input type="text" placeholder="Search Product By Id " name="id">
        <button type="submit">Search</button>
    </form>
    <?php

        if(isset($_GET['id'])){
            $productId=$_GET['id'];

            $sql="select pro_name,pro_price,pro_QOH from product where pro_id = $productId";
            $result=$conn->query($sql);
         

            if(mysqli_num_rows($result)>0){
                while($row=mysqli_fetch_assoc($result)){
                    echo "<br><br>product name : ".$row['pro_name']."<br>product price : ".$row['pro_price']."<br>product QOH : ".$row['pro_QOH'];
                }
            }
            else{
                echo "<br><br><b>product not found</b>";
            }
        }

    ?>
</body>
</html>