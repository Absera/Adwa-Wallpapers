import 'package:flutter/material.dart';
import 'package:wallpaper_manager/wallpaper_manager.dart';
import 'package:toast/toast.dart';

class PreviewPage extends StatelessWidget {
  final String wallpaper_number;
  PreviewPage({Key key, this.wallpaper_number}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text("Preview Image", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Center(
          child: ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          Container(
            child: Image.asset("assets/${this.wallpaper_number}.jpg"),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10.0),
            child: Column(
              children: [
                ElevatedButton(
                  child: Text("Set as Wallpaper"),
                  onPressed: () {
                    setWallpaper(this.wallpaper_number);
                    Toast.show("Successfully set", context,
                        duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      )),
    );
  }

  setWallpaper(img_number) async {
    int location_home = WallpaperManager.HOME_SCREEN;
    int location_lock = WallpaperManager.LOCK_SCREEN;
    String result;
    await WallpaperManager.setWallpaperFromAsset(
        "assets/${img_number}.jpg", location_home);
    await WallpaperManager.setWallpaperFromAsset(
        "assets/${img_number}.jpg", location_lock);
  }
}
