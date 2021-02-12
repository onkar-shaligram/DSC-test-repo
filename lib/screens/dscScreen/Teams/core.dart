import 'package:dsc_local/configs/assets.dart';
import 'package:dsc_local/helpers/data.dart';
import 'package:dsc_local/helpers/members.dart';
import 'package:flutter/material.dart';

class CoreTeam extends StatefulWidget {
  @override
  _CoreTeamState createState() => _CoreTeamState();
}

class _CoreTeamState extends State<CoreTeam> {
  Data data = new Data();

  List<TeamMember> teamMembers = List<TeamMember>();

  @override
  void initState() {
    getTeamData();
    super.initState();
  }

  getTeamData() async {
    await data.getTeamData(
        "https://raw.githubusercontent.com/DSCVITBHOPAL/dscvitbhopal.github.io/master/data/team.json");
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
                        return DataTileCore(
                          title: teamMembers[index].title,
                          name: teamMembers[index].name,
                          link: teamMembers[index].link,
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

class DataTileCore extends StatelessWidget {
  final title, name, link, profile;
  DataTileCore({this.title, this.name, this.link, this.profile});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Card(
          elevation: 10,
          margin: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
          child: Container(
            margin: EdgeInsets.only(bottom: 18),
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      profile,
                      height: 180,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                    ),
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
