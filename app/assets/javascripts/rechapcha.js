function validateRecaptcha ( code ) {
    if ( !!code ) {
      var form = document.querySelector(".signup_btn");
      form.removeAttribute('disabled');
    }
  }
