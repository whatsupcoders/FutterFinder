import 'package:flutter/material.dart';
import 'package:flutterfinder/my_navigator.dart';
import 'package:flutterfinder/splashscreen/splashscreenconnect.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SplashScreenFind extends StatefulWidget {
  @override
  _SplashScreenFindState createState() => _SplashScreenFindState();
}

class _SplashScreenFindState extends State<SplashScreenFind> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: new Color(0xff622F74),
              gradient: LinearGradient(
                colors: [new Color(0xff29dfb7),new Color(0xff3ec7fd)],
                 begin: Alignment.centerRight,
                    end: new Alignment(-1.0, -1.0)
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.lightBlue[100],
                        radius: 75.0,
                        child: Icon(
                          FontAwesomeIcons.searchLocation,
                          color: Colors.orange,
                          size: 50.0,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                      ),
                      Text(
                        'Find',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ), //Expanded
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 10.0),
                    ),
                    Text(
                      'Find a Flutter Enthusiasts Nearby.',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0, right: 26.0),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () {
                             Navigator.push(context,MaterialPageRoute(builder: (context) => SplashScreenConnect()),);
                          },
                          child: Text('Next',
                              style: TextStyle(
                                fontSize: 25.0,
                                color: Color(0xffdd6b3d),
                              )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
