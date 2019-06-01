import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'EventDetailsPage.dart';
import 'Events.dart';

class EventDetails extends StatelessWidget {
   Events index;
   String eventname;
   String eventdetails;
   String eventdate;
   String eventlocation;
   String eventImage;


EventDetails(this.index,this.eventname,this.eventdetails,this.eventdate,this.eventlocation,eventImage);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child:Material(
            color: Colors.white,
            elevation: 14.0,
            borderRadius: BorderRadius.circular(24.0),
            shadowColor: Color(0x802196F3),
            child: Container(
              width: 230.0,
              height: 150.0,
              child: Column(
                children: <Widget>[
                  SizedBox(height: 10.0),
                  Container(
                    child: Padding(
              padding: EdgeInsets.only(left: 8.0,right:8.0,top:8.0),
              child:Center(
                        child: Text(eventname,
                            style: TextStyle(
                                color: Color(0xff2da9ef),
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold)))),
                  ),
                  Container(
                    child: Center(
                        child: Text(eventdate,
                            style: TextStyle(
                                color: Color(0xff2da9ef),
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold))),
                  ),
                  SizedBox(height: 10.0),
                  Container(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(eventlocation.toString() ,
                          style: TextStyle(
                              color: Color(0xffff6f00), fontSize: 16.0)),
                      IconButton(
                          icon: Icon(
                            FontAwesomeIcons.angleRight,
                            color: Color(0xffff6f00),
                          ),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>EventDetailsPage(index)));
                          }),
                    ],
                  )),
                ],
              ),
            )));
  }
}