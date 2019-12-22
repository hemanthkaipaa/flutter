import 'package:flutter/material.dart';
import 'package:testdrive/utils/AppTheme.dart';
import 'package:testdrive/utils/GlobalUtils.dart';

class ActivityFriends extends StatefulWidget {
  final AnimationController animationController;
  final Animation mainScreenAnimation;

  const ActivityFriends({Key key, this.animationController, this.mainScreenAnimation}) : super(key: key);

  @override
  State<StatefulWidget> createState() => new _FriendsRootWidgetState();
}

class _FriendsRootWidgetState extends State<ActivityFriends>
    with TickerProviderStateMixin {
  var scrollController = ScrollController();
  List<FriendsBean> list = new List<FriendsBean>();
  AnimationController animationController;

  @override
  void initState() {
    computeList();
    animationController = AnimationController(
        duration: Duration(milliseconds: 600), vsync: this);
    super.initState();
  }
  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
  Future<bool> getData() async {
    await Future.delayed(const Duration(milliseconds: 50));
    return true;
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FutureBuilder(
      future: getData(),
      builder: (context,snapshot){
        if(!snapshot.hasData){
          return SizedBox();
        }else{
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
            itemBuilder: (context, i) {
              var count = list.length;
              var animation = Tween(begin: 0.0, end: 1.0).animate(
                  CurvedAnimation(
                      parent: animationController,
                      curve: Interval((1 / count) * i, 1.0,
                          curve: Curves.fastOutSlowIn)));
              animationController.forward();
              return FriendsView(animation: animation,animationController: animationController,friendsBean: list[i]);
            },
          );
        }
      }
    );
  }

  computeList() {
    list.add(new FriendsBean.all("hemanth", "kaipa",'assets/icons/boy.png',"10000","324","1"));
    list.add(new FriendsBean.all("hemanth", "reddy",'assets/icons/boy.png',"12211","232","2"));
    list.add(new FriendsBean.all("hemanth", "HK",'assets/icons/boy.png',"234235","322","3"));
    list.add(new FriendsBean.all("Reddy", "HK",'assets/icons/boy.png',"3453462","343","4"));
    list.add(new FriendsBean.all("Reddy", "Kaipa",'assets/icons/boy.png',"23432423","333","5"));
    list.add(new FriendsBean.all("Kaipa", "Reddy",'assets/icons/boy.png',"232222","324","6"));
    list.add(new FriendsBean.all("AK", "Reddy",'assets/icons/boy.png',"2122","225","7"));
    list.add(new FriendsBean.all("BK", "Reddy",'assets/icons/boy.png',"559","22","8"));
    list.add(new FriendsBean.all("CK", "Reddy",'assets/icons/boy.png',"5535","555","9"));
    list.add(new FriendsBean.all("DJ", "Reddy",'assets/icons/boy.png',"83838","566","10"));
    return list;
  }
}

class FriendsBean {
  String firstName;
  String secondName;
  String imagePath;
  String totalCoins;
  String totalSteps;
  String currentRank;
  FriendsBean(this.firstName, this.secondName);
  FriendsBean.all(this.firstName, this.secondName,this.imagePath,this.totalSteps,this.totalCoins,this.currentRank);
}

class FriendsView extends StatelessWidget {
  final Animation animation;
  final AnimationController animationController;
  final FriendsBean friendsBean;

  const FriendsView(
      {Key key, this.animation, this.animationController, this.friendsBean})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AnimatedBuilder(
        animation: animationController,
        builder: (BuildContext context, Widget child) {
          return FadeTransition(
              opacity: animation,
              child: new Transform(
                transform: new Matrix4.translationValues(
                    100 * (1.0 - animation.value), 0.0, 0.0),
                child: SizedBox(
                  width: double.infinity,
                  child: Stack(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 32,left: 8,right: 8,bottom: 16),
                        child: Container(
                          width: double.infinity,
                          height: 150,
                          decoration: BoxDecoration(
                            boxShadow:<BoxShadow>[
                              BoxShadow(
                                color: HexColor("#FFB295"),
                                blurRadius: 8.0,
                              )
                            ],
                            gradient: LinearGradient(
                              colors: [
                                HexColor("#FA7D82"),
                                HexColor("#FFB295"),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight
                            ),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(54),
                              bottomLeft: Radius.circular(8),
                              bottomRight: Radius.circular(8)
                            )
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(top: 54,left: 16,right: 16,bottom: 8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  friendsBean.firstName,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: AppTheme.fontName,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    letterSpacing: 0.2,
                                    color: AppTheme.white
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.only(top: 8, bottom: 8),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            friendsBean.totalSteps+("\n")+friendsBean.totalCoins,
                                            style: TextStyle(
                                              fontFamily: AppTheme.fontName,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12,
                                              letterSpacing: 0.2,
                                              color: AppTheme.white,
                                            ),
                                          )
                                        ],
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: <Widget>[
                                    Text(
                                      friendsBean.currentRank,
                                      style: TextStyle(
                                        fontFamily: AppTheme.fontName,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 24,
                                        letterSpacing: 0.2,
                                        color: AppTheme.white,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 4, bottom: 3),
                                    ),
                                    Text(
                                      "Rank",
                                      style: TextStyle(
                                        fontFamily:
                                        AppTheme.fontName,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 10,
                                        letterSpacing: 0.2,
                                        color: AppTheme.white,

                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        left: 0,
                        child: Container(
                          width: 84,
                          height: 84,
                          decoration: BoxDecoration(
                            color: AppTheme.nearlyWhite.withOpacity(0.2),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        left: 8,
                        child: SizedBox(
                          width: 80,
                          height: 80,
                          child: Image.asset(friendsBean.imagePath),
                        ),
                      )
                    ],
                  ),
                ),
              ));
        });
  }
}
