import 'package:class_app/features/navigation/route.dart';
import 'package:class_app/features/navigation/route_strings.dart';
import 'package:class_app/shared/app_colors.dart';
import 'package:class_app/shared/assets.dart';
import 'package:class_app/shared/constants.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../shared/custom_button.dart';
import '../../../shared/textform_widget.dart';

class LoginScreen2 extends StatefulWidget {
  const LoginScreen2({super.key});

  @override
  State<LoginScreen2> createState() => _LoginScreen2State();
}

class _LoginScreen2State extends State<LoginScreen2> {
  TextEditingController _userNameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool isChecked = false;
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose(){
    super.dispose();
    _userNameController.dispose();
    _passwordController.dispose();

  }
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
      body: Padding(padding: EdgeInsets.fromLTRB(26, 26, 26, 8),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 36,),
              Text('Welcome Back!',
              style: jockeyTextStyle.copyWith(
                color: AppColors.white,
                fontSize: 36,
                fontWeight: FontWeight.w500
              ),),
              const SizedBox(height: 10,),
               Text('Login to continue',
                style: interTextStyle
                ),
              const SizedBox(height: 36,),
               TextFormWidget(
                 title: 'User name',
                 controller:_userNameController ,
               ),
              const SizedBox(height: 46,),
              TextFormWidget(
                title: 'Password',
                controller:_passwordController,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        fillColor: const WidgetStatePropertyAll(AppColors.white),
                          checkColor: AppColors.nude,
                          value: isChecked,
                          onChanged: (value){
                            setState(() {
                              isChecked = value!;
                            });
                          }),
                      const Text('Remember me',
                      style: TextStyle(
                          color: AppColors.white
                      ),)
                    ],
                  ),
                  const Text('Forgot password?',
                  style: TextStyle(
                    color: AppColors.white
                  ),)
                ],
              ),
              const SizedBox(height: 36,),
              const CustomButton(
                buttonText: 'Login',
              ),
              const SizedBox(height: 20,),
              Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      children: [
                        TextSpan(
                            recognizer: TapGestureRecognizer()..onTap = (){
                              Navigator.pushNamed(context,
                                  AppRouteStrings.signupScreen);
                            },
                            text: 'Don’t have an account?',
                            style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                //fontSize: 18
                            )
                        ),
                         const TextSpan(
                            text: ' Sign up!',
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: AppColors.nude
                            )
                        ),
                      ]
                  ),

                ),
              )
            ],
          ),
        ),
      ),),
    );
  }
}


