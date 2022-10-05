var labelErrors = document.querySelectorAll("label.error-msg");

function showErrorMsg(errors) {
    let msg, field;
    for (let label of labelErrors) {
        field = label.getAttribute("for");
        msg = errors[field] || "";
        label.innerText = msg;
    }
}

function validateMedicine(medicine) {
    let errors = new Object();
    let r = true;
    if (!medicine.name.length) {
        errors.name = "Please fill medicine name";
        r = false;
    }
    if (!medicine.unit.length) {
        errors.unit = "Please fill edicine unit";
        r = false;
    }
    showErrorMsg(errors);
    return r;
}

function mapForm2MedicineObject() {
    let medicineForm = document.forms.medicine;
    let medicine = new Object({
        id: medicineForm.id?.value,
        name: medicineForm.name.value,
        unit: medicineForm.unit.value,
        instruction: medicineForm.instruction.value,
    });
    return medicine;
}
