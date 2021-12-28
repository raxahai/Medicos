class Validators {
  static String? validateEmail(String? value, {bool optional = false}) {
    var message = "Email is required";
    if (optional) {
      return null;
    }
    if (value == null) {
      return message;
    }
    if (value.isEmpty) {
      message = message;
    } else {
      // Regex condition and messages

      if (value.endsWith('.') ||
          value.endsWith('-') ||
          value.endsWith('_') ||
          value.contains('..') ||
          value.contains('.-') ||
          value.contains('-.')) {
        message = "Valid E-mail is required";
        return message;
      }

      bool emailValid =
          RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(value) &&
                  RegExp('@').allMatches(value).length == 1
              ? true
              : false;
      if (!emailValid) {
        message = "Valid E-mail is required";
      } else {
        return null;
      }
    }
    return message;
  }

  static String? validateEmptyPassword(String? value) {
    if (value!.isEmpty) {
      return "Password is required";
    }

    return null;
  }
}
