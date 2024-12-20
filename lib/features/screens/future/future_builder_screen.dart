import 'package:class_app/shared/app_colors.dart';
import 'package:class_app/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:word_generator/word_generator.dart';
class FutureBuilderScreen extends StatefulWidget {
  const FutureBuilderScreen({super.key});

  @override
  State<FutureBuilderScreen> createState() => _FutureBuilderScreenState();
}

class _FutureBuilderScreenState extends State<FutureBuilderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Future Builder'),
      ),
      body:  FutureBuilder(
          future: getRandomWords(),
          builder: (context, snapshot){
            if(snapshot.connectionState == ConnectionState.waiting){
              return const Center(child: CircularProgressIndicator(),);
            }
            else if(snapshot.hasError){
               WidgetsBinding.instance.addPostFrameCallback((a){
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content: Text(snapshot.error.toString(),

                    )));
              });
            }
            else if(!snapshot.hasData){
              return const Text('No Words generated');
            }

            return Padding(padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: Center(
              child: Text(snapshot.data ?? "", style:poppinsTextStyle.copyWith(
                fontSize: 15,
                color: AppColors.oceanBlue
              ) ,),
            ),);
          }),
    );
  }
  Future<String> getRandomWords()async{
    await Future.delayed(const Duration(seconds: 5)
    );
    return WordGenerator().randomSentence(150)  ;

  }
}


