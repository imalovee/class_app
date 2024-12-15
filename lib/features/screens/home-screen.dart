import 'package:class_app/features/navigation/route_strings.dart';
import 'package:class_app/features/screens/manual_input-screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,

        title: const Text("Home Screen"),
        actions: const [
          Icon(
            Icons.call,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Icon(
              Icons.video_call,
            ),
          ),
        ],
      ),
      body: SafeArea(child: Padding(padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextButton(
              onPressed: (){
                Navigator.pushNamed(
                    context,
                    AppRouteStrings.gridView,
                );
              },
              child: const Text('Grid View Screen')),
          TextButton(
              onPressed: (){
                Navigator.pushNamed(
                  context,
                  AppRouteStrings.listView,

                );
              },
              child: const Text('ListView Screen')),
          TextButton(
              onPressed: (){
                Navigator.pushNamed(
                  context,
                  AppRouteStrings.manualView,
                  arguments: ManualInputArg(pageContent: 'This is the content of our amazing page',
                      pageTitle: 'Custom page')
                );
              },
              child: const Text('Manual View')),
          TextButton(
              onPressed: (){
                Navigator.pushNamed(
                    context,
                    AppRouteStrings.userData,

                );
              },
              child: const Text('User Inputs')),
          TextButton(
              onPressed: (){
                Navigator.pushNamed(
                  context,
                  AppRouteStrings.loginScreen,

                );
              },
              child: const Text('Login Screen')),

          TextButton(
              onPressed: (){
                Navigator.pushNamed(
                  context,
                  AppRouteStrings.welcomeScreen,

                );
              },
              child: const Text('Welcome Screen')),
          TextButton(
              onPressed: (){
                Navigator.pushNamed(
                  context,
                  AppRouteStrings.carouselScreen,

                );
              },
              child: const Text('Carousel Screen')),
          TextButton(
              onPressed: (){
                Navigator.pushNamed(
                  context,
                  AppRouteStrings.tabBarScreen,

                );
              },
              child: const Text('TabBar Screen')),
          TextButton(
              onPressed: (){
                Navigator.pushNamed(
                  context,
                  AppRouteStrings.calculateScreen,

                );
              },
              child: const Text('Calculate Screen')),
        ],
      ),)),
    );
  }
}
