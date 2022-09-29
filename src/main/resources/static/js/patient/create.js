/**
 *
 */
const BASE_PATIENT_API = BASE_API_URL + '/patient';
var patientForm = document.forms.patient;

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
		.then((response) => response.json())
		.then((data) => {console.log(data)});
    }
});

function validatePatientForm(patient) {
    console.log("Validate", patient);
    return true;
}

fucntion back()
{
	console.log("Back");
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


