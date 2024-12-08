import 'package:class_app/shared/custom_button.dart';
import 'package:class_app/shared/textform_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../shared/app_colors.dart';
import '../../../shared/assets.dart';
import '../../../shared/constants.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _fullnameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose(){
    super.dispose();
  _emailController.dispose();
  _phoneController.dispose();
  _fullnameController.dispose();
  _passwordController.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      ),
      body:  Padding(padding: const EdgeInsets.fromLTRB(26, 26, 26, 35),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 36,),
                Text('Create Account Now!',
                style:  jockeyTextStyle.copyWith(
                    color: AppColors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w500
                ),),
                SizedBox(height: 46,),
                TextFormWidget(
                    controller: _fullnameController,
                    title: 'Full Name'),
                SizedBox(height: 26,),
                TextFormWidget(
                    controller: _emailController,
                    title: 'Email'),
                SizedBox(height: 26,),
                TextFormWidget(
                    controller: _passwordController,
                    title: 'Password'),
                SizedBox(height: 26,),
                TextFormWidget(
                    controller: _phoneController,
                    title: 'Phone No'),
                const SizedBox(height: 36,),
                CustomButton(
                    buttonText: 'Sign Up')
              ],
            )),
      ),),
    );
  }
}
