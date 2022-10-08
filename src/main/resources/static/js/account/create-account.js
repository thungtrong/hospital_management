function fillDoctorForm(doctor) {
    let form = document.forms["account"];
    form.doctorId.value = doctor.id;
    form.name.value = doctor.name;
    form.phoneNumber.value = doctor.phoneNumber;
    form.dateOfBirth.value = doctor.dateOfBirth;
    form.address.value = doctor.address;
}

document.getElementById("submit").addEventListener("click", onSubmit);
async function onSubmit(e) {
    let form = document.forms["account"];
    let account = {
        username: form.username.value,
        doctor: { id: form.doctorId.value },
    };

    let response = await fetch("/api/account/create", {
        body: JSON.stringify(account),
        method: "POST",
        headers: {
            "Content-Type": "application/json",
        },
    });

    let data = await response.json();
    let modelBody = document.getElementById("modal-body");

    $("#alertModal").modal("show");
    modelBody.innerHTML = data.message;
}

document.getElementById("btn-continue").addEventListener("click", (e) => {
    let form = document.forms["account"];
    form.reset();
});

function goBack() {
    history.back();
}
