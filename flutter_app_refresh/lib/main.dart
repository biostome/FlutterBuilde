import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  bool isLoading = false;
  ScrollController _scrollController = new ScrollController();

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  List<int> items = List.generate(16, (i) => i);

  Future<Null> _handleRefresh() async {
    await Future.delayed(Duration(seconds: 5), () {
      print('refresh');
      setState(() {
        items.clear();
        items = List.generate(40, (i) => i);
        return null;
      });
    });
  }

  Future _getMoreData() async {
    if (!isLoading) {
      isLoading = true;
      List<int> newEntries =
          await mokeHttpRequest(items.length, items.length + 10);
      setState(() {
        items.addAll(newEntries);
        isLoading = false;
      });
    }
  }

  Future<List<int>> mokeHttpRequest(int from, int to) async {
    return Future.delayed(Duration(seconds: 1), () {
      return List.generate(to - from, (i) => i + from);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        print('loadMore');
        _getMoreData();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
//      body: Center(
//        child: Column(
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            Text(
//              'You have pushed the button this many times:',
//            ),
//            Text(
//              '$_counter',
//              style: Theme.of(context).textTheme.display1,
//            ),
//          ],
//        ),
//      ),
      body: new RefreshIndicator(
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            if (index == items.length) {
              return Container(
                child: Center(
                  child: Text('加载中...'),
                ),
                color: Colors.white70,
              );
            } else {
              return ListTile(
                title: Text("Index$index"),
              );
            }
          },
          controller: _scrollController,
        ),
        onRefresh: _handleRefresh,
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
