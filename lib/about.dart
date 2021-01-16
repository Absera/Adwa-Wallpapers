import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text("About",  style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Center(
          child: Container(
            padding: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Developer"),
                Text(" "),
                Text("Absera Temesgen"),
                Text(" "),
                ElevatedButton.icon(
                  icon: Icon(Icons.mail_rounded),
                  label: Text("Contact Developer"),
                  onPressed: () {
                    launch("mailto:abseratemesgen@gmail.com");
                    Toast.show("Opening email...", context,
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
          )),
    );
  }
}
