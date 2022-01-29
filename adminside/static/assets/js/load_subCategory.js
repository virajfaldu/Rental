dropCategory = document.getElementById("id_category");
proForm = document.getElementById("productForm");
dropSubCat = document.getElementById("id_subcategory");

dropCategory.addEventListener("change", (e)=>{
    let url = proForm.dataset.subcaturl;
    let catId = e.target.value;
    let token = proForm.dataset.token;
    fetch(url,{
        method:'POST',
        headers:{
            "Content-Type":"application/json",
            "X-CSRFToken":token,
        },
        body: JSON.stringify({
            category:catId
        })
    }).then((result)=>{
        return result.text();
    }).then((data)=>{
        dropSubCat.innerHTML = data;
    })
})

