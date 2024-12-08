import 'package:flutter/material.dart';

import 'app_colors.dart';

final emailRegex = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

TextStyle baseTextStyle = const TextStyle(
  fontFamily: 'Gilroy',
  fontSize: 16,
  fontWeight: FontWeight.w400,
  color: AppColors.black
);

TextStyle jockeyTextStyle = const TextStyle(
    fontFamily: 'Jockey One',
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.black
);

TextStyle interTextStyle = const TextStyle(
    fontFamily: 'Inter',
    fontSize: 16,
    //fontWeight: FontWeight.w400,
    color: AppColors.white
);