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

String profileImageURL ="https://yt3.ggpht.com/a/AGF-l7-BBIcC888A2qYc3rB44rST01IEYDG3uzbU_A=s900-c-k-c0xffffffff-no-rj-mo";

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



