import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'contact.dart';
import 'Events.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'EventDetails.dart';

class HomeScreen extends StatefulWidget {
  final Widget child;

  HomeScreen({Key key, this.child}) : super(key: key);

  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
 
  List<charts.Series<Task, String>> _seriesPieData;

  _generateData() {
    
    var piedata = [
      new Task('US', 40, Color(0xff3366cc)),
      new Task('India', 30, Color(0xff990099)),
      new Task('Germany', 20, Color(0xff109618)),
      new Task('Brazil', 15, Color(0xfffdbe19)),
      new Task('Australia', 10, Color(0xffff9900)),
      new Task('New Zealand', 5, Color(0xffdc3912)),
    ];

    _seriesPieData.add(
      charts.Series(
        domainFn: (Task task, _) => task.task,
        measureFn: (Task task, _) => task.taskvalue,
        colorFn: (Task task, _) =>
            charts.ColorUtil.fromDartColor(task.colorval),
        id: 'Flutter Developer',
        data: piedata,
         labelAccessorFn: (Task row, _) => '${row.taskvalue}',
      ),
    );

    
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   
    _seriesPieData = List<charts.Series<Task, String>>();

    _generateData();
  }

 List<Events> eventdetails = [];
  Future<List<Events>> _eventDetails() async {
    var data =await http.get("https://my.api.mockaroo.com/event_details.json?key=efdf32c0");
    var jsonData = json.decode(data.body);
    
    for (var eventval in jsonData) {
      Events events = Events(eventval['event_name'], eventval['event_description'],eventval['event_date'], 
          eventval['event_location'],eventval['eventImage']);
      eventdetails.add(events);
    }
    return eventdetails;
  }
  @override
  Widget build(BuildContext context) {

    createProfileImage(Contact contact) =>
        Hero(
            tag: contact.contactName,
            child: Column(children: <Widget>[
              Material(
                child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                          context, 'contactdetails/${contact.contactName}');
                    },
                    child:Container(child:Column(children: <Widget>[
                      Container(
                        width: 100,
                        height: 80,
                        decoration: new BoxDecoration(
                            shape: BoxShape.circle,
                            image: new DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage(
                                  contact.contactImage),
                            )
                        ),
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: Text(
                              contact.contactName,
                              style: TextStyle(color: Colors.black, fontSize: 18.0)),
                        ),
                      ),
                    ],),)
                ),
              ),

            ],)
        );

          ProfileList(Contact contact) =>
        Hero(
          tag: contact.contactName,
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Material(
                color: Colors.white,
                elevation: 14.0,
                borderRadius: BorderRadius.circular(24.0),
                shadowColor: Color(0x802196F3),
                child: Row(children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 100,
                      height: 80,
                      decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          image: new DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage(
                                contact.contactImage),
                          )
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                              context, 'contactdetails/${contact.contactName}');
                        },
                      ),
                    ),
                  ),

                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                          contact.contactName,
                          style: TextStyle(
                              color: Colors.black, fontSize: 24.0)),
                    ),
                  ),

                ],),
              ),
            ),
          ),
        );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length:3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xffdd6b3d),
            //backgroundColor: Color(0xff308e1c),
            bottom: TabBar(
              indicatorColor: Color(0xff9962D0),
              tabs: [
                Tab(
                  icon: Icon(FontAwesomeIcons.solidChartBar),
                ),
                Tab(icon: Icon(FontAwesomeIcons.users)),
                 Tab(icon: Icon(FontAwesomeIcons.calendarAlt)),
              ],
            ),
            title: Text('Flutter Finder'),
          ),
          body: TabBarView(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Text(
                            'International Flutter Developers ',style: TextStyle(fontSize: 24.0,fontWeight: FontWeight.bold),),
                            SizedBox(height: 10.0,),
                        Expanded(
                          child: charts.PieChart(
                            _seriesPieData,
                            animate: true,
                            animationDuration: Duration(seconds: 5),
                             behaviors: [
                            new charts.DatumLegend(
                              outsideJustification: charts.OutsideJustification.endDrawArea,
                              horizontalFirst: false,
                              desiredMaxRows: 2,
                              cellPadding: new EdgeInsets.only(right: 4.0, bottom: 4.0),
                              entryTextStyle: charts.TextStyleSpec(
                                  color: charts.MaterialPalette.purple.shadeDefault,
                                  fontFamily: 'Georgia',
                                  fontSize: 11),
                            )
                          ],
                           defaultRenderer: new charts.ArcRendererConfig(
                              arcWidth: 100,
                             arcRendererDecorators: [
          new charts.ArcLabelDecorator(
              labelPosition: charts.ArcLabelPosition.inside)
        ])),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: contacts.map((contact) => ProfileList(contact))
                      .toList(),
                ),
              ),

               SingleChildScrollView(
          child: Column(
            children: <Widget>[
              FutureBuilder(
                future: _eventDetails(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.data != null) {
                    return Container(
                      height: MediaQuery.of(context).size.height,
                      color: Color(0xfffF7F7F7),
                      child: ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return EventDetails(
                              snapshot.data[index],
                              snapshot.data[index].eventname,
                              snapshot.data[index].eventdetails,
                              snapshot.data[index].eventdate,
                              snapshot.data[index].eventlocation,
                                snapshot.data[index].eventImage,
                              );
                        },
                      ),
                    );
                  } else {
                    return Container(
                      child: Center(
                        child: Text("Loading"),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),

            ],
          ),
        ),
      ),
    );
  }

}



class Task {
  String task;
  double taskvalue;
  Color colorval;

  Task(this.task, this.taskvalue, this.colorval);
}

