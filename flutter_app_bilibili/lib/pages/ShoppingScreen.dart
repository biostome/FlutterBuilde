import 'package:flutter/material.dart';
import 'package:flutter_app_2/pages/SearchScreen.dart';
import 'package:flutter_swiper/flutter_swiper.dart'; // 引入头文件

class ShoppingScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ShoppingScreenState();
  }
}

class ShoppingScreenState extends State<ShoppingScreen> {
  List<Widget> imageList = List();
  TabController _tabController; //需要定义一个Controller
  List tabs = ["新闻", "历史", "图片"];

  @override
  void initState() {
    imageList
      ..add(Image.network(
        'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=2726034926,4129010873&fm=26&gp=0.jpg',
        fit: BoxFit.fill,
      ))
      ..add(Image.network(
        'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=3485348007,2192172119&fm=26&gp=0.jpg',
        fit: BoxFit.fill,
      ))
      ..add(Image.network(
        'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2594792439,969125047&fm=26&gp=0.jpg',
        fit: BoxFit.fill,
      ))
      ..add(Image.network(
        'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=190488632,3936347730&fm=26&gp=0.jpg',
        fit: BoxFit.fill,
      ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: _appBar(context),
      body: _body(context),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      title: Text(
        '会员购',
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  ListView _body(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(top: 10, left: 10, right: 10),
      children: <Widget>[
        Container(
          height: 44,
          child: Padding(
            padding: EdgeInsets.all(0),
            child: searchBar(context, '搜"潇洒返碎片"返奖抽到手抽筋'),
          ),
        ),
        Container(
          height: 150,
          color: Colors.blue,
          child: _categoryGridView(),
          margin: EdgeInsets.only(top: 10),
        ),
        Container(
          color: Colors.green,
          child: _top(),
          height: 70,
          margin: EdgeInsets.only(top: 10),
        ),
        _firstSwiperView(context),
        Container(
          height: 80,
          child: TabBar(
            controller: _tabController
            tabs: tabs.map((e) => Tab(text: e)).toList(),
          ),
        )
        //DefaultTabController
        //TabBarView
        //TabBar
      ],
    );
  }

  void openSearchScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (BuildContext context) {
        return SearchScreen();
      }),
    );
  }

  MaterialButton searchBar(BuildContext context, String placehold) {
    return MaterialButton(
      onPressed: () {
        openSearchScreen(context);
      },
      clipBehavior: Clip.none,
      color: Colors.grey[300],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      elevation: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.search,
            size: 20,
            color: Colors.redAccent,
          ),
          Text(
            '  ' + placehold,
            style: TextStyle(color: Colors.grey[700]),
          )
        ],
      ),
    );
  }

  GridView _categoryGridView() {
    return GridView.builder(
      itemCount: 8,
      padding: EdgeInsets.only(top: 10, bottom: 10),
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 0,
        crossAxisSpacing: 0,
        crossAxisCount: 4,
        childAspectRatio: 1.3,
      ),
      itemBuilder: (context, index) {
        return Column(
          children: <Widget>[
            Icon(Icons.mobile_screen_share),
            Text('手办'),
          ],
        );
      },
    );
  }

  Row _top() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Flexible(
          flex: 1,
          child: Container(
            color: Colors.pink,
            child: Padding(
              padding: EdgeInsets.only(left: 0, right: 5),
              child: Image.asset('resource/images/nb.jpeg'),
            ),
          ),
        ),
        Flexible(
          flex: 1,
          child: Container(
            color: Colors.pink,
            child: Padding(
              padding: EdgeInsets.only(left: 2.5, right: 2.5),
              child: Image.asset('resource/images/nb.jpeg'),
            ),
          ),
        ),
        Flexible(
          flex: 1,
          child: Container(
            color: Colors.pink,
            child: Padding(
              padding: EdgeInsets.only(left: 5, right: 0),
              child: Image.asset('resource/images/nb.jpeg'),
            ),
          ),
        ),
      ],
    );
  }

  Widget _firstSwiperView(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10),
//      width: MediaQuery.of(context).size.width,
      height: 100,
      child: Swiper(
        itemCount: 4,
        itemBuilder: _swiperBuilder,
        pagination: SwiperPagination(
          alignment: Alignment.bottomCenter,
          margin: const EdgeInsets.only(bottom: 5),
          builder: DotSwiperPaginationBuilder(
            color: Colors.black54,
            activeColor: Colors.white,
          ),
        ),
        controller: SwiperController(),
        scrollDirection: Axis.horizontal,
        autoplay: true,
        onTap: (index) => print('点击了第$index'),
      ),
    );
  }

  Widget _swiperBuilder(BuildContext context, int index) {
    return (imageList[index]);
  }
}
