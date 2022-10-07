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

function mapForm2HealthRecordObject() {
    let doctorForm = document.forms["doctor-form"];
    let patientForm = document.forms["patient-form"];
    let healthRecordForm = document.forms["health-record-form"];

    let healthRecordObject = new Object();
    healthRecordObject.creationDate = new Date(
        healthRecordForm.creationDate.value
    );
    healthRecordObject.reDate = new Date(healthRecordForm.reDate.value);
    healthRecordObject.doctor = { id: doctorForm.doctorId.value };
    healthRecordObject.patient = { id: patientForm.patientId.value };

    let illnessIdList = document.querySelectorAll("tr #illness-data input");
    healthRecordObject.illnessList = [];
    for (let i = 0; i < illnessIdList.length; i++) {
        healthRecordObject.illnessList.push({ id: illnessIdList[i].value });
    }

    healthRecordObject.healthRecordDetails = [];
    let prescriptionDetails = document.querySelectorAll(
        "#list-prescription-detail tr #prescription-data input"
    );
    for (let i = 0; i < prescriptionDetails.length; i += 3) {
        let detail = {
            id: prescriptionDetails[i].value,
            medicine: { id: prescriptionDetails[i + 1].value },
            quantity: prescriptionDetails[i + 2].value,
        };
        healthRecordObject.healthRecordDetails.push(detail);
    }

    return healthRecordObject;
}