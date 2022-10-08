document
    .getElementById("btn-continue")
    .addEventListener("click", () => $("#alertModel").modal("hide"));
document.getElementById("btn-submit").addEventListener("click", async (e) => {
    e.preventDefault();
    let formData = mapForm2Object();
    let isValid = validateChangePasswordForm(formData);

    if (!isValid) {
        return;
    }

    let response = await fetch(BASE_ACCOUNT_API + "/change-password", {
        method: "PUT",
        body: JSON.stringify(formData),
        headers: {
            "Content-Type": "application/json",
        },
    });

    let data = await response.json();
    showErrorMsg(data);
    document.getElementById("modal-body").innerHTML = data.message;
    $("#alertModel").modal("show");
});

function validateChangePasswordForm(formData) {
    let errors = {};
    let result = true;

    if (formData.oldPassword.length < 6) {
        errors.oldPassword = `Passworld must be greater than 6 characters`;
        result = false;
    }

    if (formData.newPassword.length < 6) {
        errors.newPassword = `New passworld must be greater than 6 characters`;
        result = false;
    }

    if (formData.confirmNewPassword.length < 6) {
        errors.confirmNewPassword = `Confirm passworld must be greater than 6 characters`;
        result = false;
    }

    if (!formData.oldPassword.trim()) {
        errors.oldPassword = `Passworld must not be empty`;
        result = false;
    }

    if (!formData.newPassword.trim()) {
        errors.newPassword = `New passworld must not be empty`;
        result = false;
    }

    if (!formData.confirmNewPassword.trim()) {
        errors.confirmNewPassword = `Confirm passworld must not be empty`;
        result = false;
    }

    !result && showErrorMsg(errors);
    return result;
}

function mapForm2Object() {
    let form = document.forms[0];
    let oldPassword = form["oldPassword"].value;
    let newPassword = form["newPassword"].value;
    let confirmNewPassword = form["confirmNewPassword"].value;

    return new Object({
        oldPassword,
        newPassword,
        confirmNewPassword,
    });
}

function goBack() {
    history.back();
}

function goBackToDashboard() {
    window.location.href = ORIGIN;
}

function showErrorMsg(errors) {
    let labelErrors = document.querySelectorAll("label.error-msg");
    let msg, field;
    for (let label of labelErrors) {
        field = label.getAttribute("for");
        msg = errors[field] || "";
        label.innerText = msg;
    }
}
