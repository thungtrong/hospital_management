/**
 *
 */

var searchModel = document.getElementById("searchModel");

document.getElementById("btn-patient").addEventListener("click", function (e) {
    $("#searchModel").modal("show");
});

document.getElementById("btn-continue").addEventListener("click", () => {
    document.forms.admission.reset();
});

document.getElementById("submit").addEventListener("click", function (e) {
    let admissionForm = document.forms.admission;
    let admission = new Object({
        id: admissionForm.admissionId.value,
        patient: { id: admissionForm.patientId.value },
        dateIn: new Date(admissionForm.dateIn.value),
        dateOut: new Date(admissionForm.dateOut.value),
    });
    let isValid = validateAdmission(admission);
    if (isValid) {
        fetch(BASE_ADMISSION_API + "/update", {
            method: "PUT",
            headers: {
                "Content-Type": "application/json",
            },
            body: JSON.stringify(admission),
        })
            .then((response) => {
                let modalBody = document.getElementById("modal-body");
                if (response.status === ACCEPTED) {
                    modalBody.innerHTML = `Update Admission successfully!`;
                    $("#alertModal").modal("show");
                } else {
                    modalBody.innerHTML = `Update Admission failure!`;
                    $("#alertModal").modal("show");
                    return response.json();
                }
            })
            .then((data) => {
                if (data) {
                    showErrorMsg(data);
                }
            });
    }
});
addEventFindPatientListener();

function fillPatienFormPart(patient) {
    let admissionForm = document.forms.admission;
    admissionForm.patientId.value = patient.id;
    admissionForm.name.value = patient.name;
    admissionForm.gender.value = patient.gender;
    admissionForm.dateOfBirth.value = patient.dateOfBirth;
    admissionForm.phoneNumber.value = patient.phoneNumber;
    admissionForm.address.value = patient.address;
}

function goToAdmissionList() {
    window.location.href = BASE_ADMISSION_URL;
}

function goBack() {
    history.back();
}
