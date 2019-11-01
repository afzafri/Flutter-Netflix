import 'package:flutter/material.dart';

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
            padding: const EdgeInsets.only(left: 10, top: 8),
            child: Text("Popular on Netflix", textAlign: TextAlign.left,),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 8, bottom: 14, left: 6, right: 6),
              height: 200.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(6),
                    child: Container(
                        width: 160.0,
                        color: Colors.red,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(6),
                    child: Container(
                        width: 160.0,
                        color: Colors.blue,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(6),
                    child: Container(
                        width: 160.0,
                        color: Colors.blue,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(6),
                    child: Container(
                        width: 160.0,
                        color: Colors.blue,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(6),
                    child: Container(
                        width: 160.0,
                        color: Colors.blue,
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
