
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dsc_local/configs/assets.dart';
import 'package:dsc_local/data/models/eventsModel.dart';
import 'package:dsc_local/screens/eventDetails/eventDetails.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';

class UpcomingEventsPage extends StatefulWidget {
  @override
  _UpcomingEventsPageState createState() => _UpcomingEventsPageState();
}

class _UpcomingEventsPageState extends State<UpcomingEventsPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final ref = FirebaseFirestore.instance
      .collection('upcoming events')
      .orderBy('priority', descending: false);

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
                child: StreamBuilder(
                  stream: ref.snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    return ListView.builder(
                      itemCount: snapshot.hasData ? snapshot.data.docs.length : 0,
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
                              Navigator.push(context, MaterialPageRoute(builder: (context) => EventDetails(
                                description: snapshot.data.docs[index].data()['description'],
                                eventLink: snapshot.data.docs[index].data()['urlToEvent'],
                                eventName: snapshot.data.docs[index].data()['title'],
                                time: snapshot.data.docs[index].data()['time'],
                                formlink: snapshot.data.docs[index].data()['feedbackFormUrlLink'],
                                formVisiblity: snapshot.data.docs[index].data()['FeedbackFormVisible'],
                                imageUrl: snapshot.data.docs[index].data()['imageUrl'],
                              )));
                            },
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(
                                      left: 16, right: 16, top: 24),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      AutoSizeText(
                                        snapshot.data.docs[index]
                                            .data()['title'],
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
                                          snapshot.data.docs[index]
                                              .data()['short description'],
                                        ),
                                      ),
                                      Text(
                                        snapshot.data.docs[index]
                                            .data()['time'],
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
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
