import 'package:class_app/features/navigation/route.dart';
import 'package:class_app/features/navigation/route_strings.dart';
import 'package:class_app/layouts/grid-view.dart';
import 'package:class_app/layouts/list_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      onGenerateRoute: AppRoutes.appRoute,
      initialRoute: AppRouteStrings.base,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.brown.shade100,
      appBar: AppBar(

        backgroundColor: Colors.brown,

        title: Text(widget.title, style: TextStyle(
          color: Colors.white
        ),),
        centerTitle: true,
        actions: const [
          Icon(Icons.search, color: Colors.white,),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.menu, color: Colors.white,),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/images/Aimah_Jpg.jpg'),
            SizedBox(height: 12,),
            const Row(

              children: [
                Text('Name:', style: TextStyle(
                  color: Colors.black,
                  fontSize: 20
                ),),
                SizedBox(width: 6,),
                Text(
                  'Ima-obong Enyie' , style: TextStyle(
                    color: Colors.black,
                    fontSize: 21,
                  fontWeight: FontWeight.bold
                ),
                ),
              ],
            ),
            const SizedBox(height: 8,),
            const Row(
              children: [
                Text('Nationality:', style: TextStyle(
                    color: Colors.black,
                    fontSize: 20
                ),),
                SizedBox(width: 6,),
                Text(
                  'Nigerian' , style: TextStyle(
                    color: Colors.black,
                    fontSize: 21,
                    fontWeight: FontWeight.bold
                ),
                ),
              ],
            ),
            const SizedBox(height: 8,),
            const Row(
              children: [
                Text('Occupation:', style: TextStyle(
                    color: Colors.black,
                    fontSize: 20
                ),),
                SizedBox(width: 6,),
                Text(
                  'Mobile App Developer' , style: TextStyle(
                    color: Colors.black,
                    fontSize: 21,
                    fontWeight: FontWeight.bold
                ),
                ),
              ],
            ),
          ],
        ),
      ),
      
    );
  }
}
