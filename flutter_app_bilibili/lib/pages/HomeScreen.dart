import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

/// This Widget is the main application widget.
class HomeScreen extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home:  MyFulWidget(),

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
            style: TextStyle(decorationColor: Colors.blue.shade100),
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
}
