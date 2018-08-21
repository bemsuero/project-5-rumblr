console.log("Everything is in control.")


// passcode

var passfield = document.getElementById('passField');
passfield.innerHTML = "Enter Passcode";

var nav = document.getElementById('nav')

function clearField() {
  passfield.innerHTML = "Enter Passcode";
}

function submitField() {
  if (passfield.innerHTML == "616") {
    nav.classList.add("reveal");
    nav.classList.remove("hide");
  }
  else {
    passfield.innerHTML = "Wrong Password, Avenger"
  }
}

function update(x) {
  if (passfield.innerHTML == "Enter Passcode") {
    passfield.innerHTML = "";
    var textnode = document.createTextNode(x)
    passfield.appendChild(textnode)

}    else {
  var textnode = document.createTextNode(x)
  passfield.appendChild(textnode)
}
}




// password verify

var password = document.getElementById("password")
, confirmPassword = document.getElementById("confirmPassword");

function validatePassword(){
  if(password.value != confirmPassword.value) {
    confirmPassword.setCustomValidity("Passwords Don't Match");
  } else {
    confirmPassword.setCustomValidity('');
  }
}

password.onchange = validatePassword;
confirmPassword.onkeyup = validatePassword;
