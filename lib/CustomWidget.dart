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
  String levelValue = "LEVEL 2";
  String levelInfo = "CAUTION: Reach atleast 10 coins to today not to downgrade to LEVEL 1";
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
                      fontSize: 60, color: Colors.white, fontFamily: 'FJ'),
                  textAlign: TextAlign.center),
              Text('$counter',
                  style: TextStyle(
                      fontSize: 150, color: colorValue, fontFamily: 'FJ'),
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
                      borderSide: BorderSide(width: 1, color: Colors.white30),
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    labelText: 'INPUT',
                    labelStyle: TextStyle(
                      color: Colors.white30,
                      textBaseline: TextBaseline.alphabetic,

                    )),
                child: Container(
                  height: 100,
                  child: Row(
                    children: <Widget>[
                      Flexible(
                        flex: 2,
                        child:Column(
                          children: <Widget>[
                            Flexible(
                              child:Text(levelValue,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.green)),
                            ),
                            Flexible(
                              child: Text(levelInfo,style: TextStyle(color: Colors.white30)),
                            )

                          ],
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Icon(
                          Icons.ac_unit,
                          color: Colors.red,
                        )
                      )

                    ],
                  ),
                ),
              ),

            ],
          ),
        ));
  }

  void incrementCounter() {
    setState(() {
      colorValue = Colors.deepPurpleAccent[200];
      counter += 1;
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
