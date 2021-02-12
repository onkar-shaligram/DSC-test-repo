import 'package:dsc_local/configs/assets.dart';
import 'package:dsc_local/helpers/data.dart';
import 'package:dsc_local/helpers/members.dart';
import 'package:flutter/material.dart';

import '../dataTile.dart';

class MLTeam extends StatefulWidget {
  @override
  _MLTeamState createState() => _MLTeamState();
}

class _MLTeamState extends State<MLTeam> {
  Data data = new Data();

  List<TeamMember> teamMembers = List<TeamMember>();

  @override
  void initState() {
    getTeamData();
    super.initState();
  }

  getTeamData() async {
    await data.getTeamData(
        "https://raw.githubusercontent.com/DSCVITBHOPAL/dscvitbhopal.github.io/master/data/team/ml-team.json");
    teamMembers = data.teamMembers;
    setState(() {});
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
            SizedBox(
              height: 20,
            ),
            Expanded(
                flex: 8,
                child: Container(
                  child: ListView.builder(
                      itemCount: teamMembers.length,
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return DataTile(
                          //title: teamMembers[index].title,
                          name: teamMembers[index].name,
                          //link: teamMembers[index].link,
                          profile: teamMembers[index].profile,
                        );
                      }),
                ))
          ],
        ),
      ),
    );
  }
}