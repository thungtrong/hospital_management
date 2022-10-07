// Test part
var searchMedicineModel = document.getElementById("searchMedicineModel");
var medicineListTable = document.getElementById("medicine-list");

document
    .getElementById("btn-prescription-detail")
    .addEventListener("click", function (e) {
        $("#searchMedicineModel").modal("show");
    });

document
    .getElementById("btn-medicine-search")
    .addEventListener("click", function (e) {
        let form = document.forms["medicine-filter"];
        document.getElementById("medicine-filter-message").innerHTML = "";
        if (!form.name.value) {
            document.getElementById("medicine-filter-message").innerHTML =
                "Please enter a medicine name";
            return;
        }

        fetch(`${BASE_MEDICINE_API}/findByName?name=${form.name.value}`, {
            method: "GET",
        })
            .then((response) => {
                if (response.status == OK) return response.json();
                else console.log(response);
            })
            .then((data) => {
                

                let medicineListTable =
                    document.getElementById("medicine-list");
                medicineListTable.innerHTML = "";
                let tr, td;
                if (data.length === 0) {
                    tr = document.createElement("tr");
                    tr.innerHTML =
                        "<td colspan='4' class='text-center'>Nothing to show</td>";
                    medicineListTable.append(tr);
                    return;
                }
                let row;
                for (let i = 0; i < data.length; i++) {
                    let medicine = data[i];
                    row = generateMedicineRow(medicine);
                    medicineListTable.append(row);
                }
            })
            .catch((error) => {
                console.log(error);
            });
    });

function generateMedicineRow(medicine) {
    let tr, td;
    tr = document.createElement("tr");

    td = document.createElement("td");
    td.innerHTML = `${medicine.name}`;
    tr.append(td);

    td = td.cloneNode();
    td.innerHTML = medicine.instruction || " ";
    tr.append(td);

    td = td.cloneNode();
    td.innerHTML = `<button type="button" class="btn btn-primary"><i class="fa fa-check" aria-hidden="true"></i></button>`;
    td.addEventListener("click", function (e) {
        insertMedicineIntoTable(medicine);
        $("#searchMedicineModel").modal("hide");
    });
    tr.append(td);
    return tr;
}

let tbodyListMedicine = document.getElementById("list-prescription-detail");
let nothingElement4 = document.createElement("tr");
nothingElement4.className = "nothing";
nothingElement4.innerHTML = `<td class="text-center" colspan="4">Nothing to show</td>`;

function removeMedinceNothingElement() {
    if (tbodyListMedicine.firstElementChild.className === "nothing")
        tbodyListMedicine.innerHTML = "";
}

function insertMedicineIntoTable(medicine) {
    removeMedinceNothingElement();
    let tr = document.createElement("tr");
    tr.innerHTML = `<td>${medicine.name}</td>
    <td id="prescription-data">
        <input type="hidden" id="prescription-id" value="">
        <input type="hidden" id="medicine-id" value="${medicine.id}">
        <input class="input text-input" type="number" id="quatity" min='0'>
    </td>
    <td>${medicine.unit}</td>
    `;

    let button = document.createElement("button");
    button.className = "btn-health-record-detail-remove";
    button.type = "button";
    button.innerHTML = `<i class="fa fa-times" aria-hidden="true"></i>`;
    button.addEventListener("click", removePrescriptionDetail, true);

    let td = document.createElement("td");
    td.append(button);
    tr.append(td);

    tbodyListMedicine.append(tr);
}
const removeHealthRecordDetailIds = [];

function removePrescriptionDetail(e) {
    e.preventDefault();
    let selectedRow;
    if (e.target.tagName.toLowerCase() === "i")
        selectedRow = e.target.parentElement.parentElement.parentElement;
    if (e.target.tagName.toLowerCase() === "button")
        selectedRow = e.target.parentElement.parentElement;

    tbodyListMedicine.removeChild(selectedRow);
    if (tbodyListMedicine.childElementCount === 0)
        tbodyListMedicine.append(nothingElement4);

    let id = selectedRow.querySelector(
        "#prescription-data input#prescription-id"
    );
    removeHealthRecordDetailIds.push(id.value);
}

let btnRemovePrescriptionDetails = document.getElementsByClassName(
    "btn-health-record-detail-remove"
);
for (let i = 0; i < btnRemovePrescriptionDetails.length; i++) {
    let btn = btnRemovePrescriptionDetails[i];
    btn.addEventListener("click", removePrescriptionDetail, true);
}
