document.getElementById("submit").addEventListener("click", async function (e) {
    let healthRecord = mapForm2HealthRecordObject();
    let isValid = validateHealthRecord(healthRecord);
    if (isValid) {
        let response = await fetch(BASE_HEALTH_RECORD_API + "/create", {
            method: "POST",
            headers: {
                "Content-Type": "application/json",
            },
            body: JSON.stringify(healthRecord),
        }).catch((error) => {
            modalBody.innerHTML = `Create Health Record failure!<br>Internal Error`;
            $("#alertModal").modal("show");
        });

        let modalBody = document.getElementById("modal-body");
        if (response.status === CREATED) {
            modalBody.innerHTML = `Create Health Record successfully!`;
            $("#alertModal").modal("show");
        } else {
            addErrorAlert(`Create Health Record failure!`);
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
