class Validator {
  static bool isValidEmail(String email) {
    return RegExp(
            r"^[a-z!'*+/=?^_`{|}~-]+(?:\.[a-z0-9!'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
        .hasMatch(email);
  }

  static bool isValidPassword(String password) {
    return RegExp(r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*?&-])[A-Za-z\d@$!%*?&-]{8,}$')
        .hasMatch(password);
  }
}
