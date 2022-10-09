document.getElementById("submit").addEventListener("click", async function (e) {
    let hidden = document.getElementById("health-record-id");
    let healthRecord = mapForm2HealthRecordObject();
    healthRecord.id = hidden.value;
    healthRecord.removeIllnessIds = removeIllnessIds || [];
    healthRecord.removeHealthRecordDetailIds =
        removeHealthRecordDetailIds || [];

    let isValid = validateHealthRecord(healthRecord);
    if (isValid) {
        let response = await fetch(BASE_HEALTH_RECORD_API + "/update", {
            method: "PUT",
            headers: {
                "Content-Type": "application/json",
            },
            body: JSON.stringify(healthRecord),
        })
        .catch((error) => {
            let modalBody = document.getElementById("modal-body");
            modalBody.innerHTML = `Update Health Record failure!<br>Internal Error`;
            $("#alertModal").modal("show");
        });

        let modalBody = document.getElementById("modal-body");
        if (response.status === ACCEPTED) {
            modalBody.innerHTML = `Update Health Record successfully!`;
            $("#alertModal").modal("show");
        } else {
            addErrorAlert(`Update Health Record failure!`);
            let data = await response.json();
            for (let key in data) {
                addErrorAlert(data[key]);
            }
        }
    }
});

addEventFindPatientListener();

function goToHealthRecordList() {
    window.location.href = BASE_HEALTH_RECORD_URL;
}

function goBack() {
    history.back();
}


document.getElementById("btn-continue").addEventListener("click", () => {
    document.forms["test-form"].reset();
    tbodyTestDetail.innerHTML = "";
    tbodyTestDetail.append(nothingElement);
});
