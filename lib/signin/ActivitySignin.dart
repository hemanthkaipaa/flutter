import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'SignIn.dart';
import 'package:testdrive/root/ActivityRoot.dart' as Root;
import 'package:testdrive/utils/GlobalUtils.dart' as Utils;

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Utils.getStoreString(Utils.KEY_EMAIL_ID).then((value){
    final String onValue=value;
    if(onValue!=null&&onValue.toString().isNotEmpty){
      runApp(Root.Root());
    }else{
      runApp(new SignInRootWidget());
    }
  });
}

class SignInRootWidget extends StatelessWidget {

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

class SignInStateFul extends StatefulWidget {

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
      appBar: GradientAppBar(
        title: Text('SignIn'),
        centerTitle: true,
       gradient: LinearGradient(
           begin: Alignment.topRight,
           end: Alignment.bottomLeft,
           colors: [Colors.greenAccent, Colors.green])
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.blueGrey, Colors.red])),
        child: signInContainer(),
      ),
    );
  }

  Widget signInContainer() {
    return Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(padding: EdgeInsets.all(16),child:  _signInButton(),)

        ],
    );
  }

  Widget _signInButton() {
    return OutlineButton(
      splashColor: Colors.blue,
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
      borderSide: BorderSide(color: Colors.black87),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CachedNetworkImage(
              imageUrl:
                  "https://upload.wikimedia.org/wikipedia/commons/thumb/2/2d/Google_Plus_logo_2015.svg/1024px-Google_Plus_logo_2015.svg.png",
              height: 40,
              width: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Sign in with Google',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
