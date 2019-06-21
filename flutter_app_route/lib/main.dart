import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light(),
      home: Screen0(),
      // 如果要通过路由名称跳转，请在程序开始处构建路由
      routes: {
        '/screen1': (BuildContext context) => new Screen1(),
        '/screen2': (BuildContext context) => new Screen2(),
        '/screen3': (BuildContext context) => new Screen3(),
      },
    );
  }
}

class Screen0 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new Screen0State();
  }
}

class Screen0State extends State<Screen0> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    void nextPage() {
      Navigator.of(context).pushNamed('/screen1');
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('screen0'),
      ),
      body: Center(
        child: FlatButton.icon(
            onPressed: nextPage,
            icon: Icon(Icons.airplay),
            label: Text('nextPage')),
      ),
    );
  }
}

class Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('screen1'),
      ),
      body: Center(
        child: FlatButton.icon(
            onPressed: () {
              /****方式1***/

              //普通跳转
//              Navigator.of(context).pushNamed('/screen1');


              /****方式2***/
              // 替换当前界面，并且有跳转到下一页的动画
              // 即比如当前从页面0进入页面1，
              // 在页面1使用 Navigator.of(context).pushReplacementNamed('/screen2');
              // 进入页面2，当进入了页面2后，页面1将执行dispose方法，此时在页面2返回时，会回到页面0.
              // 通过这种方式跳转，官方暂时没有标准的传值方案
//              Navigator.of(context).pushReplacementNamed('/screen2');


              /****方式3***/
              // 这个用法跟方式2相同，只是路由的传递有差别.
              // 上方的是传递路由名称（页面对应的名称，需在入口定义（本文第一点）），
              // 而后者只需new对应页面即可，而且可以传递参数。
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  // 给Screen2传值
                  builder: (BuildContext context) => Screen2(username: 'lalalala',),
                ),
              );

              /****方式4***/
              // 先pop，然后自动push
              // 指将当前页面pop
              // 然后跳转到制定页面（将当前路由弹出导航器，并将命名路由推到它的位置。）
//              Navigator.popAndPushNamed(context, '/screen2');

              /****方式5***/
              // 删除路由路线中的所有页面，保留根页面和push的页面，
//              Navigator.pushNamedAndRemoveUntil(
//                context,
//                '/screen3',
//                ModalRoute.withName('/'),
//              );

              /****方式6***/
              // 删除路由路线中的所有页面，保留根页面和push的页面
              // (Route<dynamic> route) => false 确保删除路途的所有页面，并且只保留当前页面为根
//              Navigator.pushNamedAndRemoveUntil(
//                context,
//                '/screen3',
//                (Route<dynamic> route) => false,
//              );
            },
            icon: Icon(Icons.airplay),
            label: Text('nextPage')),
      ),
    );
  }
}

class Screen2 extends StatelessWidget {

  /*收Screen1过来的值*/
  final String username;

  Screen2({Key key,this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(username),
      ),
      body: Center(
        child: FlatButton.icon(
            onPressed: () {
              // 跳转到Screen3，并拿到Screen3回传的值
              Navigator.pushNamed(context, '/screen3').then((ov){
                print(ov);
              });
            },
            icon: Icon(Icons.airplay),
            label: Text('nextPage')),
      ),
    );
  }
}

class Screen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('screen3'),
      ),
      body: Center(
        child: FlatButton.icon(
            onPressed: () {
              // 回传值
              Navigator.of(context).pop('result');
            },
            icon: Icon(Icons.airplay),
            label: Text('pop')),
      ),
    );
  }
}
