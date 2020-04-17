import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

String apikey = "6b4bc94b61f4f4d1408aee6964223acf";

class API {
  static Future getMovies(String category) {
    var url = 'https://api.themoviedb.org/3/movie/'+category+'?api_key='+apikey+'&language=en-US&page=1';
    return http.get(url);
  }
}

class Movie {
  int id;
  String title;
  String posterUrl;

  Movie(int id, String title, String posterUrl) {
    this.id = id;
    this.title = title;
    this.posterUrl = posterUrl;
  }

  Movie.fromJson(Map json)
      : id = json['id'],
        title = json['original_title'],
        posterUrl = "https://image.tmdb.org/t/p/w500/"+json['poster_path'];

  Map toJson() {
    return {'id': id, 'title': title, 'posterUrl': posterUrl};
  }
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Netflix',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        brightness: Brightness.dark,
        accentColor: Colors.white,
      ),
      home: MyHomePage(title: 'Flutter Netflix'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var popularMovies = new List<Movie>();
  var trendingMovies = new List<Movie>();
  var nowPlayingMovies = new List<Movie>();

  _getPopular() {
    API.getMovies('popular').then((response) {
      setState(() {
        Iterable list = json.decode(response.body)['results'];
        popularMovies = list.map((model) => Movie.fromJson(model)).toList();
      });
    });
  }

  _getTrending() {
    API.getMovies('top_rated').then((response) {
      setState(() {
        Iterable list = json.decode(response.body)['results'];
        trendingMovies = list.map((model) => Movie.fromJson(model)).toList();
      });
    });
  }
    _getNowPlaying() {
      API.getMovies('now_playing').then((response) {
        setState(() {
          Iterable list = json.decode(response.body)['results'];
          nowPlayingMovies = list.map((model) => Movie.fromJson(model)).toList();
        });
      });
  }

  initState() {
    super.initState();
    _getPopular();
    _getTrending();
    _getNowPlaying();
  }

  dispose() {
    super.dispose();
  }

  showAlertDialog(BuildContext context, String name) {

    // set up the button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop('dialog');
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Details"),
      content: Text("Title: "+name),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Image.asset('assets/images/logo.png', fit: BoxFit.contain, height: 42,),
        actions: <Widget>[
          Padding(
          padding: EdgeInsets.only(right: 60),
          child: Row(
            children: <Widget>[
              FlatButton(
                textColor: Colors.white,
                onPressed: () {},
                child: Text("TV Shows"),
                shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
              ),
              FlatButton(
                textColor: Colors.white,
                onPressed: () {},
                child: Text("Movies"),
                shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
              ),
              FlatButton(
                textColor: Colors.white,
                onPressed: () {},
                child: Text("My List"),
                shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
              ),
            ],
          )
      )

        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 10),
            child: Text("Popular on Netflix", textAlign: TextAlign.left,),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 8, bottom: 14, left: 6, right: 6),
              height: 200.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[

                for (int i = 0; i < popularMovies.length; i++)
                  Padding(
                    padding: const EdgeInsets.all(6),
                    child: InkWell(
                    onTap: () => showAlertDialog(context, popularMovies[i].title), // handle your onTap here
                    child: Container(
                          width: 100.0,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: new NetworkImage(popularMovies[i].posterUrl),
                              fit: BoxFit.fill,
                            ),
                          )
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text("Trending Now", textAlign: TextAlign.left,),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 8, bottom: 14, left: 6, right: 6),
              height: 200.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[

                  for (int i = 0; i < trendingMovies.length; i++)
                    Padding(
                      padding: const EdgeInsets.all(6),
                      child: InkWell(
                        onTap: () => showAlertDialog(context, trendingMovies[i].title), // handle your onTap here
                        child: Container(
                            width: 100.0,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: new NetworkImage(trendingMovies[i].posterUrl),
                                fit: BoxFit.fill,
                              ),
                            )
                        ),
                      ),
                    ),

                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text("Available Now", textAlign: TextAlign.left,),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 8, bottom: 14, left: 6, right: 6),
              height: 200.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[

                  for (int i = 0; i < nowPlayingMovies.length; i++)
                    Padding(
                      padding: const EdgeInsets.all(6),
                      child: InkWell(
                        onTap: () => showAlertDialog(context, nowPlayingMovies[i].title), // handle your onTap here
                        child: Container(
                            width: 100.0,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: new NetworkImage(nowPlayingMovies[i].posterUrl),
                                fit: BoxFit.fill,
                              ),
                            )
                        ),
                      ),
                    ),

                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: new BottomNavigationBar(
          showSelectedLabels: true,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          items: [
            new BottomNavigationBarItem(
              icon:Icon(Icons.home),
              title: new Text('Home', style: TextStyle(fontSize: 12)),
            ),

            new BottomNavigationBarItem(
              icon:Icon(Icons.search),
              title: new Text('Search', style: TextStyle(fontSize: 12)),
            ),

            new BottomNavigationBarItem(
              icon:Icon(Icons.play_circle_outline),
              title: new Text('Coming Soon', style: TextStyle(fontSize: 12)),
            ),

            new BottomNavigationBarItem(
              icon:Icon(Icons.system_update_alt),
              title: new Text('Downloads', style: TextStyle(fontSize: 12)),
            ),

            new BottomNavigationBarItem(
              icon:Icon(Icons.reorder),
              title: new Text('More', style: TextStyle(fontSize: 12)),
            )
          ]

      ),
    );
  }
}
