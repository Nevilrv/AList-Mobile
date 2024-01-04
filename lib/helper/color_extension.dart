import 'package:flutter/animation.dart';
import 'package:foap/util/constant_util.dart';

extension HexColor on Color {
  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
  static Color fromHex(String hexString, String type) {
    if (hexString.isEmpty) {
      if (isDarkMode) {
        if (type == 'backgroundColor') {
          hexString = "202020";
        } else if (type == 'cardColor') {
          hexString = "202020";
        } else if (type == 'mainTextColor') {
          hexString = "FFFFFF";
        } else if (type == 'subHeadingTextColor') {
          hexString = "34495e";
        } else {
          hexString = "B74093";
        }
      } else {
        if (type == 'backgroundColor') {
          hexString = "FFFFFF";
        } else if (type == 'cardColor') {
          hexString = "FFFFFF";
        } else if (type == 'mainTextColor') {
          hexString = "000000";
        } else if (type == 'subHeadingTextColor') {
          hexString = "ecf0f1";
        } else {
          hexString = "B74093";
        }
      }
    }

    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));

    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
