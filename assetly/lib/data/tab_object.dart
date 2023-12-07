import 'package:flutter/material.dart';

class TabObject {
  final String title;
  final Icon? logo;
  final Image? logoWidget;
  bool isActive;

  TabObject(
    this.title, {
    this.isActive = false,
    this.logoWidget,
    this.logo,
  });
}
