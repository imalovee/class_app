import 'package:flutter/material.dart';

class ManualInputScreen extends StatelessWidget {
  const ManualInputScreen ({super.key, required this.arguments});

  final ManualInputArg arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(arguments.pageTitle),
      ),
      body:  Center(
        child: Text(arguments.pageContent, style: const TextStyle(
          color: Colors.red,
          fontWeight: FontWeight.bold,
          fontSize: 22
        ),),
      ),
    );
  }
}


class ManualInputArg{
  final String pageTitle;
  final String pageContent;

  ManualInputArg({
    required this.pageContent,
    required this.pageTitle
});
}