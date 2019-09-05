import 'package:flutter/material.dart';

void main(){
  runApp(new ShopRootWidget());
}
class ShopRootWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.black,
          primaryColorBrightness: Brightness.dark,
//          fontFamily: 'Raleway'
      ),
      home: ShopStateFul(),
    );
  }
}
class ShopStateFul extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new ShopStateLess();
  }

}

class ShopStateLess extends State<ShopStateFul>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Shop'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Container(color: Colors.teal),

    );
  }

}