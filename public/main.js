console.log("Everything is in control.")

// passcode

function disable() {
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
// Update Info/change Text

var textInfo = document.getElementById('infoText');
textInfo.innerHTML = "Welcome to Top Secret! We are heroes from Universe <i>616</i>. Though we do appreciate heroes from any universe to join us. Sign up, and sign in and post to our feed and if you can figure out the combination, join us on our events.";

function changeText(x) {
  if (x == "1") {
    textInfo.innerHTML = "Welcome to Top Secret! We are heroes from Universe <i>616</i>. Though we do appreciate heroes from any universe to join us. Sign up, and sign in and post to our feed and if you can figure out the combination, join us on our events.";
}  if (x == "2") {
  textInfo.innerHTML = "<p>Created by Bemilton Suero</p><a href='https://github.com/bemsuero'>GitHub</a><br><a href='https://www.linkedin.com/in/bemilton-suero/'>Linkedin</a><br>  <a href='https://ko-fi.com/milesmorales'>Ko-Fi</a><br>";
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
