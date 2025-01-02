import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_colors.dart';
import 'constants.dart';

class TextFormWidget extends StatelessWidget {
  const TextFormWidget({
    super.key,
    required this.controller,
    this.obscureText = false,
    this.validate,
    required this.title,
    this.inputFormatter, this.onchanged,
  });

  final String title;
  final TextEditingController controller;
  final bool obscureText;
  final String? Function(String?)? validate;
  final List<TextInputFormatter>? inputFormatter;
  final void Function(String?)? onchanged;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: interTextStyle.copyWith(
                fontSize: 18
            )),
        const SizedBox(height: 8,),
        TextFormField(
          onChanged: onchanged ,
          controller: controller,
          cursorColor: AppColors.appBlue,
          validator: validate,
          inputFormatters: inputFormatter,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            filled: true,
            fillColor: AppColors.lightNude,
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    color: AppColors.appBlue
                ),
                borderRadius: BorderRadius.circular(26)
            ),
            enabledBorder: OutlineInputBorder(
                borderSide:  BorderSide.none,
                borderRadius: BorderRadius.circular(26)
            ),
            errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    color: Colors.redAccent
                ),
                borderRadius: BorderRadius.circular(26)
            ),
            focusedErrorBorder: OutlineInputBorder(
                borderSide:  BorderSide(
                    color: Colors.red.shade900
                ),
                borderRadius: BorderRadius.circular(26)
            ),
          ),
        )
      ],
    );
  }
}
