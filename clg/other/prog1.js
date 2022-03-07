
const displayName = ()=>{
    let username = document.getElementById("username").value;
    let info = document.getElementById("display");
    if(username == "")
    {
        info.innerText = "";
    }else{
        fetch(`getdata.php?username=${username}`)
        .then(response=>{
            return response.text();
        })
        .then(data=>{
            info.innerText = data;
        })
    }
}

