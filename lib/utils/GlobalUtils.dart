library GlobalMembers;

import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

///Configuration backend connection URL
String hostName= "https://my-json-server.typicode.com/hemanthkaipaa/json/";

/// This will append the hostname with path and return the URL
String fetchURL(String pathURL){
  return hostName+pathURL;
}
///------------------------------------- APP colors-------------------------------------
Color primaryColor(){
  return Colors.black87;
}
Color primaryDark(){
  return Colors.black;
}
Color primaryAccent(){
  return Colors.black;
}



void showMessage(BuildContext buildContext, String message, Color color) {
  showToast(message,
      context: buildContext,
      position: StyledToastPosition.top,
      borderRadius: BorderRadius.circular(5.0),
      textPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      animation: StyledToastAnimation.slideFromTopFade,
      reverseAnimation: StyledToastAnimation.slideToTopFade,
      duration: Duration(seconds: 3),
      backgroundColor: color);
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
              padding:
              EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Align(
                alignment: Alignment.center,
                child: Text(t1,
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                        backgroundColor: Colors.white,
                        fontFamily: 'FJ',fontWeight: FontWeight.bold
                    )),
              )
            ),
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
                        child: Text(t2 ,
                            textAlign: TextAlign.center,
                            textWidthBasis: TextWidthBasis.parent,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                              backgroundColor: Colors.red,
                            )),
                      ))),
            )
          )


        ],
      ),
    ),
  );

}

void dummyCode(){
  Padding(
    padding: EdgeInsets.fromLTRB(0, 30, 0, 10),
    child: Container(
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: IntrinsicHeight(
              child: RaisedButton(
                child: Text('Short'),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: IntrinsicHeight(
              child: RaisedButton(
                child: Text('A bit Longer'),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: IntrinsicHeight(
              child: RaisedButton(
                child: Text('The Longest text button'),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
