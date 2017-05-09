// validate password
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
