/**
 *
 */
var modalBody = document.getElementById("modal-body");
var hidden = document.getElementById("health-record-id");

var selectedRow;
var patientList = document.getElementById("health-record-list");

function deleteHealthRecordModal(target) {
    selectedRow = target.parentElement.parentElement;
    let cols = selectedRow.children;
    modalBody.innerHTML = `Are you sure to delete this patient? <br><br>
				<table class="table-recheck">
				<tr>
					<td><b>Full Name</b>: </td>
					<td>${cols[1].innerText} <br></td>
				</tr>
		        <tr> 
					<td><b>Phone Number:</b> </td>
					<td>${cols[2].innerText} <br></td>
				</tr>
				<tr> 
					<td><b>Detais:</b> </td>
					<td>${cols[3].innerText} <br></td>
				</tr>
				</table>`;
    hidden.value = cols[0].innerText;
    $("#alertModel").modal("show");
}

function deleteHealthRecord() {
    let id = hidden.value;
    fetch(`${BASE_HEALTH_RECORD_API}/delete/${id}`, {
        method: "DELETE",
        headers: {
            "Content-Type": "application/json",
        },
    })
        .then((response) => {
            if (response.status == 200) {
                patientList.removeChild(selectedRow);
                $("#alertModel").modal("hide");
            } else {
                console.log(response);
            }
        })
        .catch((error) => console.log(error));
}
