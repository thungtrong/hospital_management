/**
 *
 */

var modelBody = document.getElementById("modal-body");

document.getElementById("submit").addEventListener("click", async function (e) {
    let doctor = mapForm2DoctorObject();
    let isValid = validateDoctorForm(doctor);
    if (isValid) {
        let response = await fetch(BASE_DOCTOR_API + "/update", {
            method: "PUT",
            headers: {
                "Content-Type": "application/json",
            },
            body: JSON.stringify(doctor),
        })
        .catch((error) => {
            modelBody.innerHTML = `Update profile failure!<br>Internal Error`;
            $("#alertModel").modal("show");
        });

        if (response.status === ACCEPTED) {
            modelBody.innerHTML = `Update profile successfully!`;
            $("#alertModel").modal("show");
        }

        if (response.status === BAD_REQUEST) {
            let data = await response.json();
            data && showErrorMsg(data);
        }
    }
});
