var searchModel = document.getElementById("searchModel");

document.getElementById("btn-continue").addEventListener("click", () => {
    document.forms.department.reset();
});

document.getElementById("submit").addEventListener("click", function (e) {
    let department = mapForm2DepartmentObject();
    let isValid = validateDepartment(department);
    if (isValid) {
        fetch(BASE_DEPARTMENT_API + "/create", {
            method: "POST",
            headers: {
                "Content-Type": "application/json",
            },
            body: JSON.stringify(department),
        })
            .then((response) => {
                let modalBody = document.getElementById("modal-body");
                if (response.status === CREATED) {
                    modalBody.innerHTML = `Create Department successfully!`;
                    $("#alertModal").modal("show");
                } else {
                    modalBody.innerHTML = `Create Department failure!`;
                    $("#alertModal").modal("show");
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

function goToDepartmentList() {
    window.location.href = BASE_DEPARTMENT_URL;
}

function goBack() {
    history.back();
}
