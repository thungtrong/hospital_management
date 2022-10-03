/**
 * 
 */
var patientForm = document.forms.patient;
var labelErrors = document.querySelectorAll("label.error-msg");

const ERROR_EMPTY_MESSAGES = {
	address: 'Please fill your address',
	phoneNumber: 'Please fill your phone number',
	name: 'Please fill your full name',
	dateOfBirth: 'Please fill your birth day'
}
const INVALID_PHONE_NUMBER_MSG = "Your phone number is not valid"; 
const PHONE_REGEX = /^[0-9]{10,15}$/g

function validatePatientForm(patient) {
	let errors = new Object();
	let isValid = true;
	for (let key in patient)
	{
		if (key != 'dateOfBirth' && patient[key].length == 0)
		{
			errors[key] = ERROR_EMPTY_MESSAGES[key];
			isValid = false;
		}
		else if (key == 'dateOfBirth' && isNaN(patient[key].getTime()) ) {
			errors[key] = ERROR_EMPTY_MESSAGES[key];
			isValid = false;
		}
	}
	
	if (patient.phoneNumber.match() == null)
	{
		errors['phoneNumber'] = INVALID_PHONE_NUMBER_MSG;
	}
	
	if (patientForm.id)
		patient.id = patientForm.id.value;
	showErrorMsg(errors);
    return isValid;
}

function goToPatientList()
{
	window.location.href=BASE_PATIENT_URL;
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
