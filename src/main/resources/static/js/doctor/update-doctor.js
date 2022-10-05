/**
 *
 */

var modelBody = document.getElementById("modal-body");

document.getElementById("submit").addEventListener("click", function (e) {
    let patient = mapForm2Object();
    let isValid = validatePatientForm(patient);
    if (isValid)
    {
    	fetch(BASE_PATIENT_API + "/update", 
    	{
			method: 'PUT',
			headers: {
		      'Content-Type': 'application/json'
		    },
		    body: JSON.stringify(patient)
		})
		.then((response) => {
			if (response.status === ACCEPTED)
			{
				modelBody.innerHTML = `Update Patient successfully!`;
				$('#alertModel').modal('show');
			} 
			if (response.status === BAD_REQUEST)
			{
				return response.json();
			}
		})
		.catch((error) => {
			modelBody.innerHTML = `Update Patient failure!<br>Internal Error`;
			$('#alertModel').modal('show');
	
		})
		.then(data => {
			data && showErrorMsg(data);
		});
    }
});

