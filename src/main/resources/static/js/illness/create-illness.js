document.getElementById("btn-continue").addEventListener("click", () => {
    document.forms.illness.reset();
});

document.getElementById("submit").addEventListener("click", function (e) {
    let illness = mapForm2IllnessObject();
    let isValid = validateIllness(illness);
    if (isValid) {
        fetch(BASE_ILLNESS_API + "/create", {
            method: "POST",
            headers: {
                "Content-Type": "application/json",
            },
            body: JSON.stringify(illness),
        })
            .then((response) => {
                let modalBody = document.getElementById("modal-body");
                if (response.status === CREATED) {
                    modalBody.innerHTML = `Create Illness successfully!`;
                    $("#alertModel").modal("show");
                } else {
                    modalBody.innerHTML = `Create Illness failure!`;
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

function goToIllnessList() {
    window.location.href = BASE_ILLNESS_URL;
}

function goBack() {
    history.back();
}
