import 'package:flutter/material.dart';
import 'package:flutter_app_2/pages/SearchScreen.dart';
import 'package:flutter_swiper/flutter_swiper.dart'; // 引入头文件
import 'dart:math';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

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

  Choice _selectedChoice = choices[0]; // The app's "state".

  void _select(Choice choice) {
    setState(() {
      // Causes the app to rebuild with the new _selectedChoice.
      _selectedChoice = choice;
    });
  }

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
    return DefaultTabController(
      length: choices.length,
      initialIndex: 0,
      child: Scaffold(
        appBar: _appBar(context),
        body: _body(), //_body(context),
      ),
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

  NestedScrollView _body() {
    return NestedScrollView(
      headerSliverBuilder: _headerSliverBuilder,
      body: TabBarView(
        children: choices.map(
          (Choice choice) {
            return new Padding(
              padding: const EdgeInsets.all(10.0),
//              child: new ChoiceCard(choice: choice),
              child: StaggeredGridView.countBuilder(
                controller: _scrollController,
                itemCount: 100,
                physics: AlwaysScrollableScrollPhysics(),
                primary: false,
                crossAxisCount: 4,
                mainAxisSpacing: 4.0,
                crossAxisSpacing: 4.0,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Container(
                    color: Colors.redAccent,
                    height: Random().nextInt(100).toDouble(),
                  );
                },
                staggeredTileBuilder: (index) => StaggeredTile.fit(2),
              ),
            );
          },
        ).toList(),
      ),
    );
  }

  List<Widget> _headerSliverBuilder(
      BuildContext context, bool innerBoxIsScrolled) {
    return <Widget>[
      SliverAppBar(
        //1.在标题左侧显示的一个控件，在首页通常显示应用的 logo；在其他界面通常显示为返回按钮
//        leading: Icon(_selectedChoice.icon),

        //2. ? 控制是否应该尝试暗示前导小部件为null
//        automaticallyImplyLeading: true,

        //3.当前界面的标题文字
//        title: Text(_selectedChoice.title),
        //4.一个 Widget 列表，代表 Toolbar 中所显示的菜单，对于常用的菜单，通常使用 IconButton 来表示；
        //对于不常用的菜单通常使用 PopupMenuButton 来显示为三个点，点击后弹出二级菜单

        //5.一个显示在 AppBar 下方的控件，高度和 AppBar 高度一样，
        // 可以实现一些特殊的效果，该属性通常在 SliverAppBar 中使用
        flexibleSpace: FlexibleSpaceBar(
          centerTitle: true,
          collapseMode: CollapseMode.pin,
          background: Container(
            margin: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                Container(
                  height: 44,
                  child: Padding(
                    padding: EdgeInsets.all(0),
                    child: searchBar(context, '搜"潇洒返碎片"返奖抽到手抽筋'),
                  ),
                  margin: EdgeInsets.only(top: 10),
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
              ],
            ),
          ),
        ),

        bottom: ColoredTabBar(
          Colors.white,
          new TabBar(
            indicatorColor: Colors.redAccent,
            isScrollable: true,
            labelColor: Colors.black,
            tabs: choices.map((Choice choice) {
              return new Tab(
                text: choice.title,
//              icon: new Icon(choice.icon),
              );
            }).toList(),
          ),
        ),

        // 当tabBarView的z轴>0时，tabBar下方的阴影大小
        elevation: 10,

        //APP bar 的颜色，默认值为 ThemeData.primaryColor。改值通常和下面的三个属性一起使用
        backgroundColor: Colors.white,

        //App bar 的亮度，有白色和黑色两种主题，默认值为 ThemeData.primaryColorBrightness
        brightness: Brightness.light,

        //App bar 上图标的颜色、透明度、和尺寸信息。默认值为 ThemeData().primaryIconTheme
        iconTheme: IconThemeData(color: Colors.green, opacity: 1),

        //App bar 上的文字主题。默认值为 ThemeData（）.primaryTextTheme
        textTheme: ThemeData().accentTextTheme,

        //此应用栏是否显示在屏幕顶部
        primary: true,

        //标题是否居中显示，默认值根据不同的操作系统，显示方式不一样,true居中 false居左
        centerTitle: true,

        //横轴上标题内容 周围的间距
        titleSpacing: 0,

        //展开高度
        expandedHeight: 44.0 + 150 + 70 + 200,

        //是否随着滑动隐藏标题
        floating: true,

        //tab 是否固定在顶部
        pinned: true,

        //吸附滑动
        snap: false,
      )
    ];
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

class Choice {
  const Choice({this.title, this.icon});

  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: '推荐', icon: Icons.directions_car),
  const Choice(title: '商品', icon: Icons.directions_bike),
  const Choice(title: '美图', icon: Icons.directions_boat),
  const Choice(title: '情报', icon: Icons.directions_bus),
//  const Choice(title: 'Train', icon: Icons.directions_railway),
//  const Choice(title: 'Walk', icon: Icons.directions_walk),
];

ScrollController _scrollController = new ScrollController();

class ChoiceCard extends StatelessWidget {
  const ChoiceCard({Key key, this.choice}) : super(key: key);

  final Choice choice;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    final TextStyle textStyle = Theme.of(context).textTheme.display1;

    return StaggeredGridView.countBuilder(
      controller: _scrollController,
      itemCount: 100,
      physics: AlwaysScrollableScrollPhysics(),
      primary: false,
      crossAxisCount: 4,
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Container(
          width: width / 2 - 20,
          height: Random().nextInt(100).toDouble(),
          padding: EdgeInsets.all(5),
          color: Colors.redAccent,
        );
      },
      staggeredTileBuilder: (index) => StaggeredTile.fit(2),
    );

    Widget _itemBuilder(context, index) {
      return Container(
        width: width / 2 - 20,
        height: Random().nextInt(100).toDouble(),
        padding: EdgeInsets.all(5),
        color: Colors.redAccent,
        child: MaterialButton(
          padding: EdgeInsets.only(left: 10, right: 10),
          color: Colors.green,
          onPressed: () {},
          child: Column(
            children: <Widget>[],
          ),
        ),
      );
    }

/*
    /*一个渐变颜色的正方形集合*/
    List<Widget> Boxs() => List.generate(10, (index) {
          return Container(
            width: width / 2 - 20,
            height: Random().nextInt(100).toDouble() + 50,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Colors.orangeAccent,
                Colors.orange,
                Colors.deepOrange
              ]),
            ),
            child: Text(
              "${index}",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        });
        */
/*
    return Wrap(
      spacing: 5,
      runSpacing: 5,
      runAlignment: WrapAlignment.start,
      crossAxisAlignment: WrapCrossAlignment.start,
      alignment: WrapAlignment.spaceBetween,
      verticalDirection: VerticalDirection.down,
//      children: Boxs(),
      children: <Widget>[
        _itemBuilder(),
        _itemBuilder(),
        _itemBuilder(),
        _itemBuilder(),
        _itemBuilder(),
      ],
    );
    */
/*
    /*一个带渐变颜色的正方形*/
    Widget Box(index) => Container(
          width: boxSize,//width / 2 - 20,
          height: boxSize,//Random().nextInt(100).toDouble() + 50,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.orangeAccent,
                Colors.orange,
                Colors.deepOrange,
              ],
            ),
          ),
          child: Text(
            index.toString(),
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        );

    return Flow(
      delegate: MyFlowDelegate(),
      children: List.generate(10, (index) {
        return Box(index);
      }),
    );
    */
/*
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) {
        return _itemBuilder(context, index);
        return new Card(
          color: Colors.yellow,
          child: Center(
            child: ListView(
              children: <Widget>[
                _itemBuilder(),
              ],
            ),
          ),
        );
      },
    );
    */
  }
}

double boxSize = 40.0;

class ColoredTabBar extends Container implements PreferredSizeWidget {
  ColoredTabBar(this.color, this.tabBar);

  final Color color;
  final TabBar tabBar;

  @override
  Size get preferredSize => tabBar.preferredSize;

  @override
  Widget build(BuildContext context) => Container(
        color: color,
        child: tabBar,
      );
}
