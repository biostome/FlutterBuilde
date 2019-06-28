import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class vip_screen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return vip_screenState();
  }
}

class vip_screenState extends State<vip_screen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
//    return WebviewScaffold(
//      url: 'http://www.baidu.com',
//      appBar: AppBar(
//        title: Text('vip page'),
//      ),
//      withZoom: true,
//      withLocalStorage: true,
//    );
    return Scaffold(
      appBar: AppBar(
        title: Text('vip page'),
      ),
    );
  }
}
