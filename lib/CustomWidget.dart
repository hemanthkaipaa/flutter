import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'utils/GlobalUtils.dart' as Utils;

void main() {
  runApp(CustomWidget());
}

class CustomWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "Custom Widget",
      theme: ThemeData(
          primaryColor: Colors.black,
          primaryColorBrightness: Brightness.dark,
          fontFamily: 'Railway'),
      home: IncrementCounterStateFul(),
    );
  }
}

class IncrementCounterStateFul extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new CounterStateLess();
  }
}

class CounterStateLess extends State<IncrementCounterStateFul> {
  int counter = 0;
  bool showPerformance = false;
  Color colorValue = Colors.pinkAccent;
  Color highlightColor = Colors.red;
  int levelValue = 2;
  String levelInfo =
      "CAUTION: Reach atleast 10 coins today not to downgrade to LEVEL 1";
  static const textSize = TextStyle(fontSize: 100, color: Colors.white);
  final fontStyle = TextStyle(color: Colors.white, fontFamily: 'Railway');

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
        appBar: AppBar(
          title: Text('Today', style: fontStyle),
          centerTitle: true,
        ),
        backgroundColor: Colors.black,
        body: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              Text("7684",
                  style: TextStyle(
                      fontSize: 80, color: Colors.white, fontFamily: 'FJ'),
                  textAlign: TextAlign.center),
              Padding(
                padding: EdgeInsets.all(4),
                child: Text("Total Steps",
                    style: TextStyle(color: Colors.white70, fontSize: 20),
                    textAlign: TextAlign.center),
              ),
              Text('$counter',
                  style: TextStyle(
                      fontSize: 160, color: colorValue, fontFamily: 'FJ'),
                  textAlign: TextAlign.center),
              Padding(
                padding: EdgeInsets.all(0),
                child: Text("Coins by Steps",
                    style: TextStyle(color: Colors.white70, fontSize: 20),
                    textAlign: TextAlign.center),
              ),
              RaisedButton(
                  colorBrightness: Brightness.light,
                  onPressed: incrementCounter,
                  color: highlightColor,
                  onHighlightChanged: onHighlighted,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(
                        Icons.favorite,
                        color: Colors.black87,
                      ),
                      Padding(
                        padding: EdgeInsets.all(2),
                      ),
                      Text(
                        'Count',
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 20,
                            letterSpacing: 1,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
              InputDecorator(
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.white70),
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    labelText: 'YOU ARE ON',
                    labelStyle: TextStyle(
                        color: Colors.white70, fontSize: 20, letterSpacing: 1)),
                child: Container(
                  child: Row(
                    children: <Widget>[
                      Flexible(
                        flex: 3,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Flexible(
                                child: Align(
                              alignment: Alignment.topLeft,
                              child: Text('LEVEL $levelValue',
                                  style: TextStyle(
                                      fontSize: 40,
                                      color: Colors.green,
                                      fontFamily: 'FJ')),
                            )),
                            Flexible(
                              child: Text(levelInfo,
                                  style: TextStyle(
                                      color: Colors.white70,
                                      letterSpacing: 1,
                                      wordSpacing: 1)),
                            )
                          ],
                        ),
                      ),
                      Flexible(
                          flex: 1,
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Icon(
                              Icons.ac_unit,
                              color: Colors.red,
                            ),
                          ))
                    ],
                  ),
                ),
              ),
              Container(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        child: Container(
                          color: Colors.amber,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,

                            children: <Widget>[

                              Container(
                                color: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.all(4),
                                  child:  Text('4/4',
                                      style: TextStyle(
                                          fontSize: 40,
                                          color: Colors.black,
                                          fontFamily: 'FJ')),
                                ),
                              ),

                              Container(
                                color: Colors.red,
                                child: Padding(
                                  padding: const EdgeInsets.all(4),
                                  child: Text('Rewards',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.black,
                                      )),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),


//                    Flexible(
//                      flex: 1,
//                      fit: FlexFit.tight,
//                      child: ClipRRect(
//                        borderRadius: BorderRadius.all(Radius.circular(10)),
//                        child: Container(
//                          color: Colors.white,
//                          child: Column(
//                            crossAxisAlignment: CrossAxisAlignment.center,
//                            mainAxisSize: MainAxisSize.max,
//                            children: <Widget>[
//                              Container(
//                                color: Colors.white,
//                                child: Padding(
//                                  padding: const EdgeInsets.all(4),
//                                  child:  Text('4/4',
//                                      style: TextStyle(
//                                          fontSize: 40,
//                                          color: Colors.black,
//                                          fontFamily: 'FJ')),
//                                ),
//                              ),
//
//                              Container(
//                                color: Colors.red,
//                                child: Padding(
//                                  padding: const EdgeInsets.all(4),
//                                  child: Text('Rewards',
//                                      style: TextStyle(
//                                        fontSize: 20,
//                                        color: Colors.black,
//                                      )),
//                                ),
//                              )
//                            ],
//                          ),
//                        ),
//                      ),
//                    ),
//
//                    Flexible(
//                      flex: 1,
//                      fit: FlexFit.tight,
//                      child: ClipRRect(
//                        borderRadius: BorderRadius.all(Radius.circular(10)),
//                        child: Container(
//                          color: Colors.white,
//                          child: Column(
//                            crossAxisAlignment: CrossAxisAlignment.center,
//                            mainAxisSize: MainAxisSize.max,
//                            children: <Widget>[
//                              Container(
//                                color: Colors.white,
//                                child: Padding(
//                                  padding: const EdgeInsets.all(4),
//                                  child:  Text('4/4',
//                                      style: TextStyle(
//                                          fontSize: 40,
//                                          color: Colors.black,
//                                          fontFamily: 'FJ')),
//                                ),
//                              ),
//
//                              Container(
//                                color: Colors.red,
//                                child: Padding(
//                                  padding: const EdgeInsets.all(4),
//                                  child: Text('Rewards',
//                                      style: TextStyle(
//                                        fontSize: 20,
//                                        color: Colors.black,
//                                      )),
//                                ),
//                              )
//                            ],
//                          ),
//                        ),
//                      ),
//                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }

  void incrementCounter() {
    setState(() {
      colorValue = Colors.deepPurpleAccent[200];
      counter += 1;
      if (counter % 2 == 0) {
        levelValue += 1;
      }
    });
  }

  void onHighlighted(bool) {
    setState(() {
      if (bool) {
        Utils.showMessage(context, "Counter is running", Colors.green);
        highlightColor = Colors.deepPurpleAccent[200];
      } else {
        highlightColor = Colors.red;
      }
    });
  }
}
