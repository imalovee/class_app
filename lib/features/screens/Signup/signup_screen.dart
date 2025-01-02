import 'package:class_app/features/navigation/route.dart';
import 'package:class_app/features/navigation/route_strings.dart';
import 'package:class_app/features/screens/localStorage/shared_preference_screen.dart';
import 'package:class_app/features/screens/user_input_screen.dart';
import 'package:class_app/shared/custom_button.dart';
import 'package:class_app/shared/textform_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _fullnameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  List? errorMessage;
  String? userFullName;
  String? emailAddress;
  String? phoneNumber;
  final localStorage = LocalStorageFile();

  @override
  void initState(){
    super.initState();
  _fullnameController.text = localStorage.getUserName() ?? "";
 _emailController.text = localStorage.getEmail() ?? "";
  _phoneController.text = localStorage.getNumber() ?? "";
  }

  @override
  void dispose(){
    super.dispose();
  _emailController.dispose();
  _phoneController.dispose();
  _fullnameController.dispose();
  _passwordController.dispose();

  }

  String? passwordValidator(String? input){
    List _errors = [];
    final smallLet = RegExp(r'[a-z]');
    final capitalLet = RegExp(r'[A-Z]');
    final numbers = RegExp(r'[0-9]');
    final specialChars = RegExp(r'[!#$%&*+-/=?]');

    if(!smallLet.hasMatch(input ?? "")){
      _errors.add('password must contain small letters');
    }
    if(!capitalLet.hasMatch(input ?? "")){
      _errors.add('password must contain capital letters');
    }
    if(!numbers.hasMatch(input ?? "")){
      _errors.add('password must contain digits');
    }
    if(!specialChars.hasMatch(input ?? "")){
      _errors.add('password must contain one special Characters');
    }
    if((input?? "").length < 6){
      _errors.add('password must be longer than 6');
    }
    errorMessage = null;
    if(_errors.isEmpty){
      setState(() {
      });
      return null;
    }else{
      errorMessage = _errors;
      setState(() {
      });
      return '';
    }

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
                const SizedBox(height: 36,),
                Text('Create Account Now!',
                style:  jockeyTextStyle.copyWith(
                    color: AppColors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w500
                ),),
                const SizedBox(height: 46,),
                TextFormWidget(
                    controller: _fullnameController,
                    title: 'Full Name ',
                  inputFormatter: [
                    FilteringTextInputFormatter.deny('r[]')
                  ],
                  onchanged: (_){
                     setState(() {
                      userFullName = _fullnameController.text;
                     });
                  },
                ),
                const SizedBox(height: 26,),
                TextFormWidget(
                  validate: (input){
                    if(!emailRegex.hasMatch(input!)){
                      return 'Enter valid email address';
                    }
                  },
                    inputFormatter: [
                      FilteringTextInputFormatter.deny('r[]')
                    ],
                    controller: _emailController,
                    title: 'Email'),
                const SizedBox(height: 26,),
                TextFormWidget(
                  validate: (value){
                    return passwordValidator(value);
                  },
                    controller: _passwordController,
                    title: 'Password'),
                if(errorMessage != null)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List<Widget>.from((errorMessage ?? []).map((e){
                      return Text(e, style: const TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.w600,
                          fontSize: 10
                      ),);
                    }))
                  ),
                const SizedBox(height: 36,),
                TextFormWidget(
                  inputFormatter: [
                    FilteringTextInputFormatter.digitsOnly,
                    FilteringTextInputFormatter.deny('r[]'),
                  ],
                    controller: _phoneController,
                    title: 'Phone No'),
                const SizedBox(height: 36,),

                GestureDetector(
                  onTap: ()async{
                    if(_formKey.currentState?.validate() ?? false){}
                   await localStorage.saveName(_fullnameController.text);
                    Navigator.pushNamed(context,
                      AppRouteStrings.userData,
                      arguments: UserDetails(
                          savedName: userFullName ?? "",
                          savedEmail: emailAddress ?? "",
                          )
                    );
                  },
                  child: const CustomButton(
                      buttonText: 'Sign Up'),
                )
              ],
            )),
      ),),
    );
  }
}
