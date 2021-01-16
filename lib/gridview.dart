import 'dart:math';

import 'package:adwa_wallpapers/preview.dart';
import 'package:adwa_wallpapers/gridview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:adwa_wallpapers/about.dart';
import 'package:toast/toast.dart';
import 'package:url_launcher/url_launcher.dart';

import 'main.dart';

class GridViewer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Lato'),
      title: 'Adwa Wallpapers',
      home: GridViewLayout(
        title: 'Adwa Wallpapers',
      ),
    );
  }
}

class GridViewLayout extends StatefulWidget {
  final String title;

  GridViewLayout({this.title});

  @override
  _GridViewLayoutState createState() => _GridViewLayoutState();
}

class _GridViewLayoutState extends State<GridViewLayout> {
  List<String> img_numbers = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27"];

  // a method to generate random numbers
  random(min, max){
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
            icon: Icon(Icons.format_list_bulleted),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyApp()),
              );
            },
          ),
        ],
        title: Text(widget.title, style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),drawer: Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Center(child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Adwa Wallpapers', style: TextStyle(fontWeight: FontWeight.bold),),
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
              String random_ = this.random(1,27).toString();
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => PreviewPage(wallpaper_number:random_)),);
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
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => GridViewLayout()),);
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
        // padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
        child: GridView.count(
          scrollDirection: Axis.vertical,
          crossAxisCount: 2 ,
          children: List.generate(27,(index){
            return Container(
              padding: EdgeInsets.all(10.0),
              child: InkWell(
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
                  // width: (MediaQuery.of(context).size.width) * 0.7,
                  // height: 200.0,
                  child: Image.asset("assets/${index+1}.jpg"),
                ),
                onTap: () {
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PreviewPage(wallpaper_number:(index + 1).toString())),);
                },
              ),
            );
          }),
        ),
      ),
    );
  }
}

