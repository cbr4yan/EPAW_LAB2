<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" import="models.BeanUser" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <title>Sign Up</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bulma/0.4.1/css/bulma.min.css"/>
  <style>
    #register-form {
      padding-top: 30px;
    }

    input#register-dob-day {
      margin-right: 30px;
    }

    input::-webkit-outer-spin-button,
    input::-webkit-inner-spin-button {
      /* display: none; <- Crashes Chrome on hover */
      -webkit-appearance: none;
      margin: 0; /* <-- Apparently some margin are still there even though it's hidden */
    }

    .is-hidden {
      display: none;
    }
  </style>
</head>
<body>
<%
  BeanUser user = null;
  if (request.getAttribute("user")!=null) {
    user = (BeanUser)request.getAttribute("user");
  }
  else {
    user = new BeanUser();
  }
%>
<div class="container">
  <div class="nav">
    <div class="nav-left">
      <a class="nav-item">
        Logo
      </a>
    </div>

    <span class="nav-toggle">
        <span></span>
        <span></span>
        <span></span>
      </span>

    <div class="nav-right nav-menu">
      <a class="nav-item">
        LOGIN
      </a>
      <a href="../Register.jsp" class="nav-item">
        SIGN UP
      </a>
    </div>
  </div>
  <div class="section register-form">
      <div class="columns">
        <div class="column is-4 is-offset-4">
          <form action="/Lab_2/FormController" method="post">
            <div class="field">
              <p class="control">
                <input class="input" type="text" name="username" id="register-username" value="<%=user.getUsername()%>" placeholder="Username"
                       maxlength="30" <%=user.getError()[0] == 1 ? "data-error-username=\"The username already exists in our DB!\"" : ""%> required>
                <p id="register-username-error" class="help is-danger is-hidden"></p>
              </p>
            </div>
            <div class="field">
              <p class="control">
                <input class="input" type="password" name="password" id="register-password" placeholder="Password"
                       maxlength="100" required>
                <p id="register-email-error" class="help is-danger is-hidden"></p>     
              </p>
            </div>
            <div class="field">
              <p class="control">
                <input class="input" type="password" name="confirm_password" id="register-confirm-password"
                       placeholder="Confirm password" maxlength="100" required>
              </p>
              <p id="register-confirm-password-error" class="help is-danger is-hidden"></p>
            </div>
            <div class="field">
              <p class="control">
                <input class="input" type="email" name="email" id="register-email" value="<%=user.getEmail()%>" placeholder="Email" maxlength="100"
                       <%=user.getError()[1] == 1 ? "data-error-email=\"The email already exists in our DB!\"" : ""%>required>
              </p>
            </div>
            <div class="field is-horizontal">
              <div class="field-body">
                <div class="field">
                  <p class="control">
                    <input class="input" type="number" name="dob_day" id="register-dob-day" placeholder="Day" min="1"
                           max="31" maxlength="2" required>
                  </p>
                </div>
                <div class="field">
                  <p class="control">
                <span class="select">
                  <select name="dob_month" id="register-dob-month" required>
                    <option disabled selected>Month</option>
                    <option value="01">January</option>
                    <option value="02">February</option>
                    <option value="03">March</option>
                    <option value="04">April</option>
                    <option value="05">May</option>
                    <option value="06">June</option>
                    <option value="07">July</option>
                    <option value="08">August</option>
                    <option value="09">September</option>
                    <option value="10">October</option>
                    <option value="11">November</option>
                    <option value="12">December</option>
                  </select>
                </span>
                  </p>
                </div>
                <div class="field">
                  <p class="control">
                    <input class="input" type="text" id="register-dob-year" name="dob_year" placeholder="Year" min="1900" max="2000" maxlength="4" required>
                  </p>
                </div>
              </div>
            </div>
            <hr>
            <div class="field">
              <p class="control">
                <input class="input" type="text" name="name" placeholder="Name">
              </p>
            </div>
            <div class="field">
              <p class="control">
                <input class="input" type="text" name="surname" placeholder="Surname">
              </p>
            </div>
            <div class="field">
              <p class="control">
                <label for="register-male" class="radio">
                  <input type="radio" id="register-male" value="male" name="gender">
                  Male
                </label>
                <label for="register-female" class="radio">
                  <input type="radio" id="register-female" value="female" name="gender">
                  Female
                </label>
                <label for="register-other" class="radio">
                  <input type="radio" id="register-other" value="other" name="gender">
                  Other
                </label>
              </p>
            </div>
            <br>
            <div class="field">
              <p class="control is-expanded">
                <input type="submit" class="button is-primary is-fullwidth" value="SIGN UP">
              </p>
            </div>
          </form>
        </div>
      </div>
    </div>
</div>
<script>

	// Validate username doesn't exist on the DB
	var username = document.querySelector("#register-username");
	
	function errorUsername() {
	    var error = document.querySelector('#register-username-error');
	    error.innerText = 'Username exists!';
	    username.classList.add('is-danger');
	    error.classList.remove('is-hidden');
	}
	
	if (username.dataset.errorUsername !== undefined) {
	    errorUsername();
	}

    // Validate password
    var password = document.querySelector('#register-password');
    var confirmPassword = document.querySelector('#register-confirm-password');

    function isSamePassword(password, confirmPassword) {
        if (password.value != confirmPassword.value) {
            return false;
        }
        return true;
    }

    function validatePassword() {
        var error = document.querySelector('#register-confirm-password-error');
        error.innerText = 'Password doesn\'t match';

        if (isSamePassword(password, confirmPassword)) {
            confirmPassword.classList.remove('is-danger');
            error.classList.add('is-hidden');
        } else {
            confirmPassword.classList.add('is-danger');
            error.classList.remove('is-hidden');
        }
    }
    confirmPassword.addEventListener('keyup', validatePassword);
    
    
    // Validate email  doesn't exist on the DB
    var email = document.querySelector("#register-email");
    function errorEmail() {
        var error = document.querySelector('#register-email-error');
        error.innerText = 'Email exists!';
        email.classList.add('is-danger');
        error.classList.remove('is-hidden');
    }

    if (email.dataset.errorEmail !== undefined) {
        errorEmail();
    }
</script>
</body>
</html>
