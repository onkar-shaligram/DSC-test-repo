import 'package:dsc_local/configs/assets.dart';
import 'package:dsc_local/helpers/data.dart';
import 'package:dsc_local/helpers/members.dart';
import 'package:dsc_local/screens/dscScreen/Teams/android.dart';
import 'package:dsc_local/screens/dscScreen/Teams/content.dart';
import 'package:dsc_local/screens/dscScreen/Teams/core.dart';
import 'package:dsc_local/screens/dscScreen/Teams/design.dart';
import 'package:dsc_local/screens/dscScreen/Teams/management.dart';
import 'package:dsc_local/screens/dscScreen/Teams/ml.dart';
import 'package:dsc_local/screens/dscScreen/Teams/web.dart';
import 'package:flutter/material.dart';

import 'dataTile.dart';

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
                child: SingleChildScrollView(
                  physics: ClampingScrollPhysics(),
                  child: Container(
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CoreTeam()));
                          },
                          child: Card(
                            child: Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                image: NetworkImage(
                                    "https://pbs.twimg.com/profile_images/1168494324419420160/g1caxFZO_400x400.png"),
                                fit: BoxFit.cover,
                                colorFilter: new ColorFilter.mode(
                                    Colors.black.withOpacity(0.2),
                                    BlendMode.dstATop),
                              )),
                              height: 100,
                              width: MediaQuery.of(context).size.width - 20,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Core", style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700, ),),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AndroidTeam()));
                          },
                          child: Card(
                            child: Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                image: NetworkImage(
                                    "https://sm.pcmag.com/pcmag_in/news/a/a-wallpape/a-wallpaper-can-crash-some-android-10-phones_hqyw.jpg"),
                                fit: BoxFit.cover,
                                colorFilter: new ColorFilter.mode(
                                    Colors.black.withOpacity(0.2),
                                    BlendMode.dstATop),
                              )),
                              height: 100,
                              width: MediaQuery.of(context).size.width - 20,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Android", style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700, ),),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => WebTeam()));
                          },
                          child: Card(
                            child: Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                image: NetworkImage(
                                    "https://cdn.wallpapersafari.com/53/98/sGXcZE.jpg"),
                                fit: BoxFit.cover,
                                colorFilter: new ColorFilter.mode(
                                    Colors.black.withOpacity(0.2),
                                    BlendMode.dstATop),
                              )),
                              height: 100,
                              width: MediaQuery.of(context).size.width - 20,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Web", style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700, ),),
                                ],
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ContentTeam()));
                          },
                          child: Card(
                            child: Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                image: NetworkImage(
                                    "https://pbs.twimg.com/profile_images/1168494324419420160/g1caxFZO_400x400.png"),
                                fit: BoxFit.cover,
                                colorFilter: new ColorFilter.mode(
                                    Colors.black.withOpacity(0.2),
                                    BlendMode.dstATop),
                              )),
                              height: 100,
                              width: MediaQuery.of(context).size.width - 20,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Content", style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700, ),),
                                ],
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DesignTeam()));
                          },
                          child: Card(
                            child: Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                image: NetworkImage(
                                    "https://pbs.twimg.com/profile_images/1168494324419420160/g1caxFZO_400x400.png"),
                                fit: BoxFit.cover,
                                colorFilter: new ColorFilter.mode(
                                    Colors.black.withOpacity(0.2),
                                    BlendMode.dstATop),
                              )),
                              height: 100,
                              width: MediaQuery.of(context).size.width - 20,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Design", style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700, ),),
                                ],
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MgmtTeam()));
                          },
                          child: Card(
                            child: Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                image: NetworkImage(
                                    "https://pbs.twimg.com/profile_images/1168494324419420160/g1caxFZO_400x400.png"),
                                fit: BoxFit.cover,
                                colorFilter: new ColorFilter.mode(
                                    Colors.black.withOpacity(0.2),
                                    BlendMode.dstATop),
                              )),
                              height: 100,
                              width: MediaQuery.of(context).size.width - 20,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Management", style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700, ),),
                                ],
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MLTeam()));
                          },
                          child: Card(
                            child: Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                image: NetworkImage(
                                    "https://pbs.twimg.com/profile_images/1168494324419420160/g1caxFZO_400x400.png"),
                                fit: BoxFit.cover,
                                colorFilter: new ColorFilter.mode(
                                    Colors.black.withOpacity(0.2),
                                    BlendMode.dstATop),
                              )),
                              height: 100,
                              width: MediaQuery.of(context).size.width - 20,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("ML", style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700, ),),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
