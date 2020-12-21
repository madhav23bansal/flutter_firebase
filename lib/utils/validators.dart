/// Check whether given string can be parsed in int or not.
bool isNumeric(String s) {
  if (s == null) {
    return false;
  }
  return double.parse(s, (e) => null) != null;
}

/// Validations container all the validations used in project.
class Validations {
  /// Validate fullname and only accepts alphabetical characters.
  static String validateFullName(String value) {
    if (value.isEmpty) return 'Name is required.';
    final RegExp nameExp = new RegExp(r'^[A-za-z ]+$');
    if (!nameExp.hasMatch(value))
      return 'Please enter only alphabetical characters.';
    return null;
  }

  //Validate email id
  static String isEmail(String value) {
    if (value.isEmpty) return 'Email cannot be Empty';
    final RegExp emailExp = new RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    if (!emailExp.hasMatch(value)) return 'Please check entered email';
    return null;
  }

  /// Validate otp and only accepts 6 digits.
  static String validateOTP(String value) {
    if (value.isEmpty) return 'OTP is required.';
    if (value.length != 6) return 'OTP has to be 6 degits';
    return null;
  }

  /// Validate that field is not empty.
  static String validateNotEmpty(String value) {
    if (value.trim().isEmpty) return "This value cannot be empty.";
    return null;
  }

  /// Validate given string is phone no.
  static String validateNumber(String value) {
    if (value.trim().isEmpty) return "Enter Number";
    if (value.length != 10) return 'Phone Number is invalid.';
    int number = int.parse(value);
    if (number <= 0) {
      return "Phone Number is invalid";
    }
    return null;
  }

  /// Validate Date field which has to be between 1 & 31.
  static String validateDateField(String value) {
    if (value.trim().isEmpty) return "Wrong format";
    if (value.trim().length != 2) return "Wrong format";
    if (!isNumeric(value.trim())) return "Wrong Date";
    if (int.parse(value.trim()) < 0 || int.parse(value) > 31)
      return "Wrong Date";
    return null;
  }

  /// Validate Month field which has to be between 1 & 12.
  static String validateMonthField(String value) {
    if (value.trim().isEmpty) return "Wrong format";
    if (value.trim().length != 2) return "Wrong format";
    if (!isNumeric(value.trim())) return "Wrong Month";
    if (int.parse(value.trim()) < 0 || int.parse(value) > 12)
      return "Wrong Month";
    return null;
  }

  /// Validate Year
  static String validateDobYear(String value) {
    if (value.trim().isEmpty) return "Wrong format";
    if (value.length != 4) return "Wrong format";
    if (!isNumeric(value)) return "Wrong Year";
    int currentYear = int.parse(DateTime.now().toString().substring(0, 4));
    int selectedYear = int.parse(value);
    if (selectedYear > currentYear || selectedYear < 1930)
      return "Invalid Year";
    return null;
  }

  /// Validate Year of driving licesnse Issue field which has to be between 1940 & 2020.
  static String validateDrivingIssueYearField(String value) {
    if (value.trim().isEmpty) return "Wrong format";
    if (value.length != 4) return "Wrong format";
    if (!isNumeric(value)) return "Wrong Year";
    if (int.parse(value) < 1940 || int.parse(value) > 2020) return "Wrong Year";
    return null;
  }

  /// Validate Year of driving licesnse expiry field which has to be between 2020 & 2080.
  static String validateDrivingValidationYearField(String value) {
    if (value.trim().isEmpty) return "Wrong format";
    if (value.length != 4) return "Wrong format";
    if (!isNumeric(value)) return "Wrong Year";
    if (int.parse(value) < 2020 || int.parse(value) > 2080) return "Wrong Year";
    return null;
  }

  /// Validate PAN no using Regex.
  static String validatePanNumber(String value) {
    if (value.isEmpty) return 'PAN number is required.';
    final RegExp nameExp =
        new RegExp(r'^([a-zA-Z]){5}([0-9]){4}([a-zA-Z]){1}?$');
    if (!nameExp.hasMatch(value)) return 'PAN Number is invalid.';
    return null;
  }

  /// Validate IFSCode using Regex.
  static String validateIFSCCode(String value) {
    if (value.isEmpty) return 'IFSC Code is required.';
    final RegExp nameExp = new RegExp(r'^[A-Za-z]{4}\d{7}$');
    if (!nameExp.hasMatch(value)) return 'IFSC Code is invalid.';
    return null;
  }

  /// Validate Account no which has to be between 9 & 18.
  static String validateAccountNumber(String value) {
    if (value.isEmpty) return 'Account Number is required.';
    final RegExp nameExp = new RegExp(r'^[0-9]{9,18}');
    if (!nameExp.hasMatch(value)) return 'Account Number is invalid.';
    return null;
  }

  /// Validate that confirm account number mathched before entered number.
  static String validateAccountNumberConfirm(
      {String accNo, String confirmAccNo}) {
    if (accNo != confirmAccNo) return 'Account number does not match.';
    return null;
  }

  /// Validate PINcode of a place and has to be 6 digits starting from non-zero numner.
  static String validatePinCode(String value) {
    if (value.isEmpty) return 'Pin Code is required.';
    final RegExp nameExp = new RegExp(r'^[[1-9][0-9]{5}$');
    if (!nameExp.hasMatch(value)) return 'Pin Code is invalid.';
    return null;
  }

  /// Validate
  static String validateLicenseNumber(String value) {
    if (value.isEmpty) return 'License Number is required.';
    final RegExp nameExp = new RegExp(
        r'^(([A-Z]{2}[0-9]{2})( )|([A-Z]{2}-[0-9]{2}))((19|20)[0-9][0-9])[0-9]{7}$');
    if (!nameExp.hasMatch(value)) return 'License Number is invalid.';
    return null;
  }

  /// Validate Credit Card / Debit Card number using Regex
  static String validateCardNumber(
    String value,
  ) {
    if (value.startsWith(new RegExp(
            r'((5[1-5])|(222[1-9]|22[3-9][0-9]|2[3-6][0-9]{2}|27[01][0-9]|2720))')) ||
        value.startsWith(new RegExp(r'[4]')) ||
        value.startsWith(new RegExp(r'((506(0|1))|(507(8|9))|(6500))'))) {
      if (value.length != 19) return 'Invalid Card Number';
    } else if (value.trim().isEmpty) {
      return "Enter Card Number";
    } else if (value.length != 19)
      return 'Invalid card number';
    else
      return 'Invalid card number';
    return null;
  }

  /// Validate Debit Card / Credit card expiry
  static String validateExpiry(String value) {
    if (value.trim().isEmpty) return "Enter Expiry";
    if (value.length != 5) return 'Expiry Invalid';
    int month = int.parse(value.substring(0, 2));
    int year = int.parse(value.substring(3, 5));
    int currentYear = int.parse(DateTime.now().toString().substring(2, 4));
    if (year < currentYear) return 'Invalid Expiry';
    if (month <= 0 || month > 12) return "Invalid Expiry";
    return null;
  }

  /// Validate CVV of Debit Card / Credit card
  static String validateCvv(String value) {
    if (value.trim().isEmpty) return "Enter CVV";
    if (value.length != 3) return "CVV Invalid";
    return null;
  }

  /// Validate Withdraw amount. Withdraw amount cannot be more than total amount.
  static String validateWithdrawAmount({String value, String amount}) {
    if (value.trim().isEmpty) return "Enter amount";
    if (!isNumeric(value.trim())) return "Wrong amount";
    if (int.parse(value.trim()) >= int.parse(amount.trim()) ||
        int.parse(value.trim()) < 0) {
      return "Wrong amount";
    }
    return null;
  }
}
