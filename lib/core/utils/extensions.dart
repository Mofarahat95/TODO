extension EmailValidator on String {
  bool isValidEmail(String email) {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))'
            r'@((\[[0-9]{1,3}\.[0-9]{1,3}\'
            r'.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(email);
  }

  bool isValidName(String name) {
    return name.isNotEmpty && name.length > 2;
  }

  bool isValidPhone(String phone) {
    return RegExp(r'^01[0-9]\d{8}$').hasMatch(phone);
  }


  bool isValidPassword(String password) {
    return password.length >= 8 &&
        RegExp(r'[A-Z]').hasMatch(password) &&
        RegExp(r'[a-z]').hasMatch(password) &&
        RegExp(r'[0-9]').hasMatch(password) &&
        RegExp(r'[!@#\$%^&*(),.?":{}|<>]').hasMatch(password);
  }

  bool isPasswordMatch(String password, String confirmPassword) {
    return password == confirmPassword;
  }
}
