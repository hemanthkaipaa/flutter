import 'package:flutter/material.dart';

void main(){
  runApp(new CoinsRootWidget());
}
class CoinsRootWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.black,
          primaryColorBrightness: Brightness.dark,
//          fontFamily: 'Raleway'
      ),
      home: CoinsStateFul(),
    );
  }
}
class CoinsStateFul extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new CoinsStateLess();
  }

}

class CoinsStateLess extends State<CoinsStateFul>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Coins'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Container(color: Colors.green),

    );
  }

}