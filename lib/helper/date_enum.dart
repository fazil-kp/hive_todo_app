// ignore_for_file: constant_identifier_names

import 'package:intl/intl.dart';

enum TimeType {
  withAM,
  without,
}

enum DateType {
  dmy,
  ymd,
  Mdy,
  dMyhm,
  dMyhma,
  HHmm,
  hhmma,
  hhmms,
  HHmmss,
  ymdhMs,
}

enum InputFormat { mobile, decimal, number, email, dateDMY, digitsOnly, format }

extension DateTimeExt on DateTime? {
  String parseString(DateType type) {
    if (this == null) return '';

    switch (type) {
      case DateType.Mdy:
        return DateFormat('MM-dd-yyyy').format(this!);
      case DateType.dmy:
        return DateFormat('dd-MM-yyyy').format(this!);
      case DateType.ymd:
        return DateFormat('yyyy-MM-dd').format(this!);

      case DateType.dMyhma:
        return DateFormat('dd-MM-yyyy hh:mm a').format(this!);
      case DateType.dMyhm:
        return DateFormat('dd-MM-yyyy hh:mm').format(this!);
      case DateType.ymdhMs:
        return DateFormat('yyyy-MM-dd hh:mm:ss').format(this!);
      case DateType.HHmm:
        return DateFormat('HH:mm').format(this!);
      case DateType.hhmma:
        return DateFormat('hh:mm a').format(this!);
      case DateType.hhmms:
        return DateFormat('hh:mm:ss').format(this!);
      case DateType.HHmmss:
        return DateFormat('HH:mm:ss').format(this!);
    }
  }
}

extension DateListExtensions on List<DateTime?> {
  String parseList(DateType type) {
    return map((e) => e?.parseString(type)).join(' - ');
  }
}

extension EnumParsingExts on String {
  String toFileName([String extension = '']) {
    String lowCase = toLowerCase();
    String result = lowCase.replaceAll(RegExp(' '), '_');
    return result + extension;
  }

  DateTime? parseDate(DateType type) {
    String? value = this;

    if (value == "" || value == "0000-00-00") {
      return null;
    }
    try {
      switch (type) {
        case DateType.dMyhma:
          return DateFormat('dd-MM-yyyy hh:mm a').parse(value);
        case DateType.dMyhm:
          return DateFormat('dd-MM-yyyy hh:mm').parse(value);
        case DateType.ymdhMs:
          return DateFormat('yyyy-MM-dd hh:mm:ss').parse(value);
        case DateType.dmy:
          return DateFormat('dd-MM-yyyy').parse(value);

        case DateType.ymd:
          return DateFormat('yyyy-MM-dd').parse(value);
        case DateType.Mdy:
          return DateFormat('MM-dd-yyyy').parse(value);
        case DateType.HHmm:
          return DateFormat('HH:mm').parse(value);
        case DateType.hhmma:
          return DateFormat('hh:mm').parse(value);
        case DateType.hhmms:
          return DateFormat('hh:mm:ss').parse(value);
        case DateType.HHmmss:
          return DateFormat('HH:mm:ss').parse(value);
      }
    } on Exception {
      return null;
    }
  }
}