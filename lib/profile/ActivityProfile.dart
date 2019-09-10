import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:testdrive/utils/GlobalUtils.dart' as Utils;

void main(){
  runApp(new ProfileRootWidget());
}
class ProfileRootWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.black,
          primaryColorBrightness: Brightness.dark,
//          fontFamily: 'Raleway'
      ),
      home: ProfileStateFul(),
    );
  }
}
class ProfileStateFul extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new ProfileStateLess();
  }

}

class ProfileStateLess extends State<ProfileStateFul>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Container(
          color: Colors.black87,
      child: imageContainer(),
      ),
    );
  }

  Widget imageContainer(){
    return Container(
      height: 200,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                child: Container(
                  child: Padding(
                      padding: EdgeInsets.all(8),
                      child: CachedNetworkImage(
                        width: 100,
                        height: 100,
                        alignment: Alignment.center,
                        imageUrl: Utils.profileImageURL,
                      )
                  ),
                )
              ),

              Padding(
                padding: EdgeInsets.all(4),
                child: Text('Hemanth Reddy',textAlign: TextAlign.center,style: TextStyle(color:Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),
              )

            ],
          ),

    );
  }

}