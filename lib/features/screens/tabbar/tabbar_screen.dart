import 'package:class_app/layouts/grid-view.dart';
import 'package:class_app/shared/constants.dart';
import 'package:flutter/material.dart';

import '../../../shared/app_colors.dart';

class TabbarScreen extends StatefulWidget {
  const TabbarScreen({super.key});

  @override
  State<TabbarScreen> createState() => _TabbarScreenState();
}

class _TabbarScreenState extends State<TabbarScreen> with SingleTickerProviderStateMixin {
  late final TabController _tabController ;

  @override
  void initState(){
    super.initState();
    _tabController =
        TabController(length: 3,
            vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:AppBar(
        title: const Text('Tab Bar Screen'),
      ),
      body: Column(
        children: [
          Container(
            height: 40,
            padding: const EdgeInsets.all(5),
            child: TabBar(
              controller: _tabController,
                labelColor: AppColors.white,
                unselectedLabelColor: AppColors.black,
                dividerColor: Colors.transparent,
                labelStyle: baseTextStyle.copyWith(fontWeight: FontWeight.w700),
                unselectedLabelStyle:
                baseTextStyle.copyWith(fontWeight: FontWeight.w200),
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.black,
                ),
                indicatorSize: TabBarIndicatorSize.tab,
                tabs: const [
                  Text("Pending"),
                  Text("Ongoing"),
                  Text("Completed"),
                ]
            ),
          ),
      Expanded(
        child: TabBarView(controller: _tabController, children: const [
          GridViewScreen(),
          Center(
            child: Text("Ongoing Page"),
          ),
          Center(
            child: Text("Completed Page"),
          ),
        ]),
      )],
      ) ,
    );
  }
}
