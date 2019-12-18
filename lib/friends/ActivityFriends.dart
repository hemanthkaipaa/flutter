import 'package:flutter/material.dart';

class ActivityFriends extends StatefulWidget{
  final AnimationController animationController;

  const ActivityFriends({Key key, this.animationController}) : super(key: key);

  @override
  State<StatefulWidget> createState() => new _FriendsRootWidgetState();

}

class _FriendsRootWidgetState extends State<ActivityFriends> with TickerProviderStateMixin{
  var scrollController =ScrollController();
  List<FriendsBean> list = new List<FriendsBean>();
  @override
  void initState() {
    computeList();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      controller: scrollController,
      padding: EdgeInsets.only(
        top: AppBar().preferredSize.height +
            MediaQuery.of(context).padding.top +
            24,
        bottom: 62 + MediaQuery.of(context).padding.bottom,

      ),
      itemCount: list.length,
      scrollDirection: Axis.vertical,
      itemBuilder: (context,i){
        return itemRow(
          i
        );
      },
    );
  }

  Widget itemRow(i){

    return Container(
      child: Column(
        children: <Widget>[
          Text(list[i].firstName),
        ],
      ),
    );

  }

  computeList(){

    list.add(new FriendsBean("hemanth", "kaipa"));
    list.add(new FriendsBean("hemanth", "reddy"));
    list.add(new FriendsBean("hemanth", "HK"));
    list.add(new FriendsBean("Reddy", "HK"));
    list.add(new FriendsBean("Reddy", "Kaipa"));
    list.add(new FriendsBean("Kaipa", "Reddy"));
    return list;
  }
}

class FriendsBean{
  var firstName;
  var secondName;
  var image;

  FriendsBean(this.firstName, this.secondName);

  FriendsBean.all(this.firstName, this.secondName, this.image);


}