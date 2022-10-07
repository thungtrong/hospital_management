/**
 *
 */
let modalBody = document.getElementById("modal-body");

let removedTestFormDetailIds = [];
function removeTestFormDetailsToUrlParam() {
    let urlParam = "?";
    for (let i = 0; i < removedTestFormDetailIds.length; i++) {
        urlParam += `ids=${removedTestFormDetailIds[i]}&`;
    }
    return urlParam.slice(0, -1);
}

document.getElementById("submit").addEventListener("click", function (e) {
    let testFormRequest = mapForm2TestFormObject();
    testFormRequest.removedTestFormDetailIds = removedTestFormDetailIds;
    fetch(BASE_TEST_FORM_API + "/update", {
        method: "PUT",
        headers: {
            "Content-Type": "application/json",
        },
        body: JSON.stringify(testFormRequest),
    })
        .then((response) => {
            let isSuccess = response.status === ACCEPTED;

            if (isSuccess) {
                modalBody.innerHTML = `Update Test Form successfully!`;
                $("#alertModal").modal("show");
            } else {
                modalBody.innerHTML = `Update Test Form failure!`;
                $("#alertModal").modal("show");
            }
        })
        .catch((error) => {
            console.error(error);
            modalBody.innerHTML = `Update Test Form failure!<br>Internal Error`;
            $("#alertModal").modal("show");
        });
});

let btnList = document.getElementsByClassName("btn-remove-row");
let tbodyTestDetail = document.getElementById("list-test-form-detail");
let nothingElement = document.createElement("tr");
nothingElement.innerHTML = `<td colspan='4' class='text-center'>Nothing to show</td>`;

function removeRow(e) {
    e.preventDefault();
    let selectedRow;
    if (e.target.tagName.toLowerCase() === "i")
        selectedRow = e.target.parentElement.parentElement.parentElement;
    if (e.target.tagName.toLowerCase() === "button")
        selectedRow = e.target.parentElement.parentElement;

    let inputs = selectedRow.getElementsByClassName("test-form-detail-data")[0]
        .children;
    let inputTestFormDetailId = inputs[2];

    if (inputTestFormDetailId) {
        removedTestFormDetailIds.push(inputTestFormDetailId.value);
    }
    // Remove row
    tbodyTestDetail.removeChild(selectedRow);

    if (tbodyTestDetail.childElementCount === 0)
        tbodyTestDetail.append(nothingElement);
}

for (let i = 0; i < btnList.length; i++) {
    btnList[i].addEventListener("click", removeRow, true);
}

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
    let testForm = document.forms["test-form"];
    testForm.patientId.value = patient.id;
    testForm.name.value = patient.name;
    testForm.gender.value = patient.gender;
    testForm.dateOfBirth.value = patient.dateOfBirth;
    testForm.phoneNumber.value = patient.phoneNumber;
    testForm.address.value = patient.address;
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
function removeNothingMsg() {
    if (tbodyTestDetail.firstElementChild.className === "nothing")
        tbodyTestDetail.removeChild(tbodyTestDetail.firstElementChild);
}
function addTestDetails(test) {
    removeNothingMsg();
    let tr = document.createElement("tr");
    tr.innerHTML = `<td>${test.testName}</td>
    <td>${test.normalResult}</td>
    <td class="test-form-detail-data">
        <input type="hidden" value="${test.id}">
        <input class="input" type="text" name="result" placeholder="Fill test result">
    </td>`;

    let button = document.createElement("button");
    button.type = "button";
    button.innerHTML = `<i class="fa fa-times" aria-hidden="true"></i>`;

    button.addEventListener("click", removeRow, true);

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
        id: form.testFormId.value,
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
            id: inputs[2]?.value,
            test: { id: inputs[0].value },
            result: inputs[1].value,
        });
    }

    return testFormObject;
}
