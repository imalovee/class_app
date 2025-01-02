import 'package:class_app/shared/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:word_generator/word_generator.dart';

import '../../../shared/constants.dart';

class SharedPreferenceScreen extends StatefulWidget {
  const SharedPreferenceScreen({super.key});

  @override
  State<SharedPreferenceScreen> createState() => _SharedPreferenceScreenState();
}

class _SharedPreferenceScreenState extends State<SharedPreferenceScreen> {
  final lsf = LocalStorageFile();
  List<String>? notifications;

  @override
  void initState(){
    super.initState();
  notifications = lsf.getNotifications();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
      ),
      floatingActionButton: ElevatedButton(
          onPressed:()async{
            await lsf.addNotifications(WordGenerator().randomSentence(20));
            notifications = lsf.getNotifications();
            setState(() {

            });
          },
          child: const Text('Get Notifications')
      ),
      body: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
          itemBuilder: (_, index){
            var each = notifications?[index];
            return (notifications?.isNotEmpty ?? false)? GestureDetector(
              onTap: (){
                showDialog(
                    context: context,
                    builder: (builder){
                      return  AlertDialog(
                        title: const Text('Do you want to delete this Notification?'),
                        titleTextStyle: jockeyTextStyle.copyWith(
                          color: Colors.red,
                          //fontSize: 13
                        ),
                        content: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            TextButton(
                                onPressed: ()async{
                                  if(each != null){
                                    await lsf.deleteNotifications(each?? "");
                                    setState(() {
                                      notifications = lsf.getNotifications();
                                    });
                                    Navigator.pop(context);
                                  }
                                },
                                child: Text('Yes', style: jockeyTextStyle.copyWith(
                                    color: AppColors.deepBlue
                                ),)),
                            TextButton(
                                onPressed: (){
                                  Navigator.pop(context);
                                },
                                child: Text('No', style: jockeyTextStyle.copyWith(
                                    color: AppColors.oceanBlue
                                ),))
                          ],
                        ),
                      );
                    });
              },
                child: Text(each ?? "")):
            const Center(
                child: Text('No notifications yet')
            );
          },
          itemCount: notifications?.length ?? 0,
        separatorBuilder: (_,index){
            return const Divider();
        },
      ),
    );
  }

}

class LocalStorageFile{
  //make this class a singleton
  static final LocalStorageFile _singleton = LocalStorageFile._internal();

  factory LocalStorageFile() {
    return _singleton;
  }

  LocalStorageFile._internal();

  //instantiate shared preference as a late variable
  late final SharedPreferences sharedPrefs;
  // create a variable that holds the key.
  final String _notificationKey = 'Noti_key';
  final String _nameKey = 'nameKey';
  final String _emailKey = 'emailKey';
  final String _numberKey = 'numberKey';

  //initialize the shared prefs variable
  void initialize()async{
    sharedPrefs =await SharedPreferences.getInstance();
  }

  //add notifications to your key
  Future<void> addNotifications(String values)async{
    await sharedPrefs.setStringList(_notificationKey, [...?getNotifications(), values]);
  }

  Future<void> saveName(String userName)async{
    await sharedPrefs.setString(_nameKey, userName);
  }

  Future<void> saveEmail(String email)async{
    await sharedPrefs.setString(_emailKey, email);
  }

  Future<void> saveNumber(String number)async{
    await sharedPrefs.setString(_nameKey, number);
  }

  List<String>? getNotifications(){
    return sharedPrefs.getStringList(_notificationKey);
  }

  String? getUserName(){
    return sharedPrefs.getString(_nameKey);
  }
  String? getEmail(){
    return sharedPrefs.getString(_emailKey);
  }
  String? getNumber(){
    return sharedPrefs.getString(_numberKey);
  }

  Future<void> deleteNotifications(String noti)async{
    //first get all notifications
    final notifications = getNotifications();

    //check if the particular notification is availaable
    if(notifications != null && notifications.contains(noti)){
      notifications.remove(noti);
    }

    //save the new notifcation List
    await sharedPrefs.setStringList(_notificationKey, notifications!);
  }
}