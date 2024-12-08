import 'package:flutter/material.dart';

class ListViewScreen extends StatefulWidget {
  const ListViewScreen({super.key});

  @override
  State<ListViewScreen> createState() => _ListViewScreenState();
}

class _ListViewScreenState extends State<ListViewScreen> {

  List states = [
    'Abia',
    'Adamawa',
    'Akwa Ibom',
    'Anambra',
    'Bauchi',
    'Bayelsa',
    'Benue',
    'Borno',
    'Cross River', 'Delta', 'Ebonyi', 'Imo', 'Abuja', 'Katsina',
    'Kaduna', 'Kano', 'Adamawa', 'Ekiti', 'Oyo', 'Osun', 'Ogun', 'Ondo',
    'Taraba', 'Kebbi', 'Lagos', 'Rivers',

  ];

  List capitals = [
    'Umauhia',
    'Yola',
    'Uyo',
    'Awka',
    'Bauchi',
    'Yenegoa',
    'Markudi',
    'Maidugri',
    'Calabar',
    'Asaba', 'Abakaliki', 'Owerri', 'FCT', 'Katsina',
    'Kaduna', 'Kano', 'Adamawa', 'Ado-Ekiti', 'Ibadan', 'Osogbo', 'Akure', 'Ondo',
    'Jalingo', 'Benin-Kebbi', 'Ikeja', 'PortHarcourt',

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('States & Capital', style: TextStyle(
            fontWeight: FontWeight.bold,
        ),),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.all(16),
          child: ListView.separated(
    itemBuilder: (context, index){
    var state = states[index];
    var capital = capitals[index];
           return ListTile(
      leading: Text(index.toString(), style: TextStyle(
        color: Colors.red
      ),),
         title: Text(state, style: const TextStyle(
     fontSize: 16,
      fontWeight: FontWeight.bold),),
       trailing: Text(capital, style: const TextStyle(
           fontSize: 16,
           fontWeight: FontWeight.bold),),

      );
    },
    separatorBuilder: (context, index){
      return const Divider(
        color: Colors.blue,
        thickness: 1,
      );
    },
    itemCount: states.length)),
    ));
  }
}

