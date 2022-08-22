//const signInBtn = document.getElementById("login");
//fistForm.addEventListener("submit", (e) => e.preventDefault());


function validateForm() {
  var name=document.myForm.fname.value;  
  var password=document.myForm.password.value;  
  if (name == "" || name ==null) {
    alert("Please filled out this field.");
    return false;
  }
  else if(password.length<6){  
    alert("Password must be at least 6 characters long.");  
    return false;  
    }  
}
