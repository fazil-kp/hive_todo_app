import 'package:flutter/material.dart';
import 'package:mine/extension/string_extension.dart';

class Validator<T extends Object> {
  final String? Function(T? value) validator;

  const Validator({required this.validator});

  factory Validator.notNull({String errorText = "Can't be Empty"}) {
    return Validator(validator: (T? value) {
      if (value == null || value == "") {
        return errorText;
      }
      return null;
    });
  }

  factory Validator.notZero({String errorText = "Can't be Zero"}) {
    return Validator(validator: (T? value) {
      if (value == null || value == "" || value.toString().toDouble() == 0) {
        return errorText;
      }
      return null;
    });
  }

  factory Validator.email({String errorText = "Invalid Email"}) {
    return Validator(validator: (T? value) {
      if (value == null || value == "") {
        return null;
      } else if (RegExpValue.email.hasMatch(value.toString())) {
        return null;
      } else {
        return errorText;
      }
    });
  }

  factory Validator.url({String errorText = "Invalid URL"}) {
    return Validator(validator: (T? value) {
      RegExp regExp = RegExpValue.webUrl;
      if (value == null || value == "") {
        return null;
      } else if (regExp.hasMatch(value.toString())) {
        return null;
      } else {
        return errorText;
      }
    });
  }

  factory Validator.mobile({String errorText = "Invalid Mobile No"}) {
    return Validator(validator: (T? value) {
      RegExp regExp = RegExpValue.mobile;
      if (value == null || value == "") {
        return null;
      } else if (regExp.hasMatch(value.toString())) {
        return null;
      } else {
        return errorText;
      }
    });
  }

  factory Validator.ipPort({String errorText = "Invalid IP Port"}) {
    return Validator(validator: (T? value) {
      if (value == null || value == "") {
        return null;
      }
      if (value.toString().split(":").length > 1 && value.toString().substring(0, value.toString().lastIndexOf(':')).split(".").length == 4) {
        return null;
      }
      return errorText;
    });
  }

  factory Validator.dateDMY({String errorText = "Invalid Date Format"}) {
    return Validator(validator: (T? value) {
      if (value == null || value == "") {
        return null;
      } else if (RegExpValue.dateDMY.hasMatch(value.toString())) {
        return null;
      } else {
        return errorText;
      }
    });
  }
}

extension ValidatorExt<T extends Object> on List<Validator<T>>? {
  String? validate(T? value) {
    if (this != null && this!.isNotEmpty) {
      for (var element in this!) {
        if (element.validator(value) != null) {
          return element.validator(value);
        }
      }
    }
    return null;
  }
}

extension FormKeyExt on GlobalKey<FormState> {
  bool validate() {
    return currentState != null && currentState!.validate();
  }

  void save() {
    currentState?.save();
  }
}

class RegExpValue {
  static RegExp mobile = RegExp(r"^(\+\d{1,3}[- ]?)?\d{10}$");
  static RegExp dateDMY = RegExp(r'[0-9]{2}[-]{1}[0-9]{2}[-][0-9]{4}');
  static RegExp webUrl = RegExp(r"(https?|http)://([-A-Z0-9.]+)(/[-A-Z0-9+&@#/%=~_|!:,.;]*)?(\?[A-Z0-9+&@#/%=~_|!:‌​,.;]*)?", caseSensitive: false);
  static RegExp email = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
}

// validators
class Validators {
  // Validates that the field is not null and not empty
  static String? notEmpty(String? value) {
    if (value == null || value.isEmpty || value == '') {
      return "Can't be empty";
    }
    return null;
  }

  // Validates that the field is not zero (for numeric fields)
  static String? notZero(String? value) {
    if (value == null || value.isEmpty || value == '') {
      return "Can't be zero";
    }
    // Check if the value is numeric and equal to zero
    final numberValue = double.tryParse(value);
    if (numberValue != null && numberValue == 0) {
      return "Can't be zero";
    }
    return null;
  }

  // Validates mobile phone numbers
  static String? mobile(String? value) {
    if (value == null || value.isEmpty) {
      return "Can't be empty";
    }

    RegExp regExp = RegExpValue.mobile;
    if (!regExp.hasMatch(value)) {
      return "Invalid mobile number";
    }
    return null;
  }
}