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
                  Padding(
                    padding: const EdgeInsets.all(6),
                    child: InkWell(
                    onTap: () => showAlertDialog(context, "Nowhere Man"), // handle your onTap here
                    child: Container(
                          width: 160.0,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                'assets/images/popular1.jpg',
                              ),
                              fit: BoxFit.fill,
                            ),
                          )
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(6),
                    child: InkWell(
                      onTap: () => showAlertDialog(context, "Black Panther"), // handle your onTap here
                      child: Container(
                          width: 160.0,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                'assets/images/popular2.png',
                              ),
                              fit: BoxFit.fill,
                            ),
                          )
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(6),
                    child: InkWell(
                      onTap: () => showAlertDialog(context, "Stranger Things"), // handle your onTap here
                      child: Container(
                          width: 160.0,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                'assets/images/popular3.jpg',
                              ),
                              fit: BoxFit.fill,
                            ),
                          )
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(6),
                    child: InkWell(
                      onTap: () => showAlertDialog(context, "Daybreak"), // handle your onTap here
                      child: Container(
                          width: 160.0,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                'assets/images/popular4.jpg',
                              ),
                              fit: BoxFit.fill,
                            ),
                          )
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(6),
                    child: InkWell(
                      onTap: () => showAlertDialog(context, "Fractured"), // handle your onTap here
                      child: Container(
                          width: 160.0,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                'assets/images/popular5.jpg',
                              ),
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
                  Padding(
                    padding: const EdgeInsets.all(6),
                    child: InkWell(
                      onTap: () => showAlertDialog(context, "Sex Education"), // handle your onTap here
                      child: Container(
                          width: 160.0,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                'assets/images/trending1.jpeg',
                              ),
                              fit: BoxFit.fill,
                            ),
                          )
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(6),
                    child: InkWell(
                      onTap: () => showAlertDialog(context, "The Big Bang Theory"), // handle your onTap here
                      child: Container(
                          width: 160.0,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                'assets/images/trending2.jpg',
                              ),
                              fit: BoxFit.fill,
                            ),
                          )
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(6),
                    child: InkWell(
                      onTap: () => showAlertDialog(context, "How I Met Your Mother"), // handle your onTap here
                      child: Container(
                          width: 160.0,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                'assets/images/trending3.jpg',
                              ),
                              fit: BoxFit.fill,
                            ),
                          )
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(6),
                    child: InkWell(
                      onTap: () => showAlertDialog(context, "Lucifer"), // handle your onTap here
                      child: Container(
                          width: 160.0,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                'assets/images/trending4.jpg',
                              ),
                              fit: BoxFit.fill,
                            ),
                          )
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(6),
                    child: InkWell(
                      onTap: () => showAlertDialog(context, "The Dark Knight Rises"), // handle your onTap here
                      child: Container(
                          width: 160.0,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                'assets/images/trending5.jpg',
                              ),
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
