document.getElementById("btn-continue").addEventListener("click", () => {
    document.forms.medicine.reset();
});

document.getElementById("submit").addEventListener("click", function (e) {
    let medicine = mapForm2MedicineObject();
    let isValid = validateTest(medicine);
    if (isValid) {
        fetch(BASE_MEDICINE_API + "/create", {
            method: "POST",
            headers: {
                "Content-Type": "application/json",
            },
            body: JSON.stringify(medicine),
        })
            .then((response) => {
                console.log(response);
                let modalBody = document.getElementById("modal-body");
                if (response.status === CREATED) {
                    modalBody.innerHTML = `Create Test successfully!`;
                    $("#alertModel").modal("show");
                } else {
                    modalBody.innerHTML = `Create Test failure!`;
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
