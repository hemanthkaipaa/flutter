import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:http/http.dart' as HTTP;
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:testdrive/utils/GlobalUtils.dart';
import 'package:testdrive/utils/GlobalUtils.dart' as Utils;

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

class ShopStateLess extends State<ShopStateFul>
    with AutomaticKeepAliveClientMixin {
  final RefreshController _refreshController = RefreshController();

  List<ShopBean> shopList = [];
  List<ProductGroupBean> productGroupList = [];
  List<Object> objectList = [];

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
        body:
            Container(color: Colors.black87, child: setupStaggeredGridView()));
  }

  Widget setupStaggeredGridView() {
    return new StaggeredGridView.countBuilder(
      shrinkWrap: false,
      crossAxisCount: 2, //as per your requirement
      itemCount: objectList.length, //as per your requirement
      itemBuilder: itemConstructor,
      staggeredTileBuilder:tileBuilder,
    );
  }

  Widget setupTitle(String t1, String t2) {
    return Padding(
      padding: EdgeInsets.fromLTRB(24,35,24,2),
      child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(t1, textAlign: TextAlign.start,style: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.bold),),
              Text(t2, textAlign: TextAlign.start,style: TextStyle(fontSize: 12,color: Colors.white70,fontWeight: FontWeight.bold),),
            ],
          )
      )
    );
  }

  Widget setupTileWithImages(String t1, String imageLink) {
    return Padding(
        padding: EdgeInsets.fromLTRB(14, 4, 14, 4),
        child: Card(
          borderOnForeground: false,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          color: Colors.black,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                  flex: 5,
                  child: CachedNetworkImage(
                    imageUrl: imageLink,
                    placeholder: (context, url) =>
                        new CircularProgressIndicator(),
                    errorWidget: (context, url, error) => new Icon(Icons.error),
                    fit: BoxFit.cover,
                  )),
              Expanded(
                  child: Container(
                height: 100,
                color: Colors.black,
                alignment: Alignment.center,
                child: Text(
                  t1,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ))
            ],
          ),
        ));
  }

  Widget setupSplitTileWithImages(String t1, String imageLink) {
    return Padding(
      padding: EdgeInsets.fromLTRB(14, 4, 14, 4),
      child: Card(
          borderOnForeground: false,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          color: Colors.black,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                  flex: 6,
                  child: CachedNetworkImage(
                    imageUrl: imageLink,
                    errorWidget: (context, url, error) => new Icon(Icons.error),
                    fit: BoxFit.cover,
                  )),
              Expanded(
                  flex: 2,
                  child: Container(
                    color: Colors.black,
                    alignment: Alignment.center,
                    child: Text(
                      t1,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12),
                    ),
                  ))
            ],
          )),
    );
  }

  Widget setupFooterContainer() {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Icon(
                  Icons.bookmark_border,
                  size: 42,
                ),
                Text(
                  'Daily Rewards',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'You have claimed all 4 rewards. Claim again tomorrow',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1),
                ),
              ],
            ),
          ),
          Container(
              color: Colors.black,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Column(
                          children: <Widget>[
                            Text(
                              '4/4',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Claimed',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                      height: 60,
                      child: VerticalDivider(color: Colors.white70)),
                  Expanded(
                    flex: 1,
                    child: Container(
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Column(
                          children: <Widget>[
                            Text(
                              '\$4.0',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Earned',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              )),
          Container(
            padding: EdgeInsets.fromLTRB(24, 24, 24, 6),
            child: RaisedButton(
              color: Colors.black,
              padding: EdgeInsets.all(16),
              shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(10.0)),
              splashColor: Colors.white,
              child: new Text(
                "Get Reward",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              onPressed: onWatchVideo,
            ),
          ),
          Text(
            'please wait to claim the reward',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12),
          )
        ],
      ),
    );
  }

  Widget itemConstructor(BuildContext context, int index){
    var value;
    ShopBean bean;
    ProductGroupBean productGroupBean;
    if(objectList[index] is ShopBean){
      bean = objectList[index];
      value = bean.catID;
    }else{
      productGroupBean = objectList[index];
      value = productGroupBean.catID;
    }
    switch(value){
      case "01":
        if(bean!=null)
        return setupTileWithImages(bean.brandDesc, bean.imageLink); //your
        break;
      case "02":
        if(bean!=null)
        return setupSplitTileWithImages(bean.brandDesc, bean.imageLink); //your
        break;
      case "03":
        return setupFooterContainer();
        break;
      case "04":
        if(productGroupBean!=null)
        return setupTitle(productGroupBean.productGroupDesc, productGroupBean.subGroupDesc);
        break;
    }
    return null;
  }

  StaggeredTile tileBuilder(int index){
    var value;
    ShopBean bean;
    ProductGroupBean productGroupBean;
    if(objectList[index] is ShopBean){
      bean = objectList[index];
      value = bean.catID;
    }else{
      productGroupBean = objectList[index];
      value = productGroupBean.catID;
    }
    switch(value){
      case "01":
        return new StaggeredTile.count(2, 2);
        break;
      case "02":
        return new StaggeredTile.count(1, 1.2);
        break;
      case "03":
        return new StaggeredTile.count(2, 2);
        break;
      case "04":
        return new StaggeredTile.count(2, 0.4);
        break;
    }
    return null;
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  void onWatchVideo() {
    setState(() {
      Utils.showMessage(context, 'you have rewarded with 1 coin', Colors.green);
    });
  }

  /// get details from backend which includes the JSON Decode functionality.
  /// in the end we have Added the dummy item to show the footer in setStateMethod
  void getShopListAsync() async {
    final response = await HTTP.get(fetchURL("productGroup"));
    final List<ProductGroupBean> responseParsed = jsonDecode(response.body)
        .map<ProductGroupBean>((json) => ProductGroupBean.fromJSON(json))
        .toList();
    productGroupList.addAll(responseParsed);
    for(ProductGroupBean bean in productGroupList){
      objectList.add(bean);
      if(bean.shopList!=null&&bean.shopList.isNotEmpty){
        for(ShopBean shopBean in bean.shopList){
          objectList.add(shopBean);
        }
      }
    }
    setState(() {
      objectList.add(new ShopBean.Cons('03', 'dummy', 'dummy'));
    });
  }
}

class ShopBean {
  String brandDesc;
  String brandID;
  String catID;
  String catDesc;
  String imageLink;
  ShopBean(
      {this.brandID, this.brandDesc, this.imageLink, this.catID, this.catDesc});
  ShopBean.Cons(this.catID, this.catDesc, this.imageLink);

  factory ShopBean.fromJSON(Map<String, dynamic> json) {
    return ShopBean(
        brandID: json['brandID'],
        brandDesc: json['brandDesc'],
        imageLink: json['imageLink'],
        catDesc: json['catDesc'],
        catID: json['catID']);
  }
}

class ProductGroupBean {
  String productID;
  String productGroupDesc;
  String subGroupDesc;
  String catID;
  String catDesc;
  List<ShopBean> shopList;

  ProductGroupBean(
      {this.productID,
      this.productGroupDesc,
      this.subGroupDesc,
      this.catID,
      this.catDesc,
      this.shopList});

  factory ProductGroupBean.fromJSON(Map<String, dynamic> jsonData) {
    return ProductGroupBean(
      productID: jsonData['productID'],
      productGroupDesc: jsonData['productGroupDesc'],
      subGroupDesc: jsonData['subGroupDesc'],
      catID: jsonData['catID'],
      catDesc: jsonData['catDesc'],
      shopList:  List<ShopBean>.from(jsonData['shoplist'].map((jsonData)=>ShopBean.fromJSON(jsonData)).toList()),
    );
  }

}
