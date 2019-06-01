import 'package:flutter/material.dart';
import 'splashscreen/splashscreenfind.dart';


var routes = <String, WidgetBuilder>{
  "/find": (BuildContext context) => SplashScreenFind(),
};

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xffdd6b3d),
      ),
      home: SplashScreenFind(),
    );
  }
}

