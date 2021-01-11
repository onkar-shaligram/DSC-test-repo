import 'package:dsc_local/screens/homeScreen/PastEventsPage.dart';
import 'package:dsc_local/screens/homeScreen/UpcomingEventsPage.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
        int _selectedIndex = 0;  
    final tabs = [
      UpcomingEventsPage(),
      PastEventsPage()
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
            backgroundColor: Colors.black,
            icon: Icon(Icons.electrical_services),
            label: "Upcoming Events"
            ),

          BottomNavigationBarItem(
            icon: Icon(Icons.electric_car),
            label: "Past Events"
            ),
        ],
        type: BottomNavigationBarType.shifting,  
        currentIndex: _selectedIndex,   
        elevation: 5  
        ),
      body: Center(
        child: tabs.elementAt(_selectedIndex), 
      ),

      );
  }
}