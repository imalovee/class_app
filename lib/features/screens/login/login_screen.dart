import 'package:class_app/shared/app_colors.dart';
import 'package:class_app/shared/assets.dart';
import 'package:class_app/shared/constants.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool showPassword = true;
  bool showCancel = false;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return  Scaffold(
      body: Stack(
        children: [
          Image.asset(AppAssets.bgImage,
          fit: BoxFit.cover,
          height: size.height,
          width: size.width,),
          SafeArea(
              child: Padding(padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text('Sign in to recharge dirrect', style: baseTextStyle.copyWith(
                      fontSize: 25,
                      fontWeight: FontWeight.w500
                    ),),
                    const SizedBox(height: 20,),
                    TextFieldWidgets(
                      controller: _emailController,
                      label: 'Enter Email',
                    onchanged: (input){
                        if(input.isEmpty){
                          showCancel = false;
                        }else{
                          showCancel = true;
                        }
                        setState(() {});
                    },
                    suffixIcon: GestureDetector(
                      onTap: (){
                        _emailController.clear();
                      },
                      child: showCancel? SvgPicture.asset(AppAssets.cancelIcon,
                      ) : null,
                    ),
                    validate: (text){
                        if(! emailRegex.hasMatch(text ?? "")){
                          return 'Enter valid email';
                        }
                    },),
                    SizedBox(height: 17,),
                    TextFieldWidgets(
                      controller: _passwordController,
                      label: '••••••••',
                      suffixIcon: GestureDetector(
                        onTap: (){
                          showPassword = !showPassword;
                          setState(() {

                          });
                        },
                          child: SvgPicture.asset(AppAssets.vissibilityOff,)),
                      obscureText: showPassword,
                      validate: (text){
                        if(! emailRegex.hasMatch(text ?? "")){
                          return 'Enter valid email';
                        }
                      },),
                    const SizedBox(height: 12,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('Recover Password?', style: baseTextStyle.copyWith(
                          color: AppColors.lightGrey,
                          fontWeight: FontWeight.w300
                        ),),
                      ],
                    ),
                    const SizedBox(height: 25,),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                          color: AppColors.appBlue,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                      BoxShadow(
                      color: AppColors.appBlue.withOpacity(0.2),
                      spreadRadius: 5,
                      blurRadius: 8,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                      ),
                      child: Text('Sign In',
                        textAlign: TextAlign.center,
                        style: baseTextStyle.copyWith(
                            color: AppColors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 17
                        ),),

                    ),
                    const SizedBox(height: 29,),
                    Row(
                      children: [
                        const Expanded(child: Divider()),
                        const SizedBox(width: 6,),
                        Text('or continue with ',
                        style: baseTextStyle.copyWith(
                          color: AppColors.lightGrey,
                          fontWeight: FontWeight.w200
                        ),),
                        const SizedBox(width: 5,),
                        const Expanded(child: Divider()),
                      ],
                    ),
                    const SizedBox(height: 29,),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(12)
                            ),
                            child: SvgPicture.asset(AppAssets.google),
                          ),
                        ),
                        SizedBox(width: 12,),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(12)
                            ),
                            child: SvgPicture.asset(AppAssets.appleIcon),
                          ),
                        ),
                        SizedBox(width: 12,),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(12)
                            ),
                            child: SvgPicture.asset(AppAssets.facebook),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 35,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: RichText(
                        textAlign: TextAlign.center,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                recognizer: TapGestureRecognizer()..onTap = (){},
                                  text: 'If you don’t have an account you can',
                                  style: baseTextStyle.copyWith(
                                      fontWeight: FontWeight.w100,
                                      fontSize: 18
                                  )
                              ),
                              TextSpan(
                                  text: ' Register here!',
                                  style: baseTextStyle.copyWith(
                                      fontWeight: FontWeight.w100,
                                      fontSize: 20,
                                    color: AppColors.appBlue
                                  )
                              ),
                            ]
                          ),

                      ),
                    )
                  ],
                ),
              ),))
        ],
      ),
    );
  }
}

class TextFieldWidgets extends StatelessWidget {
  const TextFieldWidgets({
    super.key, required this.label,
    required this.controller,
     this.obscureText = false,
    this.suffixIcon,
    this.validate,
    this.onchanged,
  });

  final String label;
  final Widget? suffixIcon;
  final TextEditingController controller;
  final bool obscureText;
  final String? Function(String?)? validate;
  final void Function(String)? onchanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: AppColors.appBlue,
      validator: validate,
      onChanged: onchanged,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        label: Text(label, style: baseTextStyle.copyWith(
          color: AppColors.grey
        ),),
        suffixIcon: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(child: suffixIcon,
            height: 24,
            width: 24,),
          ],
        ),
        //contentPadding: const EdgeInsets.symmetric(horizontal: 9),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.appBlue
          ),
          borderRadius: BorderRadius.circular(10)
        ),
        enabledBorder: OutlineInputBorder(
            borderSide:  BorderSide.none,
            borderRadius: BorderRadius.circular(10)
        ),
      ),
    );
  }
}
