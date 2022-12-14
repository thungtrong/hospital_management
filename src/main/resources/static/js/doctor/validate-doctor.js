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

function validateDoctorForm(doctor) {
    let errors = new Object();
    let isValid = true;
    for (let key in doctor) {
        if (key != 'id' && key != "dateOfBirth" && !doctor[key]) {
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

    showErrorMsg(errors);
    return isValid;
}

function goToDoctorList() {
    window.location.href = BASE_DOCTOR_URL;
}

function goBack() {
    history.back();
}

function mapForm2DoctorObject() {
    let doctor = new Object();
    doctor.name = doctorForm.name.value;
    doctor.gender = doctorForm.gender.value;
    doctor.phoneNumber = doctorForm.phoneNumber.value;
    doctor.address = doctorForm.address.value;
    doctor.dateOfBirth = new Date(doctorForm.dateOfBirth.value);
    doctor.id = doctorForm.doctorId?.value;
    let departmentId = doctorForm.departmentId.value;
    if (departmentId.trim().length) {
        doctor.department = { id: departmentId };
    }
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
