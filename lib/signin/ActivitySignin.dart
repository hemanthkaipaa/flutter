import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'SignIn.dart';
import 'package:testdrive/root/ActivityRoot.dart' as Root;

void main(){
  runApp(new SignInRootWidget());
}
class SignInRootWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.black,
        primaryColorBrightness: Brightness.dark,
//          fontFamily: 'Raleway'
      ),
      home: SignInStateFul(),
    );
  }
}
class SignInStateFul extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new SignInStateLess();
  }

}

class SignInStateLess extends State<SignInStateFul>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('SignIn'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Container(color: Colors.white,child: signInContainer(),),
    );
  }

  Widget signInContainer(){
    return
      Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlutterLogo(size: 150),
            SizedBox(height: 50),
            _signInButton(),
          ],
        ),
      );
  }
  Widget _signInButton() {
    return OutlineButton(
      splashColor: Colors.grey,
      onPressed: () {
        signInWithGoogle().whenComplete(() {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return Root.RootStateFul();
              },
            ),
          );
        });
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      highlightElevation: 0,
      borderSide: BorderSide(color: Colors.grey),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CachedNetworkImage(imageUrl: "https://upload.wikimedia.org/wikipedia/commons/thumb/2/2d/Google_Plus_logo_2015.svg/1024px-Google_Plus_logo_2015.svg.png",
              height: 30,width: 30,),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Sign in with Google',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}