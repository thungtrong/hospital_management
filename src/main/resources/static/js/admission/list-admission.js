/**
 *
 */
var modalBody = document.getElementById("modal-body");
var hidden = document.getElementById("admission-id");

var selectedRow;
var admissionList = document.getElementById("admission-list");

function deletePatientModal(target) {
    selectedRow = target.parentElement.parentElement;
    let cols = selectedRow.children;
    modalBody.innerHTML = `Are you sure to delete this admission? <br><br>
				<table class="table-recheck">
				<tr>
					<td><b>Full Name</b>: </td>
					<td>${cols[1].innerText} <br></td>
				</tr>
		        <tr> 
					<td><b>Address:</b> </td>
					<td>${cols[2].innerText} <br></td>
				</tr>
		        <tr> 
					<td><b>Phone:</b> </td>
					<td>${cols[3].innerText} <br></td>
				</tr>
				<tr> 
					<td><b>Date In:</b> </td>
					<td>${cols[4].innerText} <br></td>
				</tr>
				<tr> 
					<td><b>Date Out:</b> </td>
					<td>${cols[5].innerText} <br></td>
				</tr>
				</table>`;
    hidden.value = cols[0].innerText;
    $("#alertModel").modal("show");
}

function deleteAdmission() {
    let id = hidden.value;
    fetch(`${BASE_ADMISSION_API}/delete/${id}`, {
        method: "DELETE",
        headers: {
            "Content-Type": "application/json",
        },
    })
        .then((response) => {
        
            if (response.status == 200) {
                admissionList.removeChild(selectedRow);
                $("#alertModel").modal("hide");
            } else
            {
            console.log(response);
            }
        })
        .catch((error) => console.log(error));
}
