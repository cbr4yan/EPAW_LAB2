<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"
%>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <title>Registration form</title>
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
<div id="register-form" class="container">
  <div class="columns">
    <div class="column is-4 is-offset-4">
      <form action="">
        <div class="field">
          <p class="control">
            <input class="input" type="text" name="username" id="register-username" placeholder="Username"
                   maxlength="30" required>
          </p>
        </div>
        <div class="field">
          <p class="control">
            <input class="input" type="password" name="password" id="register-password" placeholder="Password"
                   maxlength="100" required>
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
            <input class="input" type="email" name="email" id="register-email" placeholder="Email" maxlength="100"
                   required>
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
                  <select name="dob-month" id="register-dob-month" required>
                    <option disabled selected>Month</option>
                    <option value="1">January</option>
                    <option value="2">February</option>
                    <option value="3">March</option>
                    <option value="4">April</option>
                    <option value="5">May</option>
                    <option value="6">June</option>
                    <option value="7">July</option>
                    <option value="8">August</option>
                    <option value="9">September</option>
                    <option value="10">October</option>
                    <option value="11">November</option>
                    <option value="12">December</option>
                  </select>
                </span>
              </p>
            </div>
            <div class="field">
              <p class="control">
                <input class="input" type="text" placeholder="Year" min="1900" max="2000" maxlength="4" required>
              </p>
            </div>
          </div>
        </div>
        <hr>
        <div class="field">
          <p class="control">
            <input class="input" type="text" placeholder="Name">
          </p>
        </div>
        <div class="field">
          <p class="control">
            <input class="input" type="text" placeholder="Surname">
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

<script src="./public/main.js"></script>
</body>
</html>
