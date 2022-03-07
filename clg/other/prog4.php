<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <form>
        <label for="opt">Products</label>
        <select name="product" id="product">
            <option value="TV">TV</option>
            <option value="Mobile">Mobile
            </option>
            <option value="Laptop">Laptop</option>
            <option value="Tablet">Tablet</option>
        </select>
        <p id="display"></p>
    </form>

    <script>
        let productDrop = document.getElementById("product");
        productDrop.addEventListener("change",()=>{
            let data = productDrop.value;
            let formData = new FormData();
            formData.set("product", data);
            
            fetch(`product.php`,{
                method:"POST",
                body:formData
            })
            .then(response=>{
                return response.text();
            })
            .then(data=>{
                document.getElementById("display").innerText = data;
            })
        })
    </script>
</body>
</html>