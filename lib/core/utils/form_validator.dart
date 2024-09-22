class FormValidator {

  // These are the strings which will be return in the validators...
  // Since there is no localization setup, we can edit these and in future change according to the requirement.
  static const String emailRequired = 'Email is required!';
  static const String enterValidEmail = 'Please Enter valid email!';
  static const String passwordRequired = 'Password is required!';
  static const String passwordLength = 'Password must have 6 characters!';
  static const String nameRequired = 'Name is required!';
  static const String enterValidName = 'Please Enter valid name!';

  static String? nameValidator(String? value) {
    if(value == null || value.isEmpty) {
      return nameRequired;
    }

    final RegExp nameRegExp = RegExp(
      r"^[a-zA-Z]+(\.?[a-zA-Z]+)*(\s[a-zA-Z]+(\.?[a-zA-Z]+)*)?$",
    );

    if(!nameRegExp.hasMatch(value)) {
      return enterValidName;
    }

    return null;
  }

  static String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return emailRequired;
    }

    final RegExp emailRegExp = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );

    if (!emailRegExp.hasMatch(value)) {
      return enterValidEmail;
    }

    return null;
  }

  static String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return passwordRequired;
    }

    if (value.length < 6) {
      return passwordLength;
    }
    return null;
  }
}