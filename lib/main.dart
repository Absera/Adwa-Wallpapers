import 'dart:math';

import 'package:adwa_wallpapers/preview.dart';
import 'package:adwa_wallpapers/gridview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:adwa_wallpapers/about.dart';
import 'package:toast/toast.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Lato'),
      title: 'Adwa Wallpapers',
      home: MyHomePage(
        title: 'Adwa Wallpapers',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage({this.title});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> img_numbers = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
    "11",
    "12",
    "13",
    "14",
    "15",
    "16",
    "17",
    "18",
    "19",
    "20",
    "21",
    "22",
    "23",
    "24",
    "25",
    "26",
    "27"
  ];

  // a method to generate random numbers
  random(min, max) {
    var rn = new Random();
    return min + rn.nextInt(max - min);
  }

  @override
  Widget build(BuildContext context) {
    Icon ic = Icon(Icons.navigate_next);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.grid_view),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => GridViewer()),
              );
            },
          ),
        ],
        title: Text(
          widget.title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Adwa Wallpapers',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              )),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              leading: ic,
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: ic,
              title: Text('Random Wallpaper'),
              onTap: () {
                String random_ = this.random(1, 27).toString();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          PreviewPage(wallpaper_number: random_)),
                );
                // Navigator.pop(context);
              },
            ),
            ListTile(
              leading: ic,
              title: Text('About Adwa'),
              onTap: () {
                launch('https://en.wikipedia.org/wiki/Battle_of_Adwa');
                Toast.show("Opening in browser...", context,
                    duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
              },
            ),
            ListTile(
              leading: ic,
              title: Text('Developer'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutPage()),
                );
              },
            ),
            ListTile(
              leading: ic,
              title: Text('Update (version 1.0)'),
              onTap: () {
                // TODO launch play store link here
                Toast.show("Coming Soon...", context,
                    duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
              },
            ),
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(0.0, 4.0, 0.0, 4.0),
        child: ListView.builder(
            itemCount: img_numbers.length,
            itemBuilder: (BuildContext ctxt, int index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(padding: EdgeInsets.all(10.00)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        child: Container(
                          padding: EdgeInsets.all(1.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          width: (MediaQuery.of(context).size.width) * 0.7,
                          height: 200.0,
                          child:
                              Image.asset("assets/${img_numbers[index]}.jpg"),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PreviewPage(
                                    wallpaper_number: img_numbers[index])),
                          );
                        },
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.all(2.00)),
                ],
              );
            }),
      ),
    );
  }
}
