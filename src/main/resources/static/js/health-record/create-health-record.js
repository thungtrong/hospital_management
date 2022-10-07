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
