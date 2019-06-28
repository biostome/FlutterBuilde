import 'package:flutter/material.dart';
import 'pages/HomeScreen.dart';
import 'pages/DynamicScreen.dart';
import 'pages/ShoppingScreen.dart';
import 'pages/PagesScreen.dart';
import 'pages/ChannelScreen.dart';

class BottomNavigationWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return BottomNavigationWidgetState();
  }
}

class BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  final _bottomNavigationColor = Colors.blue;
  int _currentIndex = 0;
  List<Widget> _list = List();

  @override
  void initState() {
    // TODO: implement initState
    _list
      ..add(HomeScreen())
      ..add(ChannelScreen())
      ..add(DynamicScreen())
      ..add(ShoppingScreen())
      ..add(PagesScreen());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: _list[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
//                color: _bottomNavigationColor,
            ),
            title: Text(
              '首页',
//                style: TextStyle(color: _bottomNavigationColor),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.change_history,
//                color: _bottomNavigationColor,
            ),
            title: Text(
              '频道',
//                style: TextStyle(color: _bottomNavigationColor),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.airplanemode_active,
//                color: _bottomNavigationColor,
            ),
            title: Text(
              '动态',
//                style: TextStyle(color: _bottomNavigationColor),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings_remote,
//              color: _bottomNavigationColor,
            ),
            title: Text(
              '会员购',
//              style: TextStyle(color: _bottomNavigationColor),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.room_service,
//                color: _bottomNavigationColor,
            ),
            title: Text(
              '我的',
//                style: TextStyle(color: _bottomNavigationColor),
            ),
          ),
        ],
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.redAccent,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: TextStyle(color: Colors.redAccent),
        unselectedLabelStyle: TextStyle(color: Colors.grey),
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
