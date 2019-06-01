import 'package:flutter/material.dart';
import 'Events.dart';

class EventDetailsPage extends StatelessWidget {
  final Events events;
  const EventDetailsPage(this.events);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(events.eventname),
        ),
        body: Column(
          children: <Widget>[
            SizedBox(height: 10.0,),
            Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  height: 60.0,
                  child:Text(events.eventname,style: TextStyle(fontSize: 22.0,color: Color(0xffdd6b3d),),)
            ),
            SizedBox(height: 10.0,),
            Padding(
              padding: EdgeInsets.only(left: 8.0,right:8.0),
              child:Text(events.eventdetails,style: TextStyle(fontSize: 16.0),)),
                SizedBox(height: 10.0,),
              Padding(
              padding: EdgeInsets.only(left: 8.0,right:8.0),
              child:Text(events.eventlocation,style: TextStyle(fontSize: 16.0,color: Color(0xffdd6b3d),),)),
                SizedBox(height: 10.0,),
              Padding(
              padding: EdgeInsets.only(left: 8.0,right:8.0),
              child:Text(events.eventdate,style: TextStyle(fontSize: 16.0,color: Color(0xffdd6b3d),),)),
          ],),
         
    );
  }
}
