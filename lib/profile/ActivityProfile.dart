import 'package:flutter/material.dart';

void main(){
  runApp(new ProfileRootWidget());
}
class ProfileRootWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.black,
          primaryColorBrightness: Brightness.dark,
//          fontFamily: 'Raleway'
      ),
      home: ProfileStateFul(),
    );
  }
}
class ProfileStateFul extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new ProfileStateLess();
  }

}

class ProfileStateLess extends State<ProfileStateFul>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Container(color: Colors.deepOrange),
    );
  }

}