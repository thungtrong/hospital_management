/**
 * 
 */
 var modalBody = document.getElementById('modal-body');
 var hidden = document.getElementById('patient-id');
 
 var selectedRow;
 var patientList =document.getElementById('patient-list'); 
 
 function deletePatientModal(target)
 {
 	selectedRow = target.parentElement.parentElement;
 	let cols = selectedRow.children;
 	modalBody.innerHTML = `Are you sure to delete this patient? <br><br>
		        Full Name: ${ cols[1].innerText } <br>
		        Address: ${ cols[2].innerText } <br>
		        Phone: ${ cols[3].innerText } <br>
		        Date of birth: ${ cols[4].innerText } <br>`;
	hidden.value = cols[0].innerText;
	$('#alertModel').modal('show');
 }
 
 function deletePatient()
 {
 	let id = hidden.value;
 	fetch(`${BASE_PATIENT_API}/delete/${id}`, 
	{
		method: 'DELETE',
		headers: {
	      'Content-Type': 'application/json'
	    },
	})
	.then((response) => {
		if (response.status == 200)
		{
			patientList.removeChild(selectedRow);
			$('#alertModel').modal('hide');
		}
	})
	.catch(error => console.log(error));
 	
 	
 	
 	
 }