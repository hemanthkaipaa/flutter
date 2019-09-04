library GlobalMembers;

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

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
  return Expanded(
    flex: 1,
      child: ClipRRect(
    borderRadius: BorderRadius.all(Radius.circular(8)),
    child: Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            child: Padding(
              padding:
              EdgeInsets.fromLTRB(10, 16, 10, 16),
              child: Align(
                alignment: Alignment.center,
                child: Text(t1,
                    style: TextStyle(
                        fontSize: 35,
                        color: Colors.black,
                        backgroundColor: Colors.white,
                        fontFamily: 'FJ',fontWeight: FontWeight.bold
                    )),
              )
            ),
          ),
          ConstrainedBox(
            constraints: const BoxConstraints(minWidth: double.infinity),
            child: Container(
                color: Colors.red,
                child: Padding(
                    padding: EdgeInsets.all(14),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(t2 ,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            backgroundColor: Colors.red,
                          )),
                    ))),
          )
        ],
      ),
    ),
  ));
}
