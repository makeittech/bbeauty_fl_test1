import 'package:flutter/material.dart';

extension StringExtension on String {

  hexToColor({String alphaChannel = 'FF'}) {
    return Color(int.parse(this.replaceFirst('#', '0x$alphaChannel')));
  }
}