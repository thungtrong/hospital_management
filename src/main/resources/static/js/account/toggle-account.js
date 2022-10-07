/**
 *
 */
let btnToggleModels = document.getElementsByClassName(
    "btn-toggle-account-modal"
);

for (let i = 0; i < btnToggleModels.length; i++) {
    btnToggleModels[i].addEventListener("click", toggleStatusAccountModel);
}
document.getElementById("btn-toggle-account").addEventListener("click", toggleStatusAccount);
var hidden;
function toggleStatusAccountModel(e) {
    let target = e.target;
    let row = target.parentElement.parentElement.parentElement;
    let cols = row.getElementsByTagName("td");
    let status = cols[4].innerText;

    let modalLabel = document.getElementById("modalLabel");
    modalLabel.innerHTML =
        status == "Enabled"
            ? "Are you sure to disable this account"
            : "Are you sure to enable this account";

    let modalBody = document.getElementById("modal-body");
    modalBody.innerHTML = `<table class="table-recheck">
    <tr>
        <td><b>User Name</b>: </td>
        <td>${cols[0].innerText} <br></td>
    </tr>
    <tr> 
        <td><b>Full Name:</b> </td>
        <td>${cols[1].innerText} <br></td>
    </tr>
    <tr> 
        <td><b>Phone:</b> </td>
        <td>${cols[2].innerText} <br></td>
    </tr>
    <tr> 
        <td><b>Role:</b> </td>
        <td>${cols[3].innerText} <br></td>
    </tr>
    </table`;
    hidden = cols[0].innerHTML;
    console.log(cols);
    $("#alertModel").modal("show");
}
// fetch api to update status
function toggleStatusAccount() {
    let url = "/api/account/toggle-status";
    let data = {
        username: hidden,
    };
    console.log(data);
    fetch(url, {
        method: "PUT",
        headers: {
            "Content-Type": "application/json",
        },
        body: JSON.stringify(data),
    })
        .then((response) =>{
            console.log(response);
            return response.json();
        })

        .then((data) => {
            console.log(data);
            if (data !=null) {
                $("#alertModel").modal("hide");
                location.reload();
            }

        })
        .catch((error) => {
            console.error("Error:", error);
        });
}
