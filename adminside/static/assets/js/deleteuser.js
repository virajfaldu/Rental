userDeleteBtn = document.getElementsByClassName("userDeleteBtn");
for (let i = 0; i < userDeleteBtn.length; i++) {
  userDeleteBtn[i].addEventListener("click", (e) => {
    uid = e.target.dataset.uid;
    token = e.target.dataset.token;
    url = e.target.dataset.url;
    returnurl = e.target.dataset.return;
    Swal.fire({
      title: "Are you sure?",
      text: "You won't be able to revert this!",
      icon: "warning",
      showCancelButton: true,
      confirmButtonColor: "#3085d6",
      cancelButtonColor: "#d33",
      confirmButtonText: "Yes, delete it!",
    }).then((result) => {
      if (result.isConfirmed) {
        fetch(url, {
          method: "POST",
          headers: {
            "X-CSRFToken": token,
            "Content-Type": "application/json",
          },
          body: JSON.stringify({
            uid: uid,
          }),
        })
          .then((result) => {
            return result.json();
          })
          .then((data) => {
            location.href = returnurl;
          });
      }
    });
  });
}
declineBtn = document.getElementsByClassName("declineBtn");
for (let i = 0; i < declineBtn.length; i++) {
  declineBtn[i].addEventListener("click", (e) => {
    rid = e.target.dataset.rid;
    token = e.target.dataset.token;
    url = e.target.dataset.url;
    returnurl = e.target.dataset.return;
    Swal.fire({
      title: "Are you sure?",
      text: "You won't be able to revert this!",
      icon: "warning",
      showCancelButton: true,
      confirmButtonColor: "#52cfd4",
      cancelButtonColor: "#d33",
      confirmButtonText: "Yes Decline it !",
    }).then((result) => {
      if (result.isConfirmed) {
        fetch(url, {
          method: "POST",
          headers: {
            "X-CSRFToken": token,
            "Content-Type": "application/json",
          },
          body: JSON.stringify({
            rid: rid,
          }),
        })
          .then((result) => {
            return result.json();
          })
          .then((data) => {
            location.href = returnurl;
          });
      }
    });
  });
}

asigndelivery = document.getElementsByClassName("asigndelivery");
for (let i = 0; i < asigndelivery.length; i++) {
  asigndelivery[i].addEventListener("change", (e) => {
    id = e.target.value;
    oid = e.target.dataset.oid;
    pid = e.target.dataset.pid;
    token = e.target.dataset.token;
    url = e.target.dataset.url;
    returnurl = e.target.dataset.return;

    fetch(url, {
      method: "POST",
      headers: {
        "X-CSRFToken": token,
        "Content-Type": "application/json",
      },
      body: JSON.stringify({
        pid: pid,
        id: id,
        oid: oid,
      }),
    })
      .then((result) => {
        return result.json();
      })
      .then((data) => {
        location.href = returnurl;
      });
  });
}
asignPickup = document.getElementsByClassName("asignPickup");
for (let i = 0; i < asignPickup.length; i++) {
    asignPickup[i].addEventListener("change", (e) => {
    id = e.target.value;
    oid = e.target.dataset.oid;
    pid = e.target.dataset.pid;
    token = e.target.dataset.token;
    url = e.target.dataset.url;
    returnurl = e.target.dataset.return;
    fetch(url, {
      method: "POST",
      headers: {
        "X-CSRFToken": token,
        "Content-Type": "application/json",
      },
      body: JSON.stringify({
        pid: pid,
        id: id,
        oid: oid,
      }),
    })
      .then((result) => {
        return result.json();
      })
      .then((data) => {
        location.href = returnurl;
      });
  });
}

orderStatus = document.getElementsByClassName("orderStatus");
for (let i = 0; i < orderStatus.length; i++) {
  orderStatus[i].addEventListener("change", (e) => {
    
    ostatus = e.target.value;
    oid = e.target.dataset.oid;
    pid = e.target.dataset.pid;
    token = e.target.dataset.token;
    url = e.target.dataset.url;
    returnurl = e.target.dataset.return;
    
    fetch(url, {
      method: "POST",
      headers: {
        "X-CSRFToken": token,
        "Content-Type": "application/json",
      },
      body: JSON.stringify({
        oid: oid,
        pid: pid,
        ostatus: ostatus,
      }),
    })
      .then((result) => {
        return result.json();
      })
      .then((data) => {
        location.href = returnurl;
      });
  });
}

publish = document.getElementsByClassName("publish");
for (let i = 0; i < publish.length; i++) {
  publish[i].addEventListener("change", (e) => {
    id = e.target.dataset.id;
    token = e.target.dataset.token;
    url = e.target.dataset.url;
    returnurl = e.target.dataset.return;

    fetch(url, {
      method: "POST",
      headers: {
        "X-CSRFToken": token,
        "Content-Type": "application/json",
      },
      body: JSON.stringify({
        id: id,
      }),
    })
      .then((result) => {
        return result.json();
      })
      .then((data) => {
        location.href = returnurl;
      });
  });
}
