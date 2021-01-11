import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';

import '../../configs/assets.dart';
import '../../data/models/eventsModel.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
    final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
    
  @override
  Widget build(BuildContext context) {
  return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                child: Center(child: Image.asset(Assets.vitb_dsc_logo)),
              ),
            ),
            Expanded(
              flex: 8,
              child: Container(
                child: ListView.builder(
                  itemCount: eventsTestData.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade400,
                            blurRadius: 10.0, // soften the shadow
                            spreadRadius: 0.0, //extend the shadow
                            offset: Offset(
                              0.0, // Move to right 10  horizontally
                              5.0, // Move to bottom 10 Vertically
                            ),
                          )
                        ],
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, "/eventDetails",
                              arguments: eventsTestData[index]);
                        },
                        child: Column(
                          children: [
                            Container(
                              padding:
                                  EdgeInsets.only(left: 16, right: 16, top: 24),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AutoSizeText(
                                    eventsTestData[index].eventTitle,
                                    minFontSize: 12,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    child: AutoSizeText(
                                      eventsTestData[index].eventDesc.length >
                                              120
                                          ? "${eventsTestData[index].eventDesc.substring(0, 120)}..."
                                          : eventsTestData[index].eventDesc,
                                    ),
                                  ),
                                  Text(
                                    eventsTestData[index].eventDay != null
                                        ? eventsTestData[index].eventDay +
                                            " ${eventsTestData[index].eventDate}, ${eventsTestData[index].eventTime}"
                                        : "" +
                                            "${eventsTestData[index].eventDate}, ${eventsTestData[index].eventTime}",
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.blue.shade300,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                ),
                              ),
                              margin: EdgeInsets.only(top: 8),
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Center(
                                child: Text(
                                  "Explore more >",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: "eventAdd",
        onPressed: () {
          final snackBar = SnackBar(
              content: Text(
                  'On tapping this button, CLUB leader can create an event'));
          _scaffoldKey.currentState.showSnackBar(snackBar);
        },
        tooltip: "Add event",
        child: Icon(FontAwesome5.plus),
      ),
    );
  }
}