import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SearchScreenState();
  }
}

class SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Container(
          height: 40,
          child: _search('adfasdf'),
        ),
      ),
    );
  }

  TextField _search(String title) {
    return TextField(
      cursorColor: Colors.redAccent,
      decoration: InputDecoration(
        hintText: title,
        fillColor: Colors.grey[300],
        filled: true,
        prefixIcon: Icon(
          Icons.search,
          color: Colors.redAccent,
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(width: 0, style: BorderStyle.none),
          borderRadius: BorderRadius.circular(10.0),
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(width: 0, style: BorderStyle.none),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }

//  TextField search(String title) {
//    return TextField(
//      autofocus: false,
//      minLines: 1,
//      style: TextStyle(decorationColor: Colors.grey.shade200),
//      decoration: InputDecoration(
//        prefixIcon: Icon(Icons.search),
//        fillColor: Colors.grey.shade300,
//        hintText: title,
//        filled: true,
////        contentPadding: EdgeInsets.all(0.0),
//        focusedBorder: UnderlineInputBorder(
//          borderSide: BorderSide(width: 0, style: BorderStyle.none),
//          borderRadius: BorderRadius.circular(10.0),
//        ),
//        border: UnderlineInputBorder(
//          borderSide: BorderSide(width: 0, style: BorderStyle.none),
//          borderRadius: BorderRadius.circular(10.0),
//        ),
//      ),
//      onChanged: (text) {
//        print('代理方法打印：' + text);
//      },
//    );
//  }
}
