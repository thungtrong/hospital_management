document.getElementById("btn-continue").addEventListener("click", () => {
    document.forms.medicine.reset();
});

document.getElementById("submit").addEventListener("click", function (e) {
    let medicine = mapForm2MedicineObject();
    let isValid = validateMedicine(medicine);
    if (isValid) {
        fetch(BASE_MEDICINE_API + "/create", {
            method: "POST",
            headers: {
                "Content-Type": "application/json",
            },
            body: JSON.stringify(medicine),
        })
            .then((response) => {
                let modalBody = document.getElementById("modal-body");
                if (response.status === CREATED) {
                    modalBody.innerHTML = `Create Medicine successfully!`;
                    $("#alertModel").modal("show");
                } else {
                    modalBody.innerHTML = `Create Medicine failure!`;
                    $("#alertModel").modal("show");
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

function goToTestList() {
    window.location.href = BASE_MEDICINE_URL;
}

function goBack() {
    history.back();
}
