import 'package:dsc_local/configs/assets.dart';
import 'package:flutter/material.dart';

class AboutDSC extends StatefulWidget {
  @override
  _AboutDSCState createState() => _AboutDSCState();
}

class _AboutDSCState extends State<AboutDSC> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Expanded(
            //   flex: 1,
            //   child: Container(
            //     child: Center(child: Image.asset(Assets.vitb_dsc_logo)),
            //   ),
            // ),
            SizedBox(height: 20,),
            Image.asset(Assets.vitb_dsc_logo, fit: BoxFit.fitWidth, width: 300,),
            SizedBox(height: 80,),
            Expanded(
              flex: 8,
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text("We at DSC — VIT Bhopal look forward to form a community where we are able to convert our knowledge into real time application, help each student to develop in different fields of technology and make use of our knowledge to build something that helps local businesses around us as well as their community.", style: TextStyle(fontSize: 20, letterSpacing: 1.2), ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
