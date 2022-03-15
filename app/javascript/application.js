// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
function check_pass() {
    var el = document.getElementById("submit");
    var pw = document.getElementById('password').value
    var cpw = document.getElementById('password_confirmation').value 
    var regularExpression  = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;
    if(!regularExpression.test(pw)) {
      document.getElementById("message").innerHTML=
      "Minimum eight characters, at least one uppercase letter, one lowercase letter, one number and one special character";
    }else{
       document.getElementById("message").innerHTML=""
    }
    if (pw == cpw) {
       el.style.display= 'block';
        document.getElementById("message1").innerHTML="";
    } else {
        el.style.display= 'none';
        document.getElementById("message1").innerHTML="Password and confirm Password must be same!";
    }
  }