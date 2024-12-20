import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key, required this.buttonText,
  });
  final String buttonText;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.nude,
        borderRadius: BorderRadius.circular(26),
      ),
      child: Text(buttonText,
        textAlign: TextAlign.center,
        style: interTextStyle.copyWith(
            color: AppColors.black,
            fontWeight: FontWeight.w600,
            fontSize: 17
        ),),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({ required this.icon, required this.onPressed});
  final Widget icon;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12)
      ),
      fillColor: AppColors.deepBlue,
      constraints: const BoxConstraints.tightFor(
        width: 40.0,
        height: 40.0,
      ),
      child: icon,
    );
  }
}