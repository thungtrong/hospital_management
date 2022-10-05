/**
 *
 */

var modelBody = document.getElementById("modal-body");

document.getElementById("submit").addEventListener("click", function (e) {
    let department = mapForm2DepartmentObject();
    let isValid = validateDepartment(department);
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
                    modelBody.innerHTML = `Update department successfully!`;
                    $("#alertModel").modal("show");
                }
                if (response.status === BAD_REQUEST) {
                    return response.json();
                }
            })
            .catch((error) => {
                modelBody.innerHTML = `Update department failure!<br>Internal Error`;
                $("#alertModel").modal("show");
            })
            .then((data) => {
                data && showErrorMsg(data);
            });
    }
});

function goToDepartmentList() {
    window.location.href = BASE_DEPARTMENT_URL;
}

function goBack() {
    history.back();
}
