import 'package:flutter/material.dart';
import 'splashscreen/splashscreenfind.dart';
import 'contact.dart';
import 'contactDetails.dart';


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
      onGenerateRoute: (settings) => generateRoute(settings),
    );
  }
   generateRoute(RouteSettings settings) {
    final path = settings.name.split('/');
    final contactName = path[1];

    Contact contact = contacts.firstWhere((myroute) => myroute.contactName == contactName);
    return MaterialPageRoute(
      settings: settings,
      builder: (context) => ContactDetails(contact),
    );
  }
}

