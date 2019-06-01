import 'package:flutter/material.dart';
import 'package:flutterfinder/my_navigator.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'splashscreenshare.dart';

class SplashScreenConnect extends StatefulWidget {
  @override
  _SplashScreenConnectState createState() => _SplashScreenConnectState();
}

class _SplashScreenConnectState extends State<SplashScreenConnect> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                color: new Color(0xff622F74),
                gradient: new LinearGradient(
                  colors: [new Color(0xffFFBE65),Color(0xff9AB67C)],
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
                         FontAwesomeIcons.projectDiagram,
                          color: Colors.orange,
                          size: 50.0,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                      ),
                      Text(
                        'Connect',
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
                      'Connect with Flutter Community',
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
                             Navigator.push(context,MaterialPageRoute(builder: (context) => SplashScreenShare()),);
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
