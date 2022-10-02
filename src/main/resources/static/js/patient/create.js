/**
 *
 */
const BASE_PATIENT_API = BASE_API_URL + '/patient';
var patientForm = document.forms.patient;
var modelBody = document.getElementById("modal-body");
var labelErrors = document.querySelectorAll("label.error-msg");

document.getElementById("submit").addEventListener("click", function (e) {
    let patient = mapForm2Object();
    let isValid = validatePatientForm(patient);
    if (isValid)
    {
    	fetch(BASE_PATIENT_API + "/create", 
    	{
			method: 'POST',
			headers: {
		      'Content-Type': 'application/json'
		    },
		    body: JSON.stringify(patient)
		})
		.then((response) => {
			if (response.status === CREATED)
			{
				modelBody.innerHTML = `Insert new Patient successfully!`;
				$('#alertModel').modal('show');
			} 
			if (response.status === BAD_REQUEST)
			{
				return response.json();
			}
		})
		.catch((error) => {
			modelBody.innerHTML = `Insert new Patient failure!<br>Internal Error`;
			$('#alertModel').modal('show');
	
		})
		.then(data => {
			data && showErrorMsg(data);
		});
    }
});
const errorMessages = {
	address: 'Please fill your address',
	phoneNumber: 'Please fill your phone number',
	name: 'Please fill your full name',
	dateOfBirth: 'Please fill your birth day'
}
function validatePatientForm(patient) {
	let errors = new Object();
	let isValid = true;
	for (let key in patient)
	{
		if (key != 'dateOfBirth' && patient[key].length == 0)
		{
			errors[key] = errorMessages[key];
			isValid = false;
		} 
		else if (key == 'dateOfBirth' && isNaN(patient[key].getTime()) ) {
			errors[key] = errorMessages[key];
			isValid = false;
		}
	}
	showErrorMsg(errors);
    return isValid;
}

function goToPatientList()
{
	window.location.href=`${ORIGIN}/patient`;
}

function goBack()
{
	history.back();
}

function mapForm2Object()
{
	let patient = new Object();
    patient.name = patientForm.name.value;
    patient.gender = patientForm.gender.value;
    patient.phoneNumber = patientForm.phoneNumber.value;
    patient.address = patientForm.address.value;
    patient.dateOfBirth = new Date(patientForm.dateOfBirth.value);
    return patient;
}

function showErrorMsg(errors)
{
	let msg, field;
	for (let label of labelErrors) {
		field = label.getAttribute("for");
		msg = errors[field] || "";
		label.innerText=msg;
	}
}

