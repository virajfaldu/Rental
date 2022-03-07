<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>

    <form action="prog4.php" method="post">
        <label for="">Product Name : </label>
        <input type="text" placeholder="" name="name"><br><br>
        <label for="">Product Price : </label>
        <input type="number" placeholder="" name="price"><br><br>
        <label for="">Product QOH: </label>
        <input type="number" placeholder="" name="QOH"><br><br>
        <button type="submit">Insert</button>
    </form>
 
    <?php

        if(isset($_POST['name'])){
            include 'databaseConn.php';
    
            $productName=$_POST['name'];
            $productPrice=$_POST['price'];
            $productQOH=$_POST['QOH'];

            $sql="insert into product(pro_name,pro_price,pro_QOH) values('$productName',$productPrice,$productQOH)";

            if($conn->query($sql)===TRUE){
                echo"<br><br><b>product Inserted successfully</b>";
            }
            else{
                echo "<br><br><b>$conn->error</b>";
            }
        }

    ?>
</body>
</html>