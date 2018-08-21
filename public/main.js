console.log("Everything is in control.")


// passcode

function disable() {
  // document.getElementById('loginBtn').disabled = true;
  // document.getElementById('signupBtn').disabled = true;
  document.getElementById('enter').disabled = true;
}


var passfield = document.getElementById('passField');
passfield.innerHTML = "Enter Passcode";

var nav = document.getElementById("nav")
var footer = document.getElementById("footer")

function clearField() {
  passfield.innerHTML = "Enter Passcode";
}

function enterField() {
  if (passfield.innerHTML == "616") {
    document.getElementById('enter').disabled = false;
    passfield.innerHTML = "Come on in.";
  }
  else {
    passfield.innerHTML = "Wrong Password, Avenger"
  }
}

function update(x) {
  if (passfield.innerHTML == "Enter Passcode" || passfield.innerHTML == "Wrong Password, Avenger") {
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
