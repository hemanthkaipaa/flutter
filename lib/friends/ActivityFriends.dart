import 'package:flutter/material.dart';

void main(){
  runApp(new FriendsRootWidget());
}
class FriendsRootWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.black,
        primaryColorBrightness: Brightness.dark,
//          fontFamily: 'Raleway'
      ),
      home: FriendsStateFul(),
    );
  }
}
class FriendsStateFul extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new FriendsStateLess();
  }

}

class FriendsStateLess extends State<FriendsStateFul>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Friends'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Container(color: Colors.amber,),
    );
  }

}