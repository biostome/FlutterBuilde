import 'package:flutter/material.dart';
import 'vip_screen.dart';
import 'package:flutter_app_2/pages/RegisterScreen.dart';

class PagesModel {
  final String title;
  final Icon icon;

  PagesModel({
    this.title,
    this.icon,
  });
}

class PagesScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return PagesScreenState();
  }
}

class PagesScreenState extends State<PagesScreen> {
  List<PagesModel> _listCenter = List();
  List<PagesModel> _myServer = List();

  @override
  void initState() {
    // TODO: implement initState

    _listCenter
      ..add(
        PagesModel(
          title: '离线缓存',
          icon: Icon(
            Icons.work,
            color: Colors.redAccent,
            size: 30,
          ),
        ),
      )
      ..add(
        PagesModel(
          title: '历史记录',
          icon: Icon(
            Icons.email,
            color: Colors.redAccent,
            size: 30,
          ),
        ),
      )
      ..add(
        PagesModel(
          title: '我的收藏',
          icon: Icon(
            Icons.remove,
            color: Colors.redAccent,
            size: 30,
          ),
        ),
      )
      ..add(
        PagesModel(
          title: '我的关注',
          icon: Icon(
            Icons.title,
            color: Colors.redAccent,
            size: 30,
          ),
        ),
      )
      ..add(
        PagesModel(
          title: '稍后再看',
          icon: Icon(
            Icons.youtube_searched_for,
            color: Colors.redAccent,
            size: 30,
          ),
        ),
      )
      ..add(
        PagesModel(
          title: 'B币钱包',
          icon: Icon(
            Icons.unarchive,
            color: Colors.redAccent,
            size: 30,
          ),
        ),
      )
      ..add(
        PagesModel(
          title: '会员购中心',
          icon: Icon(
            Icons.image,
            color: Colors.redAccent,
            size: 30,
          ),
        ),
      )
      ..add(
        PagesModel(
          title: '直播中心',
          icon: Icon(
            Icons.offline_bolt,
            color: Colors.redAccent,
            size: 30,
          ),
        ),
      );

    _myServer
      ..add(
        PagesModel(
          title: '青少年模式',
          icon: Icon(
            Icons.print,
            color: Colors.blue,
            size: 30,
          ),
        ),
      )
      ..add(
        PagesModel(
          title: '大会员',
          icon: Icon(
            Icons.account_box,
            color: Colors.blue,
            size: 30,
          ),
        ),
      )
      ..add(
        PagesModel(
          title: '看视频免流',
          icon: Icon(
            Icons.score,
            color: Colors.blue,
            size: 30,
          ),
        ),
      )
      ..add(
        PagesModel(
          title: '创作学院',
          icon: Icon(
            Icons.dashboard,
            color: Colors.blue,
            size: 30,
          ),
        ),
      )
      ..add(
        PagesModel(
          title: '我的客服',
          icon: Icon(
            Icons.favorite,
            color: Colors.blue,
            size: 30,
          ),
        ),
      );

    super.initState();
  }

  void openVipScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (BuildContext context) {
        return vip_screen();
      }),
    );
  }

  void openLoginScreen(_) {
    Navigator.pushNamed(context, '/login_screen');
  }

  void openRegisterScreen(_) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext centext) {
          return RegisterScreen();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          MaterialButton(
            minWidth: 25,
            height: 25,
            onPressed: () {},
            child: Image.asset(
              'resource/images/ic_scan.png',
              fit: BoxFit.fill,
              width: 25,
              height: 25,
            ),
          ),
          MaterialButton(
            minWidth: 25,
            height: 25,
            onPressed: () {},
            child: Image.asset(
              'resource/images/ic_scan.png',
              fit: BoxFit.fill,
              width: 25,
              height: 25,
            ),
          ),
          MaterialButton(
            minWidth: 25,
            height: 25,
            onPressed: () {},
            child: Image.asset(
              'resource/images/ic_scan.png',
              fit: BoxFit.fill,
              width: 25,
              height: 25,
            ),
          ),
        ],
      ),
      body: Container(
        color: Colors.grey[200],
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.white,
              height: 140,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  MaterialButton(
                    color: Colors.grey.shade300,
                    minWidth: 140,
                    height: 40,
                    child: Text('注册'),
                    shape: StadiumBorder(),
                    padding: EdgeInsets.only(right: 10, left: 10),
                    onPressed: () {
                      openRegisterScreen(context);
                    },
                  ),
                  MaterialButton(
                    color: Colors.pink[300],
                    minWidth: 140,
                    height: 40,
                    child: Text(
                      '登录',
                      style: TextStyle(color: Colors.white),
                    ),
                    shape: StadiumBorder(),
                    onPressed: () {
                      openLoginScreen(context);
                    },
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.grey[300],
              height: 1,
            ),
            Container(
              color: Colors.white,
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      color: Colors.white,
                      child: MaterialButton(
                        onPressed: () {
                          openVipScreen(context);
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(left: 0),
                                  child: Text(
                                    '我的大会员',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.pink[300],
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 0),
                                  child: Text(
                                    ' 了解更多权益',
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(left: 0),
                                  child: Text(
                                    '登录畅看番剧国创',
                                    style: TextStyle(
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Icon(Icons.arrow_right)
                ],
              ),
            ),
            //不强制子组件填满可用空间的Flexible。
            //强制子组件填满可用空间的Expanded。
            Expanded(child: listView()),
          ],
        ),
      ),
    );
  }

  ListView listView() {
    return ListView(
      children: <Widget>[item('个人中心', _listCenter), item('我的服务', _myServer)],
    );
  }

  Container item(String title, List<PagesModel> models) {
    return Container(
      color: Colors.white,
      height: 190,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            color: Colors.grey[200],
            height: 10,
          ),
          Container(
            height: 40,
            child: Padding(
              padding: EdgeInsets.only(left: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[Text(title)],
              ),
            ),
          ),
          Container(
            color: Colors.grey[200],
            height: 1,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: 10),
              child: GridView.builder(
                itemCount: models.length,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisSpacing: 0,
                  crossAxisSpacing: 0,
                  childAspectRatio: 1.8,
                ),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.all(0),
                    child: Column(
                      children: <Widget>[
                        MaterialButton(
                          onPressed: () {},
                          child: Column(
                            children: <Widget>[
                              models[index].icon,
                              Text('${models[index].title}'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
