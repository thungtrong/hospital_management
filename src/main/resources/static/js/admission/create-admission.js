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
        patient: { id: admissionForm.patientId.value },
        dateIn: new Date(admissionForm.dateIn.value),
        dateOut: new Date(admissionForm.dateOut.value),
    });
    let isValid = validateAdmission(admission);
    if (isValid) {
        fetch(BASE_ADMISSION_API + "/create", {
            method: "POST",
            headers: {
                "Content-Type": "application/json",
            },
            body: JSON.stringify(admission),
        })
            .then((response) => {
                let modalBody = document.getElementById("modal-body");
                if (response.status === CREATED) {
                    modalBody.innerHTML = `Create Admission successfully!`;
                    $("#alertModal").modal("show");
                } else {
                    modalBody.innerHTML = `Create Admission failure!`;
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

document
    .getElementById("btn-patient-search")
    .addEventListener("click", function (e) {
        let form = document.forms["patient-filter"];
        let formData = new FormData(form);
        let urlParams = new URLSearchParams(formData);

        fetch(
            BASE_PATIENT_API + "/findByNameAndPhone?" + urlParams.toString(),
            {
                method: "GET",
            }
        )
            .then((response) => response.json())
            .then((data) => {
                let patientListTable = document.getElementById("patient-list");
                patientListTable.innerHTML = "";
                let tr, td;
                for (let i = 0; i < data.length; i++) {
                    let patient = data[i];
                    tr = document.createElement("tr");

                    td = document.createElement("td");
                    td.innerHTML = `${patient.name}`;
                    tr.append(td);

                    td = td.cloneNode();
                    td.innerHTML = `${patient.phoneNumber}`;
                    tr.append(td);

                    td = td.cloneNode();
                    td.innerHTML = `${patient.dateOfBirth}`;
                    tr.append(td);

                    td = td.cloneNode();
                    td.innerHTML = `<button type="button" class="btn btn-primary"><i class="fa fa-check" aria-hidden="true"></i></button>`;
                    td.addEventListener("click", function (e) {
                        fillPatienFormPart(patient);
                        $("#searchModel").modal("hide");
                    });
                    tr.append(td);
                    patientListTable.append(tr);
                }

                `<tr>
                    <td>Full Name</td>
                    <td>Phone Number</td>
                    <td>Date of birth</td>
                    <td></td>
                </tr>`;
            })
            .catch((error) => {
                console.log(error);
            });
    });

function fillPatienFormPart(patient) {
    let admissionForm = document.forms.admission;
    admissionForm.patientId.value = patient.id;
    admissionForm.name.value = patient.name;
    admissionForm.gender.value = patient.gender;
    admissionForm.dateOfBirth.value = patient.dateOfBirth;
    admissionForm.phoneNumber.value = patient.phoneNumber;
    admissionForm.address.value = patient.address;
}

function goToAdmissionList()
{
	window.location.href=BASE_ADMISSION_URL;
}

function goBack()
{
	history.back();
}