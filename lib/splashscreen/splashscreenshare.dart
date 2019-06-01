import 'package:flutter/material.dart';
import 'package:flutterfinder/my_navigator.dart';
import 'package:flutterfinder/splashscreen/splashscreenconnect.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutterfinder/HomeScreen.dart';

class SplashScreenShare extends StatefulWidget {
  @override
  _SplashScreenShareState createState() => _SplashScreenShareState();
}

class _SplashScreenShareState extends State<SplashScreenShare> {
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
                colors: [new Color(0xffD18CC2),new Color(0xff41A2E0)],
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
                        'Share',
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
                      'Share with the Community',
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
                             Navigator.push(context,MaterialPageRoute(builder: (context) => HomeScreen()),);
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
