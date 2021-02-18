import 'package:dsc_local/screens/Medium%20Page/ArticlesPage.dart';
import 'package:dsc_local/screens/dscScreen/aboutDSC.dart';
import 'package:dsc_local/screens/dscScreen/requestEvent.dart';
import 'package:dsc_local/screens/dscScreen/team.dart';
import 'package:dsc_local/screens/homeScreen/PastEventsPage.dart';
import 'package:dsc_local/screens/homeScreen/UpcomingEventsPage.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int sindex = 0;
  int _selectedIndex = 0;
  final tabs = [
    UpcomingEventsPage(),
    PastEventsPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            _onItemTapped(index);
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home, color: Colors.black),
                label: "Upcoming Events"),
            BottomNavigationBarItem(
                icon: Icon(Icons.power, color: Colors.black),
                label: "Past Events"),
          ],
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          currentIndex: _selectedIndex,
          elevation: 5),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: MyFloatingActionButton(),
      body: Center(
        child: tabs.elementAt(_selectedIndex),
      ),
    );
  }
}

class MyFloatingActionButton extends StatefulWidget {
  @override
  _MyFloatingActionButtonState createState() => _MyFloatingActionButtonState();
}

class _MyFloatingActionButtonState extends State<MyFloatingActionButton> {
  bool showFab = true;

  @override
  Widget build(BuildContext context) {
    return showFab
        ? FloatingActionButton(
            backgroundColor: Colors.white70,
            onPressed: () {
              var bottomSheetController = showBottomSheet(
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (context) => ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50)),
                        child: Container(
                          color: Colors.white,
                          height: MediaQuery.of(context).size.height - 300,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              ListTile(
                                title: Text(
                                  "About DSC",
                                  style: TextStyle(color: Colors.black),
                                ),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => AboutDSC()));
                                },
                              ),
                              ListTile(
                                title: Text("Team Members",
                                    style: TextStyle(color: Colors.black)),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Team()));
                                },
                              ),
                              ListTile(
                                title: Text("Request an Event",
                                    style: TextStyle(color: Colors.black)),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              RequestEventForm()));
                                },
                              ),
                              ListTile(
                                title: Text("Medium Articles",
                                    style: TextStyle(color: Colors.black)),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ArticlesPage()));
                                },
                              ),
                            ],
                          ),
                        ),
                      ));

              showFoatingActionButton(false);

              bottomSheetController.closed.then((value) {
                showFoatingActionButton(true);
              });
            },
            child: Image.asset(
              "assets/images/main_logo.png",
              height: 20,
            ),
          )
        : Container();
  }

  void showFoatingActionButton(bool value) {
    setState(() {
      showFab = value;
    });
  }
}
