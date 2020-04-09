import 'package:flutter/material.dart';
import 'package:asset_toast/asset_toast.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'asset toast',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'asset toast Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Toast plugin example app'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: RaisedButton(
                    child: Text('top toast'),
                    onPressed: () {
                      AssetToast.show("hello there", context,
                          asset: "assets/img.jpeg",
                          duration: AssetToast.lengthShort,
                          prefixBadge: Colors.red,
                          backgroundColor: Colors.blueGrey,
                          gravity: AssetToast.top,
                          textStyle: TextStyle(fontWeight: FontWeight.bold),
                          msgColor: Colors.white);
                    }),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: RaisedButton(
                    child: Text('Show bottom toast'),
                    onPressed: () {
                      AssetToast.show("hello there", context,
                          asset: "assets/img.jpeg",
                          duration: AssetToast.lengthLong,
                          prefixBadge: Colors.green,
                          gravity: AssetToast.bottom,
                          backgroundColor: Colors.indigo,
                          msgColor: Colors.white);
                    }),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: RaisedButton(
                    child: Text('lengthlong toast toast'),
                    onPressed: () {
                      AssetToast.show("hello there\n length long", context,
                          asset: "assets/img.jpeg",
                          duration: AssetToast.lengthLong,
                          prefixBadge: Colors.purple,
                          gravity: AssetToast.bottom,
                          textStyle: TextStyle(fontWeight: FontWeight.bold),
                          msgColor: Colors.white);
                    }),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: RaisedButton(
                    child: Text('Show  lengthShort'),
                    onPressed: () {
                      AssetToast.show("hello there", context,
                          asset: "assets/img.jpeg",
                          duration: AssetToast.lengthShort,
                          prefixBadge: Colors.blue,
                          gravity: AssetToast.bottom,
                          textStyle: TextStyle(fontWeight: FontWeight.bold),
                          msgColor: Colors.white);
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
