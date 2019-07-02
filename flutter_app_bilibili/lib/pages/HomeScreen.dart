import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_swiper/flutter_swiper.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  List<String> _tabs = ['直播', '推荐', '热门'];
  List<Widget> _tabBarViews = [LiveScreen(), RecommendScreen(), HotScreen()];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
      length: _tabs.length,
      child: NestedScrollView(
        headerSliverBuilder: _headerSliverBuilder,
        body: bodyTabBarView(this._tabBarViews),
      ),
    );
  }

  List<Widget> _headerSliverBuilder(
      BuildContext context, bool innerBoxIsScrolled) {
    return <Widget>[
      SliverAppBar(
        automaticallyImplyLeading: true,
        title: TextField(),
//        flexibleSpace: FlexibleSpaceBar(
//          centerTitle: true,
//          background: MaterialButton(
//            onPressed: () {},
//            child: Text('aa'),
//          ),
//        ),
        bottom: new TabBar(
          isScrollable: true,
          tabs: _tabs.map((choice) {
            return new Tab(
              text: choice,
            );
          }).toList(),
        ),

        actions: <Widget>[
          new IconButton(
            // action button
            icon: new Icon(Icons.search),
            onPressed: () {

            },
          ),
        ],
        backgroundColor: Colors.red,
        brightness: Brightness.light,
        iconTheme: ThemeData().primaryIconTheme,
        textTheme: ThemeData().accentTextTheme,
        primary: true,
        titleSpacing: NavigationToolbar.kMiddleSpacing,
        expandedHeight: 100,
        floating: true,
        pinned: true,
        snap: true,
      )
    ];
  }

  /*body*/
  TabBarView bodyTabBarView(List<Widget> tabs) {
    return TabBarView(
      children: tabs,
    );
  }

  /*导航*/
  TabBar bottomAppBar(List<String> tabs) {
    return TabBar(
      tabs: tabs.map(
        (e) {
          return Tab(
            text: e,
          );
        },
      ).toList(),
    );
  }

  /*标题*/
  Widget titleWidget() {
    return Text('home');
  }
}

class LiveScreen extends StatelessWidget {
  List<Widget> imageList = [
    Image.network(
      'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=2726034926,4129010873&fm=26&gp=0.jpg',
      fit: BoxFit.fill,
    ),
    Image.network(
      'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=3485348007,2192172119&fm=26&gp=0.jpg',
      fit: BoxFit.fill,
    ),
    Image.network(
      'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2594792439,969125047&fm=26&gp=0.jpg',
      fit: BoxFit.fill,
    ),
    Image.network(
      'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2594792439,969125047&fm=26&gp=0.jpg',
      fit: BoxFit.fill,
    ),
    Image.network(
      'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=190488632,3936347730&fm=26&gp=0.jpg',
      fit: BoxFit.fill,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(
      padding: EdgeInsets.all(10),
      children: <Widget>[
        Column(
          children: <Widget>[
            swiperView(context),
            palaceView(context),
            line(Colors.grey),
            liveListHeaderView(),
            liveListView()
          ],
        )
      ],
    );
  }

  Widget liveListView() {
    return Container(
      height: 1000,
      color: Colors.grey,
      child: GridView.builder(
        itemCount: 10,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.only(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
//          childAspectRatio: 5/10,
        ),
        itemBuilder: (context, index) {
          return Container(
            color: Colors.green,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.add),
                Text('英雄联盟'),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget liveListHeaderView() {
    return Container(
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            '推荐直播',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          MaterialButton(
            onPressed: () {
              print('换一换');
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  '换一换',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                Icon(
                  Icons.refresh,
                  color: Colors.grey,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget line(Color color) {
    return Container(
      margin: EdgeInsets.only(top: 0, bottom: 0),
      color: color,
      height: 0.5,
    );
  }

  Widget palaceView(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      color: Colors.black,
      height: 151,
      child: GridView.builder(
        itemCount: 10,
        shrinkWrap: true,
        padding: EdgeInsets.only(),
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
//          childAspectRatio: 5/10,
        ),
        itemBuilder: (context, index) {
          return Container(
            color: Colors.green,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.add),
                Text('英雄联盟'),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget swiperView(BuildContext context) {
    return Container(
      height: 140,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Swiper(
          itemCount: 4,
          itemBuilder: (context, index) {
            return imageList[index];
          },
          pagination: SwiperPagination(
            alignment: Alignment.bottomRight,
            margin: const EdgeInsets.only(bottom: 5, right: 5),
            builder: DotSwiperPaginationBuilder(
              color: Colors.white,
              activeColor: Colors.redAccent,
            ),
          ),
          controller: SwiperController(),
          scrollDirection: Axis.horizontal,
          autoplay: true,
          onTap: (index) => print('点击了第$index'),
        ),
      ),
    );
  }
}

class RecommendScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text('推荐');
  }
}

class HotScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text('热门');
  }
}
/*
/// This Widget is the main application widget.
class HomeScreen extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: MyFulWidget(),
    );
  }
}

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
final SnackBar snackBar = const SnackBar(content: Text('Showing Snackbar'));

void openPage(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(
    builder: (BuildContext context) {
      return SecondPage();
    },
  ));
}

class SecondPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MySecondPageStatefulWidget();
  }
}

class MySecondPageStatefulWidget extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second page'),
        backgroundColor: Colors.white,
      ),
      bottomNavigationBar: null,
      body: const Center(
        child: Text(
          'This is the next page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class MyFulWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyFulStateWidget();
  }
}

class MyFulStateWidget extends State<MyFulWidget> {
  @override
  Widget build(BuildContext context) {
    final _isVisible = false;
    int _currentIndex = 0;
    List<Widget> _list = List();

    @override
    void initState() {
      // TODO: implement initState
      super.initState();
    }

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: new Container(
          height: 40,
          child: TextField(
            autofocus: false,
            minLines: 1,
            style: TextStyle(
              decorationColor: Colors.blue.shade100,
            ),
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search),
              fillColor: Colors.blue.shade100,
              hintText: '搜你想要的...',
              filled: true,
              contentPadding: EdgeInsets.all(10.0),
              border: UnderlineInputBorder(
                borderRadius: BorderRadius.circular(10.00),
              ),
            ),
            onChanged: (text) {
              print('代理方法打印：' + text);
            },
          ),
        ),
        leading: IconButton(icon: Icon(Icons.add), onPressed: null),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add_alert),
            tooltip: 'Show Snackbar',
            onPressed: () {
              scaffoldKey.currentState.showSnackBar(snackBar);
            },
          ),
          IconButton(
            icon: const Icon(Icons.navigate_next),
            tooltip: 'Next page',
            onPressed: () {
              openPage(context);
            },
          ),
        ],
      ),
      body: new ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 5),
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      height: 30,
                      width: MediaQuery.of(context).size.width / 6,
                      child: FlatButton(
                        onPressed: () {
                          setState(() {
                            _currentIndex = 0;
                          });
                        },
                        child: new Text('直播'),
                        color: Colors.red,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 1),
                      height: 2,
                      width: 30.0,
                      color: _isVisible ? Colors.pink : Colors.white,
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    Container(
                      height: 30,
                      width: MediaQuery.of(context).size.width / 6,
                      child: FlatButton(
                        onPressed: () {
                          setState(() {
                            _currentIndex = 1;
                          });
                        },
                        child: new Text('推荐'),
                        color: Colors.red,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 1),
                      height: 2,
                      width: 30.0,
                      color: _isVisible ? Colors.pink : Colors.white,
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    Container(
                      height: 30,
                      width: MediaQuery.of(context).size.width / 6,
                      child: FlatButton(
                        onPressed: () {
                          setState(() {
                            _currentIndex = 2;
                          });
                        },
                        child: new Text('追番'),
                        color: Colors.red,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 1),
                      height: 2,
                      width: 30.0,
                      color: _isVisible ? Colors.pink : Colors.white,
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    Container(
                      height: 30,
                      width: MediaQuery.of(context).size.width / 6,
                      child: FlatButton(
                        onPressed: () {
                          setState(() {
                            _currentIndex = 3;
                          });
                        },
                        child: new Text('宝藏'),
                        color: Colors.red,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 1),
                      height: 2,
                      width: 20.0,
                      color: _isVisible ? Colors.pink : Colors.white,
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    Container(
                      height: 30,
                      width: MediaQuery.of(context).size.width / 6,
                      child: FlatButton(
                        onPressed: () {
                          setState(() {
                            _currentIndex = 4;
                          });
                        },
                        child: new Text('故事'),
                        color: Colors.red,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 1),
                      height: 2,
                      width: 20.0,
                      color: _isVisible ? Colors.pink : Colors.white,
                    )
                  ],
                ),
              ],
            ),
          ),
          Container(height: 1, color: Colors.grey),
          Container(
            height: 100,
            child: Padding(
              padding: EdgeInsets.all(5.0),
              child: ClipRRect(
                child: Image.asset(
                  'resource/images/nb.jpeg',
                  height: 180,
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 5, right: 5, top: 5),
            child: SizedBox(
                height: 120,
                child: GridView.builder(
                    itemCount: 10,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 5,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 0,
                        childAspectRatio: 1.3),
                    itemBuilder: (context, index) {
                      return Column(
                        children: <Widget>[Icon(Icons.add), Text('aaa')],
                      );
                    })),
          ),
          Container(
            height: 1,
            color: Colors.grey,
            margin: EdgeInsets.only(top: 1),
          ),
          Container(
            height: 40,
            child: Row(
              children: <Widget>[
                Flexible(
                  flex: 10,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Text(
                          '我的关注',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Text('16小时前'),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 0),
                        child: Text('宁采臣'),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 0),
                        child: Text('直播了电台'),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  child:
                      FlatButton(onPressed: () {}, child: Icon(Icons.search)),
                  flex: 2,
                )
              ],
            ),
          ),
          Container(
            height: 1,
            color: Colors.grey,
            margin: EdgeInsets.only(top: 1),
          ),
          Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  '推荐直播',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Text('换一换')
              ],
            ),
          ),
          SizedBox(
            height: 100,
            child: GridView.builder(
              itemCount: 4,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 0,
                crossAxisSpacing: 0,
                crossAxisCount: 2,
                childAspectRatio: 1.25,
              ),
              itemBuilder: (context, index) {
                return new Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(0),
                        child: new ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          child: Image.asset(
                            'resource/images/nb.jpeg',
                            fit: BoxFit.cover,
                            height: 100.0,
                            width: (MediaQuery.of(context).size.width / 2.0),
                          ),
                        ),
                      ),
                      Text('三局杀'),
                      Text(
                        '其他游戏',
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
//          Expanded(
//            child: Padding(
//              padding: EdgeInsets.only(top: 10),
//              child: GridView.builder(
//                itemCount: 10,
//                physics: NeverScrollableScrollPhysics(),
//                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                  crossAxisCount: 4,
//                  mainAxisSpacing: 0,
//                  crossAxisSpacing: 0,
//                  childAspectRatio: 1.8,
//                ),
//                itemBuilder: (context, index) {
//                  return Padding(
//                    padding: EdgeInsets.all(0),
//                    child: Column(
//                      children: <Widget>[
//                        MaterialButton(
//                          onPressed: () {},
//                          child: Column(
//                            children: <Widget>[
//                              Icon(Icons.add),
//                            ],
//                          ),
//                        ),
//                      ],
//                    ),
//                  );
//                },
//              ),
//            ),
//          )
        ],
      ),
    );
  }
}*/
