document.getElementById("btn-continue").addEventListener("click", () => {
    document.forms.test.reset();
});

document.getElementById("submit").addEventListener("click", function (e) {
    let testForm = document.forms.test;
    let test = new Object({
        testName: testForm.testName.value,
        normalResult: testForm.normalResult.value,
        description: testForm.description.value,
    });
    let isValid = validateTest(test);
    if (isValid) {
        fetch(BASE_TEST_API + "/create", {
            method: "POST",
            headers: {
                "Content-Type": "application/json",
            },
            body: JSON.stringify(test),
        })
            .then((response) => {
                let modalBody = document.getElementById("modal-body");
                if (response.status === CREATED) {
                    modalBody.innerHTML = `Create Test successfully!`;
                    $("#alertModel").modal("show");
                } else {
                    modalBody.innerHTML = `Create Test failure!`;
                    $("#alertModel").modal("show");
                    return response.json();
                }
            })
            .then((data) => {
                if (data) {
                    showErrorMsg(data);
                }
            });
    }
});

function goToTestList() {
    window.location.href = BASE_TEST_URL;
}

function goBack() {
    history.back();
}
