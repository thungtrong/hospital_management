document.getElementById("submit").addEventListener("click", function (e) {
    let testForm = mapForm2TestFormObject();

    fetch(BASE_TEST_FORM_API + "/create", {
        method: "POST",
        headers: {
            "Content-Type": "application/json",
        },
        body: JSON.stringify(testForm),
    }).then((response) => {
        let modalBody = document.getElementById("modal-body");
        if (response.status === CREATED) {
            modalBody.innerHTML = `Create Test Form successfully!`;
            $("#alertModal").modal("show");
        } else {
            modalBody.innerHTML = `Create Test Form failure!`;
            $("#alertModal").modal("show");
            return response.json();
        }
    });
});

// Patient part
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
                        "<td colspan='4' class='text-center'>Nothing to show</td>";
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
    let admissionForm = document.forms["test-form"];
    admissionForm.patientId.value = patient.id;
    admissionForm.name.value = patient.name;
    admissionForm.gender.value = patient.gender;
    admissionForm.dateOfBirth.value = patient.dateOfBirth;
    admissionForm.phoneNumber.value = patient.phoneNumber;
    admissionForm.address.value = patient.address;
}

function goToTestFormList() {
    window.location.href = BASE_TEST_FORM_URL;
}

function goBack() {
    history.back();
}

// Test part
var searchTestModel = document.getElementById("searchTestModel");

document
    .getElementById("btn-test-detail")
    .addEventListener("click", function (e) {
        $("#searchTestModel").modal("show");
    });

document
    .getElementById("btn-test-search")
    .addEventListener("click", function (e) {
        let form = document.forms["test-filter"];
        let formData = new FormData(form);
        let urlParams = new URLSearchParams(formData);

        fetch(BASE_TEST_API + "/findByName?" + urlParams.toString(), {
            method: "GET",
        })
            .then((response) => {
                if (response.status == 200) return response.json();
                else console.log(response);
            })
            .then((data) => {
                let testListTable = document.getElementById("test-list");
                testListTable.innerHTML = "";
                let tr, td;
                for (let i = 0; i < data.length; i++) {
                    let test = data[i];
                    tr = document.createElement("tr");

                    td = document.createElement("td");
                    td.innerHTML = `${test.testName}`;
                    tr.append(td);

                    td = td.cloneNode();
                    td.innerHTML = `${test.normalResult}`;
                    tr.append(td);

                    td = td.cloneNode();
                    td.innerHTML = `<button type="button" class="btn btn-primary"><i class="fa fa-check" aria-hidden="true"></i></button>`;
                    td.addEventListener("click", function (e) {
                        addTestDetails(test);
                        $("#searchTestModel").modal("hide");
                    });
                    tr.append(td);
                    testListTable.append(tr);
                }
            })
            .catch((error) => {
                console.log(error);
            });
    });

// function
let tbodyTestDetail = document.getElementById("list-test-form-detail");
let nothingElement = tbodyTestDetail.firstElementChild;
function removeNothingMsg() {
    if (tbodyTestDetail.firstElementChild.className === "nothing")
        tbodyTestDetail.removeChild(tbodyTestDetail.firstElementChild);
}
function addTestDetails(testDetail) {
    removeNothingMsg();
    let tr = document.createElement("tr");
    tr.innerHTML = `<td>${testDetail.testName}</td>
    <td>${testDetail.normalResult}</td>
    <td class="test-form-detail-data">
        <input type="hidden" value="${testDetail.id}">
        <input class="input" type="text" name="result" placeholder="Fill test result">
    </td>`;

    let button = document.createElement("button");
    button.type = "button";
    button.innerHTML = `<i class="fa fa-times" aria-hidden="true"></i>`;

    button.addEventListener(
        "click",
        (e) => {
            e.preventDefault();
            let selectedRow;
            if (e.target.tagName.toLowerCase() === "i")
                selectedRow =
                    e.target.parentElement.parentElement.parentElement;
            if (e.target.tagName.toLowerCase() === "button")
                selectedRow = e.target.parentElement.parentElement;
            tbodyTestDetail.removeChild(selectedRow);
            if (tbodyTestDetail.childElementCount === 0)
                tbodyTestDetail.append(nothingElement);
        },
        true
    );

    let td = document.createElement("td");
    td.append(button);

    tr.append(td);
    tbodyTestDetail.append(tr);
}

function mapForm2TestFormObject() {
    let form = document.forms["test-form"];
    let patientId = form.patientId.value;
    let creationDate = new Date(form.creationDate.value);
    let testFormObject = new Object({
        patient: { id: patientId },
        creationDate: creationDate,
        details: [],
    });
    let testDetailTBody = document.getElementById("list-test-form-detail");
    let testDetails = document.getElementsByClassName("test-form-detail-data");
    let inputs;
    for (let i = 0; i < testDetails.length; i++) {
        inputs = testDetails[i].children;
        testFormObject.details.push({
            test: { id: inputs[0].value },
            result: inputs[1].value,
        });
    }
    return testFormObject;
}

document.getElementById("btn-continue").addEventListener("click", () => {
    document.forms["test-form"].reset();
    tbodyTestDetail.innerHTML = "";
    tbodyTestDetail.append(nothingElement);
});
