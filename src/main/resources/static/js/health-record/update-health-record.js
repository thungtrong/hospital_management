document.getElementById("submit").addEventListener("click", function (e) {
    let hidden = document.getElementById("health-record-id");
    let healthRecord = mapForm2HealthRecordObject();
    healthRecord.id = hidden.value;
    healthRecord.removeIllnessIds = removeIllnessIds || [];
    healthRecord.removeHealthRecordDetailIds =
        removeHealthRecordDetailIds || [];

    let isValid = validateHealthRecord(healthRecord);
    if (isValid) {
        fetch(BASE_HEALTH_RECORD_API + "/update", {
            method: "PUT",
            headers: {
                "Content-Type": "application/json",
            },
            body: JSON.stringify(healthRecord),
        })
            .then((response) => {
                let modalBody = document.getElementById("modal-body");
                if (response.status === ACCEPTED) {
                    modalBody.innerHTML = `Update Health Record successfully!`;
                    $("#alertModal").modal("show");
                    return response.json();
                } else {
                    modalBody.innerHTML = `Update Health Record failure!`;
                    $("#alertModal").modal("show");
                    return response.json();
                }
            })
            .catch((error) => {
                let modalBody = document.getElementById("modal-body");
                console.error(error);
                modalBody.innerHTML = `Update Health Record failure!<br>Internal Error`;
                $("#alertModal").modal("show");
            });
        // .then((data) => {
        //     console.log(data);
        // });
    }
});

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
