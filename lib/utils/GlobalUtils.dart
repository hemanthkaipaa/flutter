library GlobalMembers;

import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

String profileImageURL ="https://vpgrealty.ca/wp-content/uploads/2016/06/eric-agent-profile-image.jpg";

/// shared preferences which stores short size data persistently
/// below are all the set methods with different data types.
///----------------------shared prefs KEYS-----------------------------

const String KEY_STORE_COUNT="KEY_STORE_COUNT";
const String KEY_POINT_COUNT="KEY_POINT_COUNT";
const String KEY_EMAIL_ID="KEY_EMAIL_ID";
const String KEY_USER_NAME="KEY_USER_NAME";
const String KEY_PROFILE_IMAGE_URL="KEY_PROFILE_IMAGE_URL";

///---------------------shared preferences-----------------------------
Future<bool> setStoreBool(String key,bool isBoolean) async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.setBool(key, isBoolean);
}
Future<bool> setStoreString(String key,String value) async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.setString(key, value);
}
Future<bool> setStoreInt(String key,int value) async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.setInt(key, value);
}
Future<bool> setStoreDouble(String key,double value) async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.setDouble(key, value);
}

/// shared preference get instance methods
Future<bool> getStoreBool(String key) async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getBool(key)??false;
}
Future<String> getStoreString(String key) async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString(key)??'';
}
Future<int> getStoreInt(String key) async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getInt(key)??0;
}
Future<double> getStoreDouble(String key) async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getDouble(key)??0.0;
}

String getPrefString(String key) {
  var value ="";
  getStoreString(key).then((result) {
    value=result;
  });
  return value;
}
int getPrefInt(String key) {
  var value=0;
  getStoreInt(key).then((result) {
    value=result;
  });
  return value;
}

double getPrefDouble(String key) {
  var value=0.0;
  getStoreDouble(key).then((result) {
    value=result;
  });
  return value;
}

bool getPrefBool(String key) {
  var value=false;
  getStoreBool(key).then((result) {
    value=result;
  });
  return value;
}
///----------------------------------------------------------------Global Constants------------------------------------------------------
const int OUT_DOOR_STEPS_PERCENTAGE = 800;

/// ----------------------------------------------------------------END of GLOBAL CONSTANTS-----------------------------------------------

String numberFontFamily="Gobold_Bold";

///-------------------------------------------------------------------GLOBAL METHODS------------------------------------------------------
 double returnStepCalculation(int totalSteps){
   double value =totalSteps/OUT_DOOR_STEPS_PERCENTAGE;
   double roundedValue = double.parse(value.toStringAsFixed(2));
  return roundedValue;
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

String decimalFormat(double value){
  var numberFormat = NumberFormat('00.00');
  return numberFormat.format(value);
}

Widget startActivity(BuildContext context,Widget widget){
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) {
        return widget;
      },
    ),
  );
  return widget;
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}