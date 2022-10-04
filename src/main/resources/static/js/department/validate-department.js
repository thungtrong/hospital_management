/**
 *
 */
var departmentForm = document.forms.department;
var labelErrors = document.querySelectorAll("label.error-msg");

const ERROR_EMPTY_MESSAGES = {
    name: 'Please fill department name',
    description: 'Please fill department description'
}


function validateDepartmentForm(department) {
    let errors = new Object();
    let isValid = true;
    if (department.name.match() == null)
    {
        errors['name'] = "Please fill department name";
    }

    if (departmentForm.id)
        department.id = departmentForm.id.value;
    showErrorMsg(errors);
    return isValid;
}

function goToDepartmentList()
{
    window.location.href=BASE_DEPARTMENT_URL;
}

function goBack()
{
    history.back();
}

function mapForm2Object()
{
    let department = new Object();
    department.name = departmentForm.name.value;
    department.description = departmentForm.description.value;
    return department;
}

function showErrorMsg(errors)
{
    let msg, field;
    for (let label of labelErrors) {
        field = label.getAttribute("for");
        msg = errors[field] || "";
        label.innerText=msg;
    }
}
