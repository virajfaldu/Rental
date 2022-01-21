userDeleteBtn = document.getElementsByClassName("userDeleteBtn");

for(let i=0; i< userDeleteBtn.length; i++ ){
    userDeleteBtn[i].addEventListener('click',(e)=>{
        uid = e.target.dataset.uid;
        token = e.target.dataset.token;
        url=e.target.dataset.url;
        returnurl=e.target.dataset.return
        Swal.fire({
            title: 'Are you sure?',
            text: "You won't be able to revert this!",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Yes, delete it!'
        }).then((result) => {
            if (result.isConfirmed) {
                fetch(url,{
                    method:'POST',
                    headers:{
                        "X-CSRFToken":token,
                        "Content-Type":"application/json"
                    },
                    body: JSON.stringify({
                        uid:uid
                    })
                }).then((result)=>{
                    return result.json();
                }).then((data)=>{
                    location.href = returnurl
                })
            }
        })
    });
}