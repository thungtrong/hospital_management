/**
 *
 */
var modalBody = document.getElementById('modal-body');
var hidden = document.getElementById('department-id');

var selectedRow;
var departmentList =document.getElementById('department-list');

function deleteDepartmentModal(target)
{
    selectedRow = target.parentElement.parentElement;
    let cols = selectedRow.children;
    modalBody.innerHTML = `Are you sure to delete this department? <br><br>
		       <table class="table-recheck">
				<tr>
					<td><b>Department Name</b>: </td>
					<td>${cols[1].innerText} <br></td>
				</tr>
		        <tr> 
					<td><b>Description:</b> </td>
					<td>${cols[2].innerText} <br></td>
				</tr>
				</table>
		        `;
    hidden.value = cols[0].innerText;
    $('#alertModel').modal('show');
}

function deleteDepartment()
{
    let id = hidden.value;
    fetch(`${BASE_DEPARTMENT_API}/delete/${id}`,
        {
            method: 'DELETE',
            headers: {
                'Content-Type': 'application/json'
            },
        })
        .then((response) => {
            if (response.status == 200)
            {
                departmentList.removeChild(selectedRow);
                $('#alertModel').modal('hide');
            }
        })
        .catch(error => console.log(error));
}