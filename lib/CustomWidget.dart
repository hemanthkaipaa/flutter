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
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () { },
          tooltip: 'Increment',
          child: Icon(Icons.add),
          elevation: 2.0,
        ),

        backgroundColor: Colors.black,

        bottomNavigationBar: BottomAppBar(
          color: Colors.blueGrey,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[

            ],
          ),
        ),
        body: SingleChildScrollView(
            child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              Text("0012",
                  style: TextStyle(
                      fontSize: 80, color: Colors.white, fontFamily: 'FJ'),
                  textAlign: TextAlign.center),
              Text("Total Steps",
                  style: TextStyle(color: Colors.white70, fontSize: 20),
                  textAlign: TextAlign.center),
              Text('$counter',
                  style: TextStyle(
                      fontSize: 160, color: colorValue, fontFamily: 'FJ'),
                  textAlign: TextAlign.center),
              Text("Coins by Steps",
                  style: TextStyle(color: Colors.white70, fontSize: 20),
                  textAlign: TextAlign.center),
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
              Padding(
                padding: EdgeInsets.fromLTRB(0, 30, 0, 10),
                child: Container(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                     Utils.columnOne('4/4', 'Daily Rewards'),
                      Padding(
                        padding: EdgeInsets.all(5),
                      ),
                      Utils.columnOne('15', 'Invite a Friend'),
                      Padding(
                        padding: EdgeInsets.all(5),
                      ),
                      Utils.columnOne('2456', 'Coins'),
                    ],
                  ),
                ),
              )
            ],
          ),
        )));
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
