import 'package:flutter/material.dart';
import 'package:city_pickers/city_pickers.dart';

class forgetpwd_screen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return forgetpwd_screenState();
  }
}

class forgetpwd_screenState extends State<forgetpwd_screen> {

  String _location;
  String _phoneNumber;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _location = '中国';
  }

  void openPickView() async {
    Result result = await CityPickers.showCityPicker(
      context: context,
    );
    print(result);
    setState(() {
      _location = '中国 ${result.provinceName} ${result.cityName} ${result.areaName}';
    });
  }


  MaterialButton locationButton(String title ) {
    return MaterialButton(
      onPressed: () {
        openPickView();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Text(
              title,
            ),
          ),
        ],
      ),
    );
  }

  TextField phoneNumber(){
    return TextField(
      onChanged: (text){
        _phoneNumber = text;
      },
      style: TextStyle(fontSize: 14),
      decoration: InputDecoration(
        hintText: '请输入常用手机号',
        border: InputBorder.none,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.redAccent,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          '重置密码',
          style: TextStyle(color: Colors.redAccent),
        ),
        actions: <Widget>[
          MaterialButton(
            onPressed: () {},
            child: Text(
              '邮箱找回',
              style: TextStyle(color: Colors.redAccent),
            ),
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.only(top: 10),
        children: <Widget>[
          Container(
            height: 40,
            child: Row(
              children: <Widget>[
                Flexible(
                  flex: 9,
                  child: locationButton(_location),
                ),
                Flexible(
                  child: FlatButton(
                    onPressed: () {},
                    child: Icon(Icons.arrow_forward_ios),
                  ),
                  flex: 1,
                )
              ],
            ),
          ),
          Container(
            color: Colors.grey,
            height: 0.5,
          ),
          Container(
            height: 40,
            child: Row(
              children: <Widget>[
                Flexible(
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Text(
                          '+86',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  child: TextField(
                    style: TextStyle(fontSize: 14),
                    decoration: InputDecoration(
                      hintText: '请输入常用手机号',
                      border: InputBorder.none,
                    ),
                  ),
                  flex: 10,
                )
              ],
            ),
          ),
          Container(
            color: Colors.grey,
            height: 0.5,
          ),
          Container(
            child: Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: MaterialButton(
                color: Colors.pink[200],
                onPressed: () {},
                child: Text(
                  '获取验证码',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
