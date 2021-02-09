import 'package:dsc_local/configs/assets.dart';
import 'package:dsc_local/helpers/data.dart';
import 'package:dsc_local/helpers/members.dart';
import 'package:flutter/material.dart';

class Team extends StatefulWidget {
  @override
  _TeamState createState() => _TeamState();
}

class _TeamState extends State<Team> {

  Data data = new Data();

  List<TeamMember> teamMembers = List<TeamMember>();

  @override
  void initState() {
    getTeamData();
    super.initState();
  }

  getTeamData() async {
    await data.getTeamData();
    teamMembers = data.teamMembers;
    setState(() {
      
    });
  }

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
          child: ListView.builder(
              itemCount: teamMembers.length,
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemBuilder: (context, index) {
                return DataTile(
                  title: teamMembers[index].title,
                  name: teamMembers[index].name,
                  link: teamMembers[index].link,
                  //profile: teamMembers[index].profile,
                );
              }),
        ))
          ],
        ),
      ),
    );
  }
}

class DataTile extends StatelessWidget {
  final title, name, link, profile;
  DataTile({this.title, this.name, this.link, this.profile});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Card(
          color: Colors.white70,
          elevation: 10,
          shadowColor: Colors.blueAccent,
          //margin: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
          child: Container(
            margin: EdgeInsets.only(bottom: 18),
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    // child: Image.network(
                    //   profile,
                    //   height: 180,
                    //   width: MediaQuery.of(context).size.width,
                    //   fit: BoxFit.cover,
                    // ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  title,
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  name,
                  style: TextStyle(fontSize: 13),
                ),
                // Text(
                //   link,
                //   style: TextStyle(fontSize: 13),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}