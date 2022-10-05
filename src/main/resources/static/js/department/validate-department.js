var labelErrors = document.querySelectorAll("label.error-msg");

function showErrorMsg(errors) {
    let msg, field;
    for (let label of labelErrors) {
        field = label.getAttribute("for");
        msg = errors[field] || "";
        label.innerText = msg;
    }
}

function validateDepartment(department) {
    let errors = new Object();
    let r = true;
    if (!department.name.length) {
        errors.name = "Please fill department name";
        r = false;
    }
    if (!department.unit.length) {
        errors.unit = "Please fill department unit";
        r = false;
    }
    showErrorMsg(errors);
    return r;
}

function mapForm2DepartmentObject() {
    let departmentForm = document.forms.department;
    let department = new Object({
        id: departmentForm.id?.value,
        name: departmentForm.name.value,
        description: departmentForm.description.value,
    });
    return department;
}
