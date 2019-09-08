import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:http/http.dart' as HTTP;
import 'package:testdrive/utils/GlobalUtils.dart';

void main() {
  runApp(new ShopRootWidget());
}

class ShopRootWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.black,
        primaryColorBrightness: Brightness.dark,
//          fontFamily: 'Raleway'
      ),
      home: ShopStateFul(),
    );
  }
}

class ShopStateFul extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new ShopStateLess();
  }
}

class ShopStateLess extends State<ShopStateFul> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getShopListAsync();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Shop'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Container(color: Colors.teal, child: setupStaggeredGridView()),
    );
  }

  Widget setupStaggeredGridView() {
    return new StaggeredGridView.countBuilder(
      crossAxisCount: 2, //as per your requirement
      itemCount: 8, //as per your requirement
      itemBuilder: (BuildContext context, int index) {
        return setupTileWithImages(shopList[index].brandDesc,shopList[index].imageLink); //your
      },
      staggeredTileBuilder: (int index) {
        if (shopList != null) {
          if (shopList[index].brandID == '01') {
            return new StaggeredTile.count(2, 1);
          } else {
            return new StaggeredTile.count(1, 1);
          }
        } else {
          return null;
        }
      },
    );
  }

  Widget setupTile(String t1) {
    return Card(
        child: Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Text(t1, textAlign: TextAlign.center),
      ],
    ));
  }

  Widget setupTiles(String t1, String t2) {
    return Card(
        child: Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Text(t1, textAlign: TextAlign.center),
        Text(t2, textAlign: TextAlign.center),
      ],
    ));
  }
  Widget setupTileWithImages(String t1,String imageLink) {
    return Card(
        child: Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Text(t1, textAlign: TextAlign.center),
        CachedNetworkImage(
          height: 100,
          imageUrl: imageLink,
          placeholder: (context, url) => new CircularProgressIndicator(),
          errorWidget: (context, url, error) => new Icon(Icons.error),
        )
      ],
    ));
  }

  List<ShopBean> shopList = [];
  void getShopListAsync() async {
    final response = await HTTP.get(fetchURL("shoplist"));
    final List<ShopBean> responseParsed = jsonDecode(response.body)
        .map<ShopBean>((json) => ShopBean.fromJSON(json))
        .toList();
    setState(() {
      shopList.addAll(responseParsed);
    });
  }
}

class ShopBean {
  String brandDesc;
  String brandID;
  String imageLink;

//  ShopBean(this.brandDesc);
//  ShopBean.catID(this.brandDesc,this.brandID);
//  ShopBean.extraParam(this.brandDesc,this.imageLink);
  ShopBean({this.brandID, this.brandDesc, this.imageLink});

  factory ShopBean.fromJSON(Map<String, dynamic> json) {
    return ShopBean(
        brandID: json['brandID'],
        brandDesc: json['brandDesc'],
        imageLink: json['imageLink']);
  }
}
