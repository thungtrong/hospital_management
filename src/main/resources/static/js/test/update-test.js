/**
 *
 */

var modelBody = document.getElementById("modal-body");

document.getElementById("submit").addEventListener("click", function (e) {
    let testForm = document.forms.test;
    let test = new Object({
        id: testForm.testId.value,
        testName: testForm.testName.value,
        normalResult: testForm.normalResult.value,
        description: testForm.description.value,
    });
    let isValid = validateTest(test);
    if (isValid) {
        fetch(BASE_TEST_API + "/update", {
            method: "PUT",
            headers: {
                "Content-Type": "application/json",
            },
            body: JSON.stringify(test),
        })
            .then((response) => {
                if (response.status === ACCEPTED) {
                    modelBody.innerHTML = `Update Test successfully!`;
                    $("#alertModel").modal("show");
                }
                if (response.status === BAD_REQUEST) {
                    return response.json();
                }
            })
            .catch((error) => {
                modelBody.innerHTML = `Update Test failure!<br>Internal Error`;
                $("#alertModel").modal("show");
            })
            .then((data) => {
                data && showErrorMsg(data);
            });
    }
});

function goBack() {
    history.back();
}

function goToTestList() {
    window.location.href = BASE_ADMISSION_URL;
}
