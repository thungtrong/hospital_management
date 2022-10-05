var labelErrors = document.querySelectorAll("label.error-msg");

function showErrorMsg(errors) {
    let msg, field;
    for (let label of labelErrors) {
        field = label.getAttribute("for");
        msg = errors[field] || "";
        label.innerText = msg;
    }
}

function validateIllness(illness) {
    let errors = new Object();
    let r = true;
    if (!illness.name.length) {
        errors.name = "Please fill illness name";
        r = false;
    }
    if (!illness.description.length) {
        errors.description = "Please fill illness description";
        r = false;
    }
    showErrorMsg(errors);
    return r;
}

function mapForm2IllnessObject() {
    let illnessForm = document.forms.illness;
    let illness = new Object({
        id: illnessForm.id?.value,
        name: illnessForm.name.value,
        description: illnessForm.description.value
    });
    return illness;
}
