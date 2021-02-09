import 'package:dsc_local/configs/assets.dart';
import 'package:flutter/material.dart';

class RequestEventForm extends StatefulWidget {
  @override
  _RequestEventFormState createState() => _RequestEventFormState();
}

class _RequestEventFormState extends State<RequestEventForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            SizedBox(height: 20,),
            Expanded(
              flex: 8,
              child: Container(
                
              ),
            )
          ],
        ),
      ),
    );
  }
}