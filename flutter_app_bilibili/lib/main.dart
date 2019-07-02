import 'package:flutter/material.dart';
import 'bottom_navigation_widget.dart';
import 'pages/LoginScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final PrimaryColor = const Color(0xFF151026);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      color: Colors.pink,
      theme: ThemeData(
        bottomAppBarColor: Colors.red,
        selectedRowColor: Colors.red,
        primaryColor: Colors.pink[800],
        appBarTheme: AppBarTheme(
          color: Colors.blue,
          actionsIconTheme: IconThemeData(color: Colors.redAccent),
        ),
      ),
      routes: {
        '/login_screen': (BuildContext centext) => LoginScreen(),
      },
      home: BottomNavigationWidget(),
    );
  }
}
