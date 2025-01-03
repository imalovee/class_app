import 'package:class_app/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UserInputScreen extends StatefulWidget {
  const UserInputScreen({super.key, required this.userDetailsArg});

 final UserDetails userDetailsArg;

  @override
  State<UserInputScreen> createState() => _UserInputScreenState();
}

class _UserInputScreenState extends State<UserInputScreen> {

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool isVisible = false;
   List? errorMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Inputs'),
      ),
      body:  SafeArea(child: Padding(padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               TextFieldItems(
                labelText: 'Full Name',
                obscureText: false,
                prefix: Icons.person,
                keyboardType: TextInputType.name,
                 inputFormatter:  [
                    FilteringTextInputFormatter.allow(RegExp(r'[a-z A-Z]'))
                 ],
                 controller: nameController ,
                 onchanged: (name){
                  setState(() {
                    name = widget.userDetailsArg.savedName;
                  });
                 },
              ),
               const SizedBox(height: 20,),
                TextFieldItems(
                labelText: 'Email Address',
                obscureText: false,
                prefix: Icons.email,
                 keyboardType: TextInputType.emailAddress,
                  inputFormatter: [
                    FilteringTextInputFormatter.deny(r'[]')
                  ],
                  controller: emailController,
                  validator: (a){
                  if(emailRegex.hasMatch(a ?? "")){
                    return null;
                  }else{
                    return 'Invalid email';
                  }
                  },
              ),
              const SizedBox(height: 20,),
              TextFieldItems(
                labelText: 'Password',
                obscureText: isVisible,
                prefix: Icons.lock,
                keyboardType: TextInputType.visiblePassword,
                controller: passwordController,
                validator: (a){
                  List errors = [];
                  final smallLetters = RegExp(r'[a-z]');
                  final capitalLetters = RegExp(r'[A-Z]');
                  final numbers = RegExp(r'[0-9]');
                  final specialChar = RegExp(r'[!#$%&*+-/=?]');
                  if(!smallLetters.hasMatch(a?? "" )){
                    errors.add('Password must contain a small letter');
                  }
                  if(!capitalLetters.hasMatch(a ?? "")){
                    errors.add('Password must contain a capital letter');
                  }
                  if(!numbers.hasMatch(a ?? "")){
                    errors.add('Password must contain numbers');
                  }
                  if(!specialChar.hasMatch(a ?? "")){
                    errors.add('Password must contain special characters');
                  }
                  if((a ?? "").length < 6){
                    errors.add('Password must be greater than 6 characters');
                  }
                   errorMessage = null;
                  if(errors.isEmpty){
                    setState(() {});
                    return null;
                  }else{
                    setState(() {});
                    errorMessage = errors;
                    return '';
                  }
                },
                suffixIcon: IconButton(onPressed: (){
                  isVisible = ! isVisible;
                  setState(() {
                  });
                },
                    icon: isVisible?  const Icon(Icons.visibility_off_sharp): const Icon(Icons.visibility)
                ),
              ),
              if(errorMessage != null)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List<Widget>.from(
                      (errorMessage ?? []).map((e) =>
                      Text(e, style: const TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.w600,
                          fontSize: 10
                      ),)
                  )
                  ),
                ),
              const SizedBox(height: 20,),
              Center(
                child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {}
                    },
                    child: const Text("Save")),
              ),

            ],
          ),
        ),
      ),)),
    );
  }
}



class UserDetails {
  final String savedName;
  final String savedEmail;


  UserDetails( {
    required this.savedName,
    required this.savedEmail,

});
}

class TextFieldItems extends StatelessWidget {
  const TextFieldItems({
    super.key, required this.labelText, 
     this.obscureText = false, 
     this.suffixIcon,
    required this.prefix,
    required this.keyboardType,
    this.validator,
    this.inputFormatter,
    required this.controller, this.onchanged,
  });

  final String labelText;
  final bool obscureText;
  final IconButton? suffixIcon;
  final IconData prefix;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatter;
  final TextEditingController controller;
  final void Function(String?)? onchanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
     keyboardType: keyboardType,
      textCapitalization: TextCapitalization.words,
      textInputAction: TextInputAction.done,
      obscureText: obscureText,
      onChanged: onchanged,
      inputFormatters: inputFormatter,
      decoration:  InputDecoration(
        label: Text(labelText),
        prefixIcon: Icon(prefix),
        suffixIcon: suffixIcon,
        //enabled: true ,
       errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: Colors.red,
          )
        ),
        focusedErrorBorder:OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide:  BorderSide(
              color: Colors.red.shade900,
            )
        ),
        focusedBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(
              color: Colors.green,
            )
        ),
        enabledBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(
              color: Colors.blue,
            )
        ),
      ),
      validator: validator ,
    );
  }
}
