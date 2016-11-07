  function validateLoginForm() {
  	var emailValue = document.getElementById("InputEmail").value;
	var passValue = document.getElementById("InputPassword").value;
	if (emailValue == null || emailValue == "") {
        alert("Email address field must be filled out");
        return false;
    }
	if (passValue == null || passValue == "") {
        alert("Password field must be filled out");
        return false;
    }
	var atPosition = emailValue.indexOf("@");
    var dotPosition = emailValue.lastIndexOf(".");
	if(atPosition == -1 || atPosition == 0 || dotPosition == -1)
	{
		alert("Not a valid email address. Please enter a valid email address");
		return false;
	}
	else if((dotPosition < atPosition+2) || (dotPosition+2>=emailValue.length))
    {
        alert("Not a valid email address. Please enter a valid email address");
        return false;
	}
}