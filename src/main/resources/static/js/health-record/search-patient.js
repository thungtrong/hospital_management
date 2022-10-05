/**
 *
 */

// Patient Search part
var searchPatientModel = document.getElementById("searchPatientModel");

document.getElementById("btn-patient").addEventListener("click", function (e) {
    $("#searchPatientModel").modal("show");
});

document
    .getElementById("btn-patient-search")
    .addEventListener("click", function (e) {
        let form = document.forms["patient-filter"];
        if (!(form.name.value || form.phoneNumber.value)) {
            document.getElementById("patient-filter-message").innerHTML =
                "Please enter patient name or phone number";
            return;
        }

        let formData = new FormData(form);
        let urlParams = new URLSearchParams(formData);

        fetch(
            BASE_PATIENT_API + "/findByNameAndPhone?" + urlParams.toString(),
            {
                method: "GET",
            }
        )
            .then((response) => response.json())
            .then((data) => {
                let patientListTable = document.getElementById("patient-list");
                patientListTable.innerHTML = "";
                let tr, td;

                if (data.length === 0) {
                    tr = document.createElement("tr");
                    tr.innerHTML =
                        "<td colspan='4' class='text-center'>Nothings to show</td>";
                    patientListTable.append(tr);
                    return;
                }

                for (let i = 0; i < data.length; i++) {
                    let patient = data[i];
                    tr = document.createElement("tr");

                    td = document.createElement("td");
                    td.innerHTML = `${patient.name}`;
                    tr.append(td);

                    td = td.cloneNode();
                    td.innerHTML = `${patient.phoneNumber}`;
                    tr.append(td);

                    td = td.cloneNode();
                    td.innerHTML = `${patient.dateOfBirth}`;
                    tr.append(td);

                    td = td.cloneNode();
                    td.innerHTML = `<button type="button" class="btn btn-primary"><i class="fa fa-check" aria-hidden="true"></i></button>`;
                    td.addEventListener("click", function (e) {
                        fillPatienFormPart(patient);
                        $("#searchPatientModel").modal("hide");
                    });
                    tr.append(td);
                    patientListTable.append(tr);
                }
            })
            .catch((error) => {
                console.log(error);
            });
    });

function fillPatienFormPart(patient) {
    let healthRecord = document.forms["patient-form"];
    healthRecord.patientId.value = patient.id;
    healthRecord.patientName.value = patient.name;
    healthRecord.patientGender.value = patient.gender;
    healthRecord.patientDateOfBirth.value = patient.dateOfBirth;
    healthRecord.patientPhoneNumber.value = patient.phoneNumber;
    healthRecord.patientAddress.value = patient.address;
}
