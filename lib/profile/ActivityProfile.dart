import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:testdrive/utils/GlobalUtils.dart' as Utils;

void main() {
  runApp(new ProfileRootWidget());
}

class ProfileRootWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.black,
        primaryColorBrightness: Brightness.dark,
        backgroundColor: Colors.black,
//          fontFamily: 'Raleway'
      ),
      home: ProfileStateFul(),
    );
  }
}

class ProfileStateFul extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new ProfileStateLess();
  }
}

class ProfileStateLess extends State<ProfileStateFul> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: rootContainer(),
    );
  }

  Widget rootContainer() {
    return  Container(
      color: Colors.black,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          imageContainer(),
          Padding(
            padding: EdgeInsets.all(20),
            child: levelInfoContainer(),
          ),
          stepsTable(),
          weekStatusTable(),
        ],
      ),
    );
  }

  Widget imageContainer() {
    return Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              border: Border.all(
                  color: Colors.amber, style: BorderStyle.solid, width: 4),
              borderRadius: BorderRadius.all(Radius.circular(8))),
          child: Card(
              elevation: 6,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              color: Colors.black26,
              borderOnForeground: true,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4))),
              child: CachedNetworkImage(
                matchTextDirection: true,
                width: 80,
                height: 80,
                alignment: Alignment.center,
                imageUrl: Utils.profileImageURL,
              )),
        ),
        Padding(
          padding: EdgeInsets.all(2),
          child: Text(
            'Hemanth Reddy',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(2),
          child: Text(
            '@hemanthkaipa',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white60,
                fontSize: 12,
                fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }

  Widget levelInfoContainer() {
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white12),
                    borderRadius: BorderRadius.all(Radius.circular(4))),
                child: Column(
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.fromLTRB(0, 12, 0, 4),
                        child: Text('FOLLOWING',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 8,
                                color: Colors.white70,
                                letterSpacing: 1,
                                fontWeight: FontWeight.bold))),
                    Padding(
                        padding: EdgeInsets.fromLTRB(0, 4, 0, 12),
                        child: Text('57',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 24,
                                color: Colors.white,
                                letterSpacing: 1,
                                fontWeight: FontWeight.bold)))
                  ],
                ),
              )),
          Padding(
            padding: EdgeInsets.all(4),
          ),
          Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.amber,
                    border: Border.all(color: Colors.white12),
                    borderRadius: BorderRadius.all(Radius.circular(4))),
                child: Column(
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.fromLTRB(0, 12, 0, 4),
                        child: Text('LEVEL',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 10,
                                color: Colors.black,
                                letterSpacing: 1,
                                fontWeight: FontWeight.bold))),
                    Padding(
                        padding: EdgeInsets.fromLTRB(0, 4, 0, 12),
                        child: Text('3',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 24,
                                color: Colors.black,
                                letterSpacing: 1,
                                fontWeight: FontWeight.bold)))
                  ],
                ),
              )),
          Padding(
            padding: EdgeInsets.all(4),
          ),
          Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white12),
                    borderRadius: BorderRadius.all(Radius.circular(4))),
                child: Column(
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.fromLTRB(0, 12, 0, 4),
                        child: Text('FOLLOWERS',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 8,
                                color: Colors.white70,
                                letterSpacing: 1,
                                fontWeight: FontWeight.bold))),
                    Padding(
                        padding: EdgeInsets.fromLTRB(0, 4, 0, 12),
                        child: Text('30',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 24,
                                color: Colors.white,
                                letterSpacing: 1,
                                fontWeight: FontWeight.bold)))
                  ],
                ),
              )),
        ],
      ),
    );
  }

  Widget stepsTable() {
    return Table(
      border: TableBorder(
        horizontalInside: BorderSide(
          color: Colors.white30,
          style: BorderStyle.solid,
          width: 1.0,
        ),
        verticalInside: BorderSide(
          color: Colors.white30,
          style: BorderStyle.solid,
          width: 1.0,
        ),
      ),
      children: tableRow,
    );
  }

  List<TableRow> tableRow = [
    TableRow(
        decoration: BoxDecoration(
            color: Colors.white10,
            border: Border(
                bottom: BorderSide(color: Colors.white30),
                top: BorderSide(color: Colors.white30))),
        children: <Widget>[
          Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(0, 12, 0, 4),
                child: Text(
                  '1.67M',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                  padding: EdgeInsets.fromLTRB(0, 4, 0, 12),
                  child: Text('Total Steps',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white70, fontSize: 8)))
            ],
          ),
          Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(0, 12, 0, 4),
                child: Text(
                  '12,526',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                  padding: EdgeInsets.fromLTRB(0, 4, 0, 12),
                  child: Text('Avg. Steps / Day',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white70, fontSize: 8)))
            ],
          ),
        ]),
    TableRow(
        decoration: BoxDecoration(
            color: Colors.white10,
            border: Border(
              bottom: BorderSide(color: Colors.white30),
            )),
        children: <Widget>[
          Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(0, 12, 0, 4),
                child: Text(
                  '\$2482',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                  padding: EdgeInsets.fromLTRB(0, 4, 0, 12),
                  child: Text('Total Coins Earned',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white70, fontSize: 8)))
            ],
          ),
          Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(0, 12, 0, 4),
                child: Text(
                  '\$18.00',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                  padding: EdgeInsets.fromLTRB(0, 4, 0, 12),
                  child: Text('Avg. Coins / Day',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white70, fontSize: 8)))
            ],
          ),
        ]),
  ];

  Widget weekStatusTable() {
    return Table(
      children: weekStatusTableRow,
    );
  }

  List<TableRow> weekStatusTableRow = [
    TableRow(
        decoration: BoxDecoration(
            color: Colors.black,
            border: Border(
              bottom: BorderSide(color: Colors.white30),
            )),
        children: <Widget>[
          Column(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.fromLTRB(0, 12, 0, 4),
                  child: Icon(
                    Icons.ac_unit,
                    color: Colors.amber,
                  )),
              Padding(
                  padding: EdgeInsets.fromLTRB(0, 4, 0, 12),
                  child: Text('Su',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white70, fontSize: 8)))
            ],
          ),
          Column(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.fromLTRB(0, 12, 0, 4),
                  child: Icon(
                    Icons.check_circle,
                    color: Colors.amber,
                  )),
              Padding(
                  padding: EdgeInsets.fromLTRB(0, 4, 0, 12),
                  child: Text('Mo',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white70, fontSize: 8)))
            ],
          ),
          Column(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.fromLTRB(0, 12, 0, 4),
                  child: Icon(
                    Icons.ac_unit,
                    color: Colors.amber,
                  )),
              Padding(
                  padding: EdgeInsets.fromLTRB(0, 4, 0, 12),
                  child: Text('Tu',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white70, fontSize: 8)))
            ],
          ),
          Column(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.fromLTRB(0, 12, 0, 4),
                  child: Icon(
                    Icons.check_circle,
                    color: Colors.amber,
                  )),
              Padding(
                  padding: EdgeInsets.fromLTRB(0, 4, 0, 12),
                  child: Text('We',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white70, fontSize: 8)))
            ],
          ),
          Column(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.fromLTRB(0, 12, 0, 4),
                  child: Icon(
                    Icons.check_circle,
                    color: Colors.amber,
                  )),
              Padding(
                  padding: EdgeInsets.fromLTRB(0, 4, 0, 12),
                  child: Text('Th',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white70, fontSize: 8)))
            ],
          ),
          Column(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.fromLTRB(0, 12, 0, 4),
                  child: Icon(
                    Icons.brightness_7,
                    color: Colors.amber,
                  )),
              Padding(
                  padding: EdgeInsets.fromLTRB(0, 4, 0, 12),
                  child: Text('Fr',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white70, fontSize: 8)))
            ],
          ),
          Column(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.fromLTRB(0, 12, 0, 4),
                  child: Icon(
                    Icons.check_circle,
                    color: Colors.amber,
                  )),
              Padding(
                  padding: EdgeInsets.fromLTRB(0, 4, 0, 12),
                  child: Text('Sa',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white70, fontSize: 8)))
            ],
          ),
        ]),
  ];
}
