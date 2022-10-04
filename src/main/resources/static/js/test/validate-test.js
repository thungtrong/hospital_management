var labelErrors = document.querySelectorAll("label.error-msg");

function showErrorMsg(errors) {
    let msg, field;
    for (let label of labelErrors) {
        field = label.getAttribute("for");
        msg = errors[field] || "";
        label.innerText = msg;
    }
}

function validateTest(test) {
    let errors = new Object();
    let r = true;
    if (!test.testName.length) {
        errors.testName = "Please fill test name";
        r = false;
    }
    if (!test.normalResult.length) {
        errors.normalResult = "Please fill normal result of the test";
        r = false;
    }
    showErrorMsg(errors);
    return r;
}
