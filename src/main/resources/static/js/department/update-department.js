/**
 *
 */
var modelBody = document.getElementById("modal-body");

document.getElementById("submit").addEventListener("click", function (e) {
    let department = mapForm2Object();
    let isValid = validateDepartmentForm(department);
    if (isValid) {
        fetch(BASE_DEPARTMENT_API + "/update", {
            method: "PUT",
            headers: {
                "Content-Type": "application/json",
            },
            body: JSON.stringify(department),
        })
            .then((response) => {
                if (response.status === ACCEPTED) {
                    modelBody.innerHTML = `Update Department successfully!`;
                    $("#alertModel").modal("show");
                }
                if (response.status === BAD_REQUEST) {
                    return response.json();
                }
            })
            .catch((error) => {
                modelBody.innerHTML = `Update Department failure!<br>Internal Error`;
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
