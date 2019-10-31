import 'package:fit_kit/fit_kit.dart';
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
      ),
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

class CounterStateLess extends State<IncrementCounterStateFul>
    with AutomaticKeepAliveClientMixin {
  int totalSteps = 0;
  String counter="0.0";
  bool showPerformance = false;
  Color colorValue = Colors.indigo;
  Color highlightColor = Colors.indigo;
  int levelValue = 2;
  String levelInfo =
      "CAUTION: Reach atleast 10 coins today not to downgrade to LEVEL 1";
  final fontStyle = TextStyle(color: Colors.white);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readAll();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('Today', style: fontStyle),
          centerTitle: true,
        ),
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
            child: Container(
          padding: EdgeInsets.all(16),
          child:Column(
            children: <Widget>[
              Container(
                decoration:BoxDecoration(
                    color: Colors.black,
                    border: Border.all(color: Colors.indigo,width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[

                        Text('$totalSteps',
                            style: TextStyle(
                                fontSize: 50,
                                color: Colors.white,
                                fontFamily: Utils.numberFontFamily),
                            textAlign: TextAlign.center),
                        Text("Total Steps",
                            style: TextStyle(color: Colors.white70, fontSize: 16),
                            textAlign: TextAlign.center),
                        Text('$counter',
                            style: TextStyle(
                                fontSize: 80,
                                color: colorValue,
                                fontFamily: Utils.numberFontFamily),
                            textAlign: TextAlign.center),
                        Text("Coins by Steps",
                            style: TextStyle(color: Colors.white70, fontSize: 16),
                            textAlign: TextAlign.center),
                      ],
                    ),
                  ],
                )
              ),
              Column(
                children: <Widget>[
                  Padding(padding: EdgeInsets.all(8)),
                  InputDecorator(
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 1, color: Colors.white54),
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        labelText: 'YOU ARE ON',
                        labelStyle: TextStyle(
                            color: Colors.white54, fontSize: 12, letterSpacing: 1)),
                    child: Container(
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
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
                                              fontSize: 25,
                                              color: Colors.green,
                                              fontFamily: Utils.numberFontFamily)),
                                    )),
                                Flexible(
                                  child: Text(levelInfo,
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.white54,
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
                      color: Colors.black,
                      child: Row(
                        children: <Widget>[
                          Expanded(
                              child: IntrinsicHeight(
                                  child: IntrinsicWidth(
                                    child: columnOne('3/4', 'Rewards'),
                                  ))),
                          Padding(
                            padding: EdgeInsets.all(5),
                          ),
                          Expanded(
                              child: IntrinsicHeight(
                                  child: IntrinsicWidth(
                                      child:
                                      columnOne("\$ 5", 'Invite a friend')))),
                          Padding(
                            padding: EdgeInsets.all(5),
                          ),
                          Expanded(
                              child: IntrinsicHeight(
                                  child: IntrinsicWidth(
                                      child: columnOne('\$ 3242', 'Coins')))),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )

        )));
  }

  void read() async {
    final now = DateTime.now();
    final lastMidnight = new DateTime(now.year, now.month, now.day);
    final results = await FitKit.read(DataType.STEP_COUNT, lastMidnight, now);
    Future.value(results).then((value) {
      int values = 0;
      List<FitData> data = value;
      for (FitData bean in data) {
        assert(bean != null);
        values += bean.value;
        print(values);
      }
      Utils.setStoreInt(Utils.KEY_STORE_COUNT, values);
      Utils.setStoreDouble(
          Utils.KEY_POINT_COUNT, Utils.returnStepCalculation(values));
      Utils.getStoreString(Utils.KEY_EMAIL_ID).then((value) {
        print(value);
      });
      setState(() {
        Utils.getStoreInt(Utils.KEY_STORE_COUNT).then((value) {
          setState(() {
            totalSteps = value;
            Utils.getStoreDouble(Utils.KEY_POINT_COUNT).then((value) {
              setState(() {
                counter = Utils.decimalFormat(value);
              });
            });
          });
        });
      });
    });
  }

  void onHighlighted(bool) {
    setState(() {
      if (bool) {
        Utils.showMessage(context, "Counter is running", Colors.green);
        highlightColor = Colors.teal;
      } else {
        highlightColor = Colors.red;
      }
    });
  }

  Future<void> readAll() async {
    String results = "";
    try {
      final permissions = await FitKit.requestPermissions(DataType.values);
      if (!permissions) {
        results = "User declined permissions";
        Utils.showMessage(context, results, Colors.red);
      } else {
        checkPermission();
      }
    } catch (e) {
      results = 'Failed to read all values. $e';
      Utils.showMessage(context, results, Colors.red);
    }
  }

  void checkPermission() {
    try {
      read();
    } catch (e) {
      print(e);
      Utils.showMessage(context, e, Colors.red);
    }
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

Widget columnOne(String t1, String t2) {
  return ClipRRect(
    borderRadius: BorderRadius.all(Radius.circular(8)),
    child: Container(
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            color: Colors.white,
            child: Padding(
                padding: EdgeInsets.fromLTRB(4, 10, 4, 10),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(t1,
                      style: TextStyle(
                          fontSize: 26,
                          color: Colors.black,
                          backgroundColor: Colors.white,
                          fontFamily: Utils.numberFontFamily,
                          fontWeight: FontWeight.bold)),
                )),
          ),
          IntrinsicHeight(
              child: ConstrainedBox(
            constraints: const BoxConstraints(minWidth: double.infinity),
            child: Container(
                height: 50,
                color: Colors.red,
                child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(t2,
                          textAlign: TextAlign.center,
                          textWidthBasis: TextWidthBasis.parent,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                            backgroundColor: Colors.red,
                          )),
                    ))),
          ))
        ],
      ),
    ),
  );
}
