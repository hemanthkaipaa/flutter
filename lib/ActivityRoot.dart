import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testdrive/home/HomeScreen.dart';
import 'package:testdrive/utils/AppTheme.dart';
import 'package:testdrive/utils/bottomBarView.dart';
import 'home/models/tabIconData.dart';

class Root extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor:Colors.transparent,
      statusBarIconBrightness:Brightness.dark,
      statusBarBrightness: Platform.isAndroid ? Brightness.dark : Brightness.light,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarDividerColor: Colors.grey,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
    // TODO: implement build
    return MaterialApp(
      title: 'Xfit',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: AppTheme.textTheme,
        platform: TargetPlatform.android,
      ),
      home: ActivityRoot(),
    );
  }

}

class ActivityRoot extends StatefulWidget {
  @override
  _ActivityRootState createState() => _ActivityRootState();
}

class _ActivityRootState extends State<ActivityRoot>
    with TickerProviderStateMixin {
  AnimationController animationController;

  List<TabIconData> tabIconsList = TabIconData.tabIconsList;

  Widget tabBody = Container(
    color: AppTheme.background,
  );

  @override
  void initState() {
    tabIconsList.forEach((tab) {
      tab.isSelected = false;
    });
    tabIconsList[0].isSelected = true;

    animationController =
        AnimationController(duration: Duration(milliseconds: 600), vsync: this);
    tabBody = HomeScreen(animationController: animationController);
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.background,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return SizedBox();
            } else {
              return Stack(
                children: <Widget>[
                  tabBody,
                  bottomBar(),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  Future<bool> getData() async {
    await Future.delayed(const Duration(milliseconds: 200));
    return true;
  }

  Widget bottomBar() {
    return Column(
      children: <Widget>[
        Expanded(
          child: SizedBox(),
        ),
        BottomBarView(
          tabIconsList: tabIconsList,
          addClick: () {},
          changeIndex: (index) {
            if (index == 0 || index == 2) {
              animationController.reverse().then((data) {
                if (!mounted) return;
                setState(() {
                  tabBody =
                      HomeScreen(animationController: animationController);
                });
              });
            }/* else if (index == 1 || index == 3) {
              animationController.reverse().then((data) {
                if (!mounted) return;
                setState(() {
                  tabBody =
                      TrainingScreen(animationController: animationController);
                });
              });
            }*/
          },
        ),
      ],
    );
  }
}
