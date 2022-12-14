var labelErrors = document.querySelectorAll("label.error-msg");

function showErrorMsg(errors) {
    let msg, field;
    for (let label of labelErrors) {
        field = label.getAttribute("for");
        msg = errors[field] || "";
        label.innerText = msg;
    }
}

function validateAdmission(admission) {
    let errors = new Object();
    let r = true;
    if (isNaN(admission.dateIn.getTime())) {
        errors.dateIn = "Please fill patient's date in";
        r = false;
    }
    showErrorMsg(errors);
    return r;
}
