document.getElementById("submit").addEventListener("click", function (e) {
    let healthRecord = mapForm2HealthRecordObject();
    let isValid = validateHealthRecord(healthRecord);
    if (isValid) {
        fetch(BASE_HEALTH_RECORD_API + "/create", {
            method: "POST",
            headers: {
                "Content-Type": "application/json",
            },
            body: JSON.stringify(healthRecord),
        })
            .then((response) => {
                let modalBody = document.getElementById("modal-body");
                if (response.status === CREATED) {
                    modalBody.innerHTML = `Create Health Record successfully!`;
                    $("#alertModal").modal("show");
                } else {
                    modalBody.innerHTML = `Create Health Record failure!`;
                    $("#alertModal").modal("show");
                    return response.json();
                }
            })
            .catch((error) => {
                console.error(error);
                modalBody.innerHTML = `Create Health Record failure!<br>Internal Error`;
                $("#alertModal").modal("show");
            });
    }
});

function goToHealthRecordList() {
    window.location.href = BASE_HEALTH_RECORD_URL;
}

function goBack() {
    history.back();
}

function mapForm2HealthRecordObject() {
    let doctorForm = document.forms["doctor-form"];
    let patientForm = document.forms["patient-form"];
    let healthRecordForm = document.forms["health-record-form"];

    let healthRecordObject = new Object();
    healthRecordObject.creationDate = new Date(
        healthRecordForm.creationDate.value
    );
    healthRecordObject.reDate = new Date(healthRecordForm.reDate.value);
    healthRecordObject.doctor = { id: doctorForm.doctorId.value };
    healthRecordObject.patient = { id: patientForm.patientId.value };

    let illnessIdList = document.querySelectorAll("tr #illness-data input");
    healthRecordObject.illnessList = [];
    for (let i = 0; i < illnessIdList.length; i++) {
        healthRecordObject.illnessList.push({ id: illnessIdList[i].value });
    }

    healthRecordObject.healthRecordDetails = [];
    let prescriptionDetails = document.querySelectorAll(
        "#list-prescription-detail tr #prescription-data input"
    );
    for (let i = 0; i < prescriptionDetails.length; i += 3) {
        let detail = {
            id: prescriptionDetails[i].value,
            medicine: { id: prescriptionDetails[i + 1].value },
            quantity: prescriptionDetails[i + 2].value,
        };
        healthRecordObject.healthRecordDetails.push(detail);
    }

    return healthRecordObject;
}

document.getElementById("btn-continue").addEventListener("click", () => {
    document.forms["test-form"].reset();
    tbodyTestDetail.innerHTML = "";
    tbodyTestDetail.append(nothingElement);
});
