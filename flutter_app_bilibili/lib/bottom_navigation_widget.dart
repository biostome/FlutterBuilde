import 'package:flutter/material.dart';
import 'pages/home_screen.dart';
import 'pages/email_screen.dart';
import 'pages/airplay_screen.dart';
import 'pages/pages_screen.dart';

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
      ..add(EmailScreen())
      ..add(AirplayScreen())
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
                color: _bottomNavigationColor,
              ),
              title: Text(
                'Home',
                style: TextStyle(color: _bottomNavigationColor),
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.email,
                color: _bottomNavigationColor,
              ),
              title: Text(
                'Email',
                style: TextStyle(color: _bottomNavigationColor),
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.airplay,
                color: _bottomNavigationColor,
              ),
              title: Text(
                'Airplay',
                style: TextStyle(color: _bottomNavigationColor),
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.pages,
                color: _bottomNavigationColor,
              ),
              title: Text(
                'Pages',
                style: TextStyle(color: _bottomNavigationColor),
              )),
        ],
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.shifting,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
