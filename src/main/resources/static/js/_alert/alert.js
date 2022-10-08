const alertContainer = $("#alert-container");

const successAlert = document.createElement("div");
successAlert.className = "alert alert-success";
successAlert.setAttribute("role", "alert");

const errorAlert = document.createElement("div");
errorAlert.className = "alert alert-danger";
errorAlert.setAttribute("role", "alert");

function addCloneAlert(alert, message, time) {
    let alertClone = alert.cloneNode(true);
    alertClone.innerHTML = message;
    alertContainer.append(alertClone);
    setTimeout(() => {
        alertClone.className += " fade";
        $(alertClone).alert("close");
    }, time);
}

function addSuccessAlert(message, time = 3000) {
    addCloneAlert(successAlert, message, time);
}

function addErrorAlert(message, time = 3000) {
    addCloneAlert(errorAlert, message, time);
}
