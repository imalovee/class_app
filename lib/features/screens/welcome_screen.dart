import 'package:class_app/features/navigation/route_strings.dart';
import 'package:class_app/shared/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../shared/app_colors.dart';
import '../../shared/assets.dart';
import '../../shared/constants.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.oceanBlue,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.oceanBlue,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('CodeChamp.in',
              style: jockeyTextStyle.copyWith(
                  color: AppColors.white,
                  fontSize: 27
              )),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SvgPicture.asset(AppAssets.menuIcon),
          )
        ],
      ) ,
      body:  Padding(padding: EdgeInsets.fromLTRB(26, 26, 26, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(AppAssets.reshotImage),
          const SizedBox(height: 36,),
          Text('Hello , Welcome !',
            style: jockeyTextStyle.copyWith(
                color: AppColors.white,
                fontSize: 36,
                fontWeight: FontWeight.w500
            ),),
          const SizedBox(height: 16,),
          Text('Welcome to codeChamp.in the top platform to coders',
              textAlign: TextAlign.center,
              style: interTextStyle.copyWith(
                fontWeight: FontWeight.w100,
                fontSize: 13
              )
          ),
          const SizedBox(height: 30,),
          GestureDetector(
            onTap: (){
              Navigator.pushNamed(context,
                  AppRouteStrings.loginScreen2);
            },
            child: const CustomButton(
                buttonText: 'Login'),
          ),
          const SizedBox(height: 20,),
          GestureDetector(
            onTap: (){
              Navigator.pushNamed(context,
                  AppRouteStrings.signupScreen);
            },
            child: const CustomButton(
                buttonText: 'Sign Up'),
          ),
        const SizedBox(height: 30,),
        Text('Or via social media',
          style: interTextStyle.copyWith(
              fontWeight: FontWeight.w100,
              fontSize: 12
          )),
          const SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(AppAssets.fbSvg),
              const SizedBox(width: 16,),
              SvgPicture.asset(AppAssets.ggSvg),
              const SizedBox(width: 16,),
              SvgPicture.asset(AppAssets.lnSvg),
            ],
          )
        ],
      ),),
    );
  }
}
