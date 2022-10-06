/**
 *
 */
var modalBody = document.getElementById("modal-body");
var hidden = document.getElementById("doctor-id");

var selectedRow;
var doctorList = document.getElementById("doctor-list");

function deleteDoctorModal(target) {
    selectedRow = target.parentElement.parentElement;
    let cols = selectedRow.children;
    modalBody.innerHTML = `Are you sure to delete this doctor? <br><br>
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
					<td><b> Date of birth:</b> </td>
					<td>${cols[4].innerText} <br></td>
				</tr>
				</table>
		        `;
    hidden.value = cols[0].innerText;
    $("#alertModel").modal("show");
}

function deleteDoctor() {
    let id = hidden.value;
    console.log(`${BASE_DOCTOR_API}/delete/${id}`);
    fetch(`${BASE_DOCTOR_API}/delete/${id}`, {
        method: "DELETE",
        headers: {
            "Content-Type": "application/json",
        },
    })
        .then((response) => {
            if (response.status == OK) {
                doctorList.removeChild(selectedRow);
                $("#alertModel").modal("hide");
            } else console.log(response);
        })
        .catch((error) => console.log(error));
}
