/**
 *
 */
var modalBody = document.getElementById("modal-body");
var hidden = document.getElementById("illness-id");

var selectedRow;
var illnessList = document.getElementById("illness-list");

function deleteIllnessModal(target) {
    selectedRow = target.parentElement.parentElement;
    let cols = selectedRow.children;
    modalBody.innerHTML = `Are you sure to delete this illness? <br><br>
				<table class="table-recheck">
				<tr>
					<td><b>Illness</b>: </td>
					<td>${cols[1].innerText} <br></td>
				</tr>
				<tr>
				    <td><b>Description</b>: </td>
				    <td>${cols[2].innerText} <br></td>
                </tr>
				</table>`;
    hidden.value = cols[0].innerText;
    $("#alertModel").modal("show");
}

function deleteIllness() {
    let id = hidden.value;
    fetch(`${BASE_ILLNESS_API}/delete/${id}`, {
        method: "DELETE",
        headers: {
            "Content-Type": "application/json",
        },
    })
        .then((response) => {
            if (response.status == 200) {
                illnessList.removeChild(selectedRow);
                $("#alertModel").modal("hide");
            } else {
                console.log(response);
            }
        })
        .catch((error) => console.log(error));
}
