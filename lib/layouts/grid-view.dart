import 'package:flutter/material.dart';

class GridViewScreen extends StatefulWidget {
  const GridViewScreen({super.key});

  @override
  State<GridViewScreen> createState() => _GridViewScreenState();
}

class _GridViewScreenState extends State<GridViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Grid View', style: TextStyle(
          fontWeight: FontWeight.bold
        ),),
      ),
        body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.all(16),
              child: GridView.builder(
                itemCount: 30,
                  gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 10 ,
                      crossAxisSpacing: 10,
                      crossAxisCount: 4),
                itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.purpleAccent.shade200,
                        borderRadius: BorderRadius.circular(16)
                      ),
                      child: const FlutterLogo(),
                    );
                },

              ),
            )));
  }
}
