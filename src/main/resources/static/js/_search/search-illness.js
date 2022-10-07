// Test part
var searchIllnessModel = document.getElementById("searchIllnessModel");
var illnessListTable = document.getElementById("illness-list");

document.getElementById("btn-illness").addEventListener("click", function (e) {
    $("#searchIllnessModel").modal("show");
});

document
    .getElementById("btn-illness-search")
    .addEventListener("click", function (e) {
        let form = document.forms["illness-filter"];
        document.getElementById("illness-filter-message").innerHTML = "";
        if (!form.name.value) {
            document.getElementById("illness-filter-message").innerHTML =
                "Please enter a illness name";
            return;
        }

        fetch(`${BASE_ILLNESS_API}/findByName?name=${form.name.value}`, {
            method: "GET",
        })
            .then((response) => {
                if (response.status == OK) return response.json();
                else console.log(response);
            })
            .then((data) => {
                let illnessListTable = document.getElementById("illness-list");
                illnessListTable.innerHTML = "";                
                if (data.length === 0) {
                    let tr = document.createElement("tr");
                    tr.innerHTML =
                        "<td colspan='4' class='text-center'>Nothing to show</td>";
                        illnessListTable.append(tr);
                    return;
                }

                let row;
                for (let i = 0; i < data.length; i++) {
                    let illness = data[i];
                    row = generateIllnessRow(illness);
                    illnessListTable.append(row);
                }
            })
            .catch((error) => {
                console.log(error);
            });
    });

function generateIllnessRow(illness) {
    let tr, td;
    tr = document.createElement("tr");

    td = document.createElement("td");
    td.innerHTML = `${illness.name}`;
    tr.append(td);

    td = td.cloneNode();
    td.innerHTML = `${illness.description}`;
    tr.append(td);

    td = td.cloneNode();
    td.innerHTML = `<button type="button" class="btn btn-primary"><i class="fa fa-check" aria-hidden="true"></i></button>`;
    td.addEventListener("click", function (e) {
        insertIllnessIntoTable(illness);
        $("#searchIllnessModel").modal("hide");
    });
    tr.append(td);
    return tr;
}

let tbodyListIllness = document.getElementById("tbody-list-illness");
let nothingElement3 = document.createElement("tr");
nothingElement3.className = "nothing";
nothingElement3.innerHTML = `<td class="text-center" colspan="3">Nothing to show</td>`;

function removeIllnessNothingElement() {
    if (tbodyListIllness.firstElementChild?.className == "nothing")
        tbodyListIllness.innerHTML = "";
}

function insertIllnessIntoTable(illness) {
    removeIllnessNothingElement();

    let tr = document.createElement("tr");
    tr.innerHTML = `<td id="illness-data">${illness.name}<input type="hidden" value="${illness.id}"></td>
    <td>${illness.description}</td>`;

    let button = document.createElement("button");
    button.className = "btn-remove-illness";
    button.type = "button";
    button.innerHTML = `<i class="fa fa-times" aria-hidden="true"></i>`;
    button.addEventListener("click", removeIllnessRow, true);

    let td = document.createElement("td");
    td.append(button);

    tr.append(td);
    tbodyListIllness.append(tr);
}

const removeIllnessIds = [];

function removeIllnessRow(e) {
    e.preventDefault();
    let selectedRow;
    if (e.target.tagName.toLowerCase() === "i")
        selectedRow = e.target.parentElement.parentElement.parentElement;
    if (e.target.tagName.toLowerCase() === "button")
        selectedRow = e.target.parentElement.parentElement;

    tbodyListIllness.removeChild(selectedRow);
    if (tbodyListIllness.childElementCount === 0)
        tbodyListIllness.append(nothingElement3);

    let id = selectedRow.querySelector("#illness-data input");
    removeIllnessIds.push(id.value);
}

let btnRemoves = document.getElementsByClassName("btn-remove-illness");
for (let i = 0; i < btnRemoves.length; i++) {
    let btn = btnRemoves[i];
    btn.addEventListener("click", removeIllnessRow, true);
}
