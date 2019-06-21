# flutter_app_route

A new Flutter application.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

版权声明：本文为博主原创文章，转载请注明出处！juejin.im/post/5be2d6…
转眼接触Flutter也有个多月了，项目也在算是上线了（一把辛酸一把泪啊），趁这几天有点时间，赶紧整理了一波，也是第一次在掘金发文，后续会继续保持更新的，如果觉得还行，希望能点点赞啥的，哈哈！
今天跟大家聊聊Flutter中非常重要的一个东西：路由
这是不得不好好研究和学习的一个知识点，用的不好会让你非常的头疼，也会给你造成非常多的问题。

第一点：push使用
-
```dart
1.pushNamed——Navigator.of(context).pushNamed('routeName');
```
此种方法只是简单的将我们需要进入的页面push到栈顶，以此来显示当前页面,其参数是一个字符串类型，传入的是页面对应的路由名称 该路由名称需要在程序主入口中进行定义。定义方法为：
```dart
void main() {
    runApp(
        new MaterialApp(
        home: new Screen1(),
        routes: <String, WidgetBuilder> {
                '/screen1': (BuildContext context) => new Screen1(),
                '/screen2' : (BuildContext context) => new Screen2(),
                '/screen3' : (BuildContext context) => new Screen3(),
                },
        )
    );
}

```
使用：Navigator.of(context).pushNamed('/screen1'); 直接进入screen1页面（每次都将新建一个新的页面）
```
2.1 pushReplacementNamed——Navigator.of(context).pushReplacementNamed('/screen4');

```
指把当前页面在栈中的位置替换成跳转的页面（替换导航器的当前路由，通过推送路由[routeName]），当新的页面进入后，之前的页面将执行dispose方法。 下面为官方说明：

>Replace the current route of the navigator that most tightly encloses the
>given context by pushing the route named [routeName] and then disposing
>the previous route once the new route has finished animating in.

即比如当前从页面1进入页面2，在页面2使用
Navigator.of(context).pushReplacementNamed('/screen3');进入页面3，当进入了页面3后，页面2将执行dispose方法，此时在页面3返回时，会回到页面1.
使用情况：例如
从SplashScreen到HomeScreen。它应该只显示一次，用户不应该再从主屏幕回到它。在这种情况下，由于我们将要进入一个全新的屏幕，
我们可能想要使用这个方法来实现它的enter animation属性。

```
2.2  pushReplacement——Navigator.pushReplacement( context, MaterialPageRoute(builder: (BuildContext context) => screen4()));

```
这个用法跟2.1相同，只是路由的传递有差别，上方的是传递路由名称（页面对应的名称，需在入口定义（本文第一点）），而后者只需new对应页面即可，而且可以传递 参数（传参方式类似于本文后续所说的传递方法）。

```
3.popAndPushNamed——Navigator.popAndPushNamed(context, '/screen4');

```
指将当前页面pop，然后跳转到制定页面（将当前路由弹出导航器，并将命名路由推到它的位置。） 下面为官方说明：

>Pop the current route off the navigator that most tightly encloses the
given context and push a named route in its place.

使用情况：例如
在购物应用中，有产品列表，用户在产品列表中可以通过筛选，来进一步选择商品，在这个过程中，用户点击筛选按钮时，会进入筛选条件选择界面，当用户点击
确定筛选按钮时，应弹出筛选界面，并使用新的筛选条件进入产品列表。这种情况popAndPushNamed就更合适了

```
4.pushNamedAndRemoveUntil——Navigator.of(context).pushNamedAndRemoveUntil('/screen4', (Route<dynamic> route) => false);

```
指将制定的页面加入到路由中，然后将其他所有的页面全部pop, (Route route) => false将确保删除推送路线之前的所有路线。 这时候将打开一个新的screen4页面
>Push the route with the given name onto the navigator, and then remove all
>the previous routes until the `predicate` returns true.

使用情况：例如 当用户点击了退出登录时，我们需要进入某一个页面（比如点退出登录后进入了登录页），这个时候用户点击返回时不应该能进入任何一个页面，这种情况就可以使用。
```
5.1 pushNamedAndRemoveUntil——Navigator.of(context).pushNamedAndRemoveUntil('/screen4', ModalRoute.withName('/screen1'));

```
指将制定的页面加入到路由中，然后将之前的路径移除知道制定的页面为止（将具有给定名称的路由推到导航器上，然后删除所有路径前面的路由直到'predicate'返回true为止。）
这时候将销毁栈内除了screen4的页面，点击直接去栈内screen4，这时screen4会重新build

>Push the route with the given name onto the navigator, and then remove all
>the previous routes until the `predicate` returns true.

使用情况：例如
一个购物应用程序的例子!或者任何需要支付交易的应用程序。因此，在这些应用程序中，一旦用户完成了支付事件，所有与交易或购物车相关的屏幕都应该从堆栈中删除，用户应该进入到支付确认页面。单击back按钮应将它们返回到产品列表或主屏幕。
使用实例：
1-->2-->3,3到4时使用Navigator.pushNamedAndRemoveUntil(context,"/screen4",ModalRoute.withName('/screen1'));
这时候如果在页面4点击返回，将会直接退出程序。
1-->2-->3,3到4时使用Navigator.pushNamedAndRemoveUntil(context,"/screen4",ModalRoute.withName('/'));
这时候如果在页面4点击返回，将会直接回到页面1。
1-->2-->1-->2-->3,3到4时使用Navigator.pushNamedAndRemoveUntil(context,"/screen4",ModalRoute.withName('/screen1'));
这时候如果在页面4点击返回，将会回到第二个1页面。


```
Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context) => new  screen4()), ModalRoute.withName('/'),
```


这种方法跟上述方法作用相同，不同之处在于，上述传递的是路由名称，这个名称需要你在入口处进行路由指定，而这种则无需指定，直接new 出来即可，
而且可以传递参数。（看其名称即可发现差别pushNamedAndRemoveUntil与pushAndRemoveUntil）使用这种作用如下
1-->2-->3,3到4时使用此方法，这时候如果在页面4点击返回，将会直接回到页面1。
如果使用

```
Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context) => Screen4()),(Route<dynamic> route) => false,);
```
这时候进入4后。4将成为唯一的一个页面。其他页面都将pop出栈，这个跟上述pushNamedAndRemoveUntil也一致。
```
6.popUntil——Navigator.popUntil(context, ModalRoute.withName('/screen2'));
```
有些应用场景下，用户可能不得不填写一个由三部分组成的长表单，该表单可能在移动应用程序的三个连续屏幕中显示。现在在表单的第三个页面，用户决定取消填写表单。用户单击Cancel，就会弹出所有之前的与表单相关的屏幕，并将用户带回主屏幕，从而丢失所有与表单相关的数据(在这种情况下，这是我们想要的)。我们不会在这里推出任何新东西，只是回到以前的路线。

第二点 pop
-
```
1.Navigator.of(context).maybePop();
```

maybePop 会自动进行判断，如果当前页面pop后，会显示其他页面，不会出现问题，则将执行当前页面的pop操作 否则将不执行。
```
2.Navigator.of(context).canPop();

```
```
canPop  判断当前页面能否进行pop操作，并返回bool值

```
```
3.Navigator.of(context).pop();
直接退出当前页面

```
第三点 传参和参数返回
-
传参的方式很简单，在需要接收参数的页面进行参数定义，并加入其构造函数中，在跳转到该页面时，使用MaterialPageRoute并在页面中传入参数即可。
```
String params;
Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context) => new mainPage(params)));
接收参数
class mainPage extends StatelessWidget {
    final String userName;
    mainPage(this.userName);
    @override
    Widget build(BuildContext context) {
        print(userName);
    }
}

```
带返回值的页面跳转：
```

// 回传值
Navigator.of(context).pop('yinll');

// 接受
Navigator.push(context,new MaterialPageRoute(
            builder: (BuildContext context) => new Screen5(userName))).then((data){
            print(data);
        });

```
然后screen5中，在返回时使用：Navigator.of(context).pop('这是页面5返回的参数');
在pop中写上返回的的值，这时候在上方的then中即可得到返回的数据。
好啦  小伙伴们，今天就先说这么多，，后续我也会保持用法的不断更新，可以点下关注，以便及时得到更新通知哦。哈哈！
作为刚入坑Flutter的我而言，有些说的可能也存在错误，欢迎批评指正！

作者：Yinll
链接：https://juejin.im/post/5be2d6546fb9a049be5cf6d5
来源：掘金
著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
