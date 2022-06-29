extension Validator on String {
  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }

  bool hasUppercase() {
    return RegExp(r'(?=.*[A-Z])').hasMatch(this);
  }

  bool hasLetter() {
    return RegExp(r'(?=.*[a-zA-Z])').hasMatch(this);
  }

  bool hasDigits() {
    return RegExp(r'(?=.*[0-9])').hasMatch(this);
  }

  bool hasLowercase() {
    return RegExp(r'(?=.*[a-z])').hasMatch(this);
  }

  bool hasSpecialCharacters() {
    return RegExp(r'(?=.*[!@#$%^&*(),.?":{}|<>])').hasMatch(this);
  }

  bool isValidPhone() {
    return RegExp(r'^(\+62|62|0)8[1-9][0-9]{6,9}$').hasMatch(this);
  }
}
