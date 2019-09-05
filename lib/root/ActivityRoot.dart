import 'package:flutter/material.dart';
import 'package:testdrive/CustomWidget.dart';
import 'package:testdrive/coins/ActivityCoins.dart';
import 'package:testdrive/friends/ActivityFriends.dart';
import 'package:testdrive/profile/ActivityProfile.dart';
import 'package:testdrive/shop/ActivityShop.dart';
void main(){
  runApp(new Root());
}

class Root extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.black,
        primaryColorBrightness: Brightness.dark,
        fontFamily: 'Railway'
      ),
      home: RootStateFul(),
    );
  }

}

class RootStateFul extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new RootStateLess();
  }

}

class RootStateLess extends State<RootStateFul>{
  static int selectionIndex=0;
  final PageController pageController = new PageController(
    initialPage: 0,
    keepPage: true
  );
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: bottomNavigation(),
      body: setupPageViewWidgets(),
    );
  }

  ///implementing BottomNavigation Menu where we can navigate to other pageViews based on PageController
  Widget bottomNavigation(){
    return BottomNavigationBar(
      backgroundColor: Colors.white10,
      type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.ac_unit),
          title: Text('Home'),
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.android),
            title: Text('Friends')
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.business_center),
            title:Text('Shop')
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.attach_money),
            title:Text('Coins')
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.adb),
            title:Text('Profile')
        ),
      ],
      currentIndex: selectionIndex,
      selectedItemColor: Colors.white,
      unselectedItemColor:Colors.white54 ,
      selectedIconTheme: IconThemeData(color: Colors.white,size: 26),
      onTap: onNavigationItemSelected,
    );
  }

  /// this widget will give multiple screens to navigate on swipe action
  Widget setupPageViewWidgets(){
    return PageView(
      controller: pageController,
      onPageChanged: pageChanged,
      children: <Widget>[
        CustomWidget(),
        FriendsRootWidget(),
        ShopRootWidget(),
        CoinsRootWidget(),
        ProfileRootWidget(),
      ],
    );
  }
  void pageChanged(int index){
    setState(() {
      selectionIndex = index;
    });
  }
  /// invoked when navigation menu selected
  /// selectionIndex will be notified with the result action.
  void onNavigationItemSelected(int index) {
    setState(() {
      selectionIndex = index;
      pageController.animateToPage(index, duration: Duration(milliseconds: 500), curve: Curves.ease);
    });
  }

  @override
  void initState() {
    super.initState();
  }
}
