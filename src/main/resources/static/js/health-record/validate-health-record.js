function validateHealthRecord(healthRecord) {
    if (!healthRecord.doctor.id) {
        alert("Please choose a doctor");
        return false;
    }
    if (!healthRecord.patient.id) {
        alert("Please choose a patient");
        return false;
    }
    let details = healthRecord.healthRecordDetails;
    for (let i = 0; i < details.length; i++) {
        if (details.quantity < 0) {
            alert("Please enter quantity greater than zero");
            return false;
        }
    }
    return true;
}
