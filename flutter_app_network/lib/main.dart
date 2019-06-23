import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter get datas",
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      debugShowCheckedModeBanner: false,
      home: AppHomePage(),
    );
  }
}

class AppHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AppHomePageState();
  }
}

class AppHomePageState extends State<AppHomePage> {
  List<Animate> movies;
  int _page = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  void loadData() {
    getMovies(
        page: 1,
        callback: (List<Animate> movies) {
          setState(() {
            this.movies = movies;
          });
        });
  }

  // 使用了async 异步才能使用到 await
  Future onRefresh() async {
    await getMovies(
        page: 1,
        callback: (List<Animate> movies) {
          setState(() {
            this.movies.addAll(movies);
            print('done');
//            return null;
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text('Top Animate Movies'),
        leading: MaterialButton(
          onPressed: () {
            getMovies();
          },
          child: Text(
            'Get',
          ),
        ),
      ),
      body: movies == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: EdgeInsets.all(0),
              child: RefreshIndicator(
                  child: ListView.builder(
                      itemCount: movies.length,
                      itemBuilder: (BuildContext context, int index) {
                        return AnimateCard(movies[index]);
                      }),
                  onRefresh: onRefresh),
            ),
    );
  }

  Future<List<Animate>> getMovies(
      {String type = 'anime',
      int page = 1,
      String subType = 'movie',
      void callback(List<Animate> movies)}) async {
    final String url = "https://api.jikan.moe/top/$type/$page/$subType";
//    print(url);
    final response = await http.get(url);
    if (response.statusCode == HttpStatus.ok) {
      Map body = json.decode(response.body);
      List top = json.decode(response.body)['top'];
      List<Animate> movies =
          top.map(((json) => Animate.fromJson(json))).toList();
      callback(movies);
    } else {
      print('error code $response.statusCode');
    }
  }
}

class Animate {
  final int rank;
  final String imgUrl;
  final String title;
  final double score;
  final String url;
  final String airingStart;
  final String airingEnd;

  Animate({
    this.rank,
    this.imgUrl,
    this.title,
    this.score,
    this.url,
    this.airingStart,
    this.airingEnd,
  });

  factory Animate.fromJson(Map<String, dynamic> json) {
    return Animate(
      rank: json['rank'] as int,
      imgUrl: json['image_url'] as String,
      title: json['title'] as String,
      score: json['score'] as double,
      url: json['url'] as String,
      airingStart: json['airing_start'] as String,
      airingEnd: json['airing_end'] as String,
    );
  }
}

class AnimateCard extends StatelessWidget {
  Animate animate;

  AnimateCard(this.animate);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: InkWell(
        onTap: () {},
        child: ListTile(
          contentPadding: EdgeInsets.only(left: 10, right: 10),
          leading: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(right: 6),
                child: Text(animate.rank < 10
                    ? '0${animate.rank.toString()}'
                    : animate.rank.toString()),
              ),
              Image(
                image: NetworkImage(animate.imgUrl),
                width: 45.0,
                height: 45.0,
              ),
            ],
          ),
          title: Padding(
            padding: EdgeInsets.only(bottom: 10.0),
            child: Text(
              animate.title,
              maxLines: 2,
              textAlign: TextAlign.start,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.deepPurple, fontSize: 16),
            ),
          ),
          subtitle: Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(right: 4.0),
                child: Text(
                  '上映日期',
                  style: TextStyle(fontSize: 12.0),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 4.0),
                child: Text(
                  animate.airingStart,
                  style: TextStyle(fontSize: 12.0),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 4.0),
                child: Text(
                  "下映日期:",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 12.0),
                ),
              ),
              Text(
                animate.airingEnd,
                style: TextStyle(fontSize: 12.0),
              ),
            ],
          ),
          trailing: Text(
            animate.score.toString(),
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
          ),
        ),
      ),
    );
  }
}
