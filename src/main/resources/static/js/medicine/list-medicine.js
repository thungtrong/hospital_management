/**
 *
 */
var modalBody = document.getElementById("modal-body");
var hidden = document.getElementById("medicine-id");

var selectedRow;
var patientList = document.getElementById("medicine-list");

function deleteMedicineModal(target) {
    selectedRow = target.parentElement.parentElement;
    let cols = selectedRow.children;
    modalBody.innerHTML = `Are you sure to delete this medicine? <br><br>
				<table class="table-recheck">
				<tr>
					<td><b>Medicine Name</b>: </td>
					<td>${cols[1].innerText} <br></td>
				</tr>
		        <tr> 
					<td><b>Unit:</b> </td>
					<td>${cols[2].innerText} <br></td>
				</tr>
		        <tr> 
					<td><b>Instruction:</b> </td>
					<td>${cols[3].innerText} <br></td>
				</tr>
				</table>`;
    hidden.value = cols[0].innerText;
    $("#alertModel").modal("show");
}

function deleteMedicine() {
    let id = hidden.value;
    fetch(`${BASE_MEDICINE_API}/delete/${id}`, {
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
