/**
 *
 */

var modelBody = document.getElementById("modal-body");

document.getElementById("submit").addEventListener("click", function (e) {
    let doctor = mapForm2DoctorObject();
    let isValid = validateDoctorForm(doctor);
    if (isValid) {
        fetch(BASE_DOCTOR_API + "/update", {
            method: "PUT",
            headers: {
                "Content-Type": "application/json",
            },
            body: JSON.stringify(doctor),
        })
            .then((response) => {
                if (response.status === ACCEPTED) {
                    modelBody.innerHTML = `Update Doctor successfully!`;
                    $("#alertModel").modal("show");
                }
                if (response.status === BAD_REQUEST) {
                    return response.json();
                }
            })
            .catch((error) => {
                modelBody.innerHTML = `Update Doctor failure!<br>Internal Error`;
                $("#alertModel").modal("show");
            })
            .then((data) => {
                data && showErrorMsg(data);
            });
    }
});
