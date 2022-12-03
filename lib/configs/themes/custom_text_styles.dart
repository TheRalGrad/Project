import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:project/configs/themes/app_colors.dart';
import 'package:project/configs/themes/ui_parameters.dart';

TextStyle cartTitles(context) => TextStyle(
    color: UIParameters.isDarkMode()
        ? Theme.of(context).textTheme.bodyText1!.color
        : Theme.of(context).primaryColor,
    fontSize: 18,
    fontWeight: FontWeight.bold);

const headerText = TextStyle(
    fontSize: 22, fontWeight: FontWeight.w700, color: onSurfaceTextColor);
const detailText = TextStyle(fontSize: 12);
