/**
 *
 */
var doctorForm = document.forms.doctor;
var labelErrors = document.querySelectorAll("label.error-msg");

const ERROR_EMPTY_MESSAGES = {
    address: "Please fill your address",
    phoneNumber: "Please fill your phone number",
    name: "Please fill your full name",
    dateOfBirth: "Please fill your birth day",
};
const INVALID_PHONE_NUMBER_MSG = "Your phone number is not valid";
const PHONE_REGEX = /^[0-9]{10,15}$/g;

function validatePatientForm(doctor) {
    let errors = new Object();
    let isValid = true;
    for (let key in doctor) {
        if (key != "dateOfBirth" && doctor[key].length == 0) {
            errors[key] = ERROR_EMPTY_MESSAGES[key];
            isValid = false;
        } else if (key == "dateOfBirth" && isNaN(doctor[key].getTime())) {
            errors[key] = ERROR_EMPTY_MESSAGES[key];
            isValid = false;
        }
    }

    if (doctor.phoneNumber.match() == null) {
        errors["phoneNumber"] = INVALID_PHONE_NUMBER_MSG;
    }

    if (doctorForm.id) doctor.id = doctorForm.id.value;
    showErrorMsg(errors);
    return isValid;
}

function goToPatientList() {
    window.location.href = BASE_PATIENT_URL;
}

function goBack() {
    history.back();
}

function mapForm2Object() {
    let doctor = new Object();
    doctor.name = doctorForm.name.value;
    doctor.gender = doctorForm.gender.value;
    doctor.phoneNumber = doctorForm.phoneNumber.value;
    doctor.address = doctorForm.address.value;
    doctor.dateOfBirth = new Date(doctorForm.dateOfBirth.value);
    return doctor;
}

function showErrorMsg(errors) {
    let msg, field;
    for (let label of labelErrors) {
        field = label.getAttribute("for");
        msg = errors[field] || "";
        label.innerText = msg;
    }
}
