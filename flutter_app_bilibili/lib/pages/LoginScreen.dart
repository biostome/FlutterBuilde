import 'package:flutter/material.dart';
import 'package:flutter_app_2/pageItem/forgetpwd_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LoginScreenState();
  }

}

class LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          title: Text(
            '登录',
            style: TextStyle(color: Colors.pink, fontSize: 16),
          ),
          leading: IconButton(
              color: Colors.pink,
              icon: Icon(Icons.close),
              onPressed: () {
                Navigator.pop(context);
              }),
          actions: <Widget>[
            MaterialButton(
              child: Text(
                '忘记密码',
                style: TextStyle(color: Colors.grey),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return forgetpwd_screen();
                  }),
                );
              },
            ),
          ],
        ),
        body: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 5),
              child: Image.asset(
                  'resource/drawable-night-xhdpi-v8/login_picture.png'),
            ),
            Container(
              child: Column(
                children: <Widget>[
                  TextField(
                    cursorColor: Colors.redAccent, //光标颜色
                    decoration: InputDecoration(
                      hintText: '请输入用户名',
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey[400],
                          width: 0.5,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.redAccent,
                          width: 0.5,
                        ),
                      ),
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.redAccent,
                      ),
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: '请输入密码',
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey[400],
                          width: 0.5,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.redAccent,
                          width: 0.5,
                        ),
                      ),
                      prefixIcon: Icon(
                        Icons.work,
                        color: Colors.redAccent,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    height: 44,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Flexible(
                          flex: 1,
                          child: Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: MaterialButton(
                              onPressed: () {},
                              minWidth: 150,
                              elevation: 0,
                              color: Colors.white,
                              child: Text(
                                '注册',
                                style: TextStyle(
                                  color: Colors.grey[900],
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: MaterialButton(
                              onPressed: () {},
                              minWidth: 150,
                              elevation: 0,
                              color: Colors.pink[200],
                              child: Text(
                                '登录',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
