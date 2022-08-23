import 'package:flutter/material.dart';
import 'package:task_etic/helper/colors.dart';
import 'package:task_etic/helper/responsive.dart';

class Styles {
  final appBarStyle =
      TextStyle(fontSize: getFontSize(15), fontWeight: FontWeight.w800);
  final selectedItemsTextStyle = TextStyle(
      fontSize: getFontSize(13),
      fontWeight: FontWeight.w600,
      color: darkGreyColor);
  final smallTextstyle = TextStyle(
      fontSize: getFontSize(10),
      fontWeight: FontWeight.w600,
      color: primaryColor);
  final materialButton = TextStyle(
      fontSize: getFontSize(17),
      fontWeight: FontWeight.w500,
      color: Colors.white);
  final contentStyle = TextStyle(
      fontSize: getFontSize(13),
      fontWeight: FontWeight.w500,
      color: Colors.black.withOpacity(0.7));
  final boldContentStyle = TextStyle(
      fontSize: getFontSize(14),
      fontWeight: FontWeight.w700,
      color: Colors.black);
  final smallContentStyle = TextStyle(
      fontSize: getFontSize(13),
      fontWeight: FontWeight.w400,
      color: Colors.grey[500]);
}
