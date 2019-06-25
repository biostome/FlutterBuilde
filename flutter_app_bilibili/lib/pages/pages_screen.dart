import 'package:flutter/material.dart';

class PagesScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return PagesScreenState();
  }
}

class PagesScreenState extends State<PagesScreen> {
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
                    onPressed: () {},
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
                    onPressed: () {},
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
                        onPressed: () {},
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
      children: <Widget>[item('个人中心', 8), item('我的服务', 5)],
    );
  }

  Container item(String title, int count) {
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
                itemCount: count,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisSpacing: 1,
                    crossAxisSpacing: 1,
                    childAspectRatio: 1.8),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.all(0),
                    child: Column(
                      children: <Widget>[
                        MaterialButton(
                          onPressed: () {},
                          child: Column(
                            children: <Widget>[
                              Icon(
                                Icons.clear,
                                size: 30,
                              ),
                              Text('离线缓存 ${index}'),
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
