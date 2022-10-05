var searchModel = document.getElementById("searchModel");

document.getElementById("btn-patient").addEventListener("click", function (e) {
    $("#searchModel").modal("show");
});

document.getElementById("btn-continue").addEventListener("click", () => {
    document.forms.department.reset();
});

document.getElementById("submit").addEventListener("click", function (e) {
    let departmentForm = document.forms.admission;
    let department = new Object({
        department: { id: departmentForm.departmentId.value },
        description: departmentForm.description.value
    });
    let isValid = validateAdmission(department);
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
                    modalBody.innerHTML = `Create Admission failure!`;
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

document
    .getElementById("btn-department-search")
    .addEventListener("click", function (e) {
        let form = document.forms["department-filter"];
        let formData = new FormData(form);
        let urlParams = new URLSearchParams(formData);

        fetch(
            BASE_DEPARTMENT_API + "/findbyname?" + urlParams.toString(),
            {
                method: "GET",
            }
        )
            .then((response) => response.json())
            .then((data) => {
                let departmentListTable = document.getElementById("patient-list");
                departmentListTable.innerHTML = "";
                let tr, td;
                for (let i = 0; i < data.length; i++) {
                    let department = data[i];
                    tr = document.createElement("tr");

                    td = document.createElement("td");
                    td.innerHTML = `${department.name}`;
                    tr.append(td);

                    td = td.cloneNode();
                    td.innerHTML = `${department.description}`;
                    tr.append(td);

                    td = td.cloneNode();
                    td.innerHTML = `<button type="button" class="btn btn-primary"><i class="fa fa-check" aria-hidden="true"></i></button>`;
                    td.addEventListener("click", function (e) {
                        fillPatienFormPart(patient);
                        $("#searchModel").modal("hide");
                    });
                    tr.append(td);
                    patientListTable.append(tr);
                }

                `<tr>
                    <td>Name</td>
                    <td>Description</td>
                    <td></td>
                </tr>`;
            })
            .catch((error) => {
                console.log(error);
            });
    });

function fillDepartmentFormPart(department) {
    let departmentForm = document.forms.department;
    departmentForm.department.value = department.id;
    departmentForm.name.value = department.name;
    departmentForm.description.value = department.description;
}
function goToDepartmentList()
{
    window.location.href=BASE_ADMISSION_URL;
}

function goBack()
{
    history.back();
}