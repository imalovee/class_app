import 'package:flutter/material.dart';
import 'package:word_generator/word_generator.dart';
class StreamBuilderScreen extends StatefulWidget {
  const StreamBuilderScreen({super.key});

  @override
  State<StreamBuilderScreen> createState() => _StreamBuilderScreenState();
}

class _StreamBuilderScreenState extends State<StreamBuilderScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Stream Builder'),
      ) ,
      body: StreamBuilder(
          stream: getStreams() ,
          builder: (context, snapshot){
            if(snapshot.connectionState == ConnectionState.waiting){
              return const Center(child: CircularProgressIndicator(),);
            }
            if(snapshot.hasError){
              return const Text('Ran into an error');
            }
            if(snapshot.data?.isEmpty ?? false){
              return const Text('Ran into an error');
            }
            return SizedBox();
          }
      ),
    );
  }

  Stream<String> getStreams()async*{
    while(true){
      Future.delayed(Duration(seconds: 4));
      yield WordGenerator().randomSentence(100);
    }
  }
}
