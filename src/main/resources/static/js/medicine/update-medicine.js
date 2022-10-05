/**
 *
 */
var modelBody = document.getElementById("modal-body");

document.getElementById("submit").addEventListener("click", function (e) {
    let medicine = mapForm2MedicineObject();
    let isValid = validateMedicine(medicine);
    if (isValid) {
        fetch(BASE_MEDICINE_API + "/update", {
            method: "PUT",
            headers: {
                "Content-Type": "application/json",
            },
            body: JSON.stringify(medicine),
        })
            .then((response) => {
                if (response.status === ACCEPTED) {
                    modelBody.innerHTML = `Update Medicine successfully!`;
                    $("#alertModel").modal("show");
                }
                if (response.status === BAD_REQUEST) {
                    return response.json();
                }
            })
            .catch((error) => {
                modelBody.innerHTML = `Update Medicine failure!<br>Internal Error`;
                $("#alertModel").modal("show");
            })
            .then((data) => {
                data && showErrorMsg(data);
            });
    }
});

function goToTestList() {
    window.location.href = BASE_MEDICINE_URL;
}

function goBack() {
    history.back();
}
