/**
 *
 */
var modalBody = document.getElementById("modal-body");
var hidden = document.getElementById("test-id");

var selectedRow;
var patientList = document.getElementById("test-list");

function deleteTestModal(target) {
    selectedRow = target.parentElement.parentElement;
    let cols = selectedRow.children;
    modalBody.innerHTML = `Are you sure to delete this test? <br><br>
				<table class="table-recheck">
				<tr>
					<td><b>Test Name</b>: </td>
					<td>${cols[1].innerText} <br></td>
				</tr>
		        <tr> 
					<td><b>Normal Result:</b> </td>
					<td>${cols[2].innerText} <br></td>
				</tr>
		        <tr> 
					<td><b>Description:</b> </td>
					<td>${cols[3].innerText} <br></td>
				</tr>
				</table>`;
    hidden.value = cols[0].innerText;
    $("#alertModel").modal("show");
}

function deleteTest() {
    let id = hidden.value;
    fetch(`${BASE_TEST_API}/delete/${id}`, {
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
