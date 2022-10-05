/**
 *
 */

// Test part
var searchDoctorModel = document.getElementById("searchDoctorModel");
var doctorListTable = document.getElementById("doctor-list");

document.getElementById("btn-doctor").addEventListener("click", function (e) {
    $("#searchDoctorModel").modal("show");
});

document
    .getElementById("btn-doctor-search")
    .addEventListener("click", function (e) {
        let form = document.forms["doctor-filter"];
        let formData = new FormData(form);
        let urlParams = new URLSearchParams(formData);

        fetch(BASE_DOCTOR_API + "/findByName?" + urlParams.toString(), {
            method: "GET",
        })
            .then((response) => {
                if (response.status == OK) return response.json();
                else console.log(response);
            })
            .then((data) => {
                let doctorListTable = document.getElementById("doctor-list");
                doctorListTable.innerHTML = "";
                let tr, td;
                for (let i = 0; i < data.length; i++) {
                    let doctor = data[i];
                    tr = document.createElement("tr");

                    td = document.createElement("td");
                    td.innerHTML = `${doctor.name}`;
                    tr.append(td);

                    td = td.cloneNode();
                    td.innerHTML = `${doctor.phoneNumber}`;
                    tr.append(td);

                    td = td.cloneNode();
                    td.innerHTML = doctor.department?.name || " ";
                    tr.append(td);

                    td = td.cloneNode();
                    td.innerHTML = `<button type="button" class="btn btn-primary"><i class="fa fa-check" aria-hidden="true"></i></button>`;
                    td.addEventListener("click", function (e) {
                        fillDoctorForm(doctor);
                        $("#searchDoctorModel").modal("hide");
                    });
                    tr.append(td);
                    doctorListTable.append(tr);
                }
            })
            .catch((error) => {
                console.log(error);
            });
    });

function fillDoctorForm(doctor) {
    let form = document.forms["doctor-form"];
    form.doctorId.value = doctor.id;
    form.doctorName.value = doctor.name;
    form.doctorPhoneNumber.value = doctor.phoneNumber;
}
