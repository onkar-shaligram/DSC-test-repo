import 'dart:convert';
import 'package:dsc_local/helpers/members.dart';
import 'package:http/http.dart' as http;


class Data {
  List<TeamMember> teamMembers = List<TeamMember> ();

  Future<void> getTeamData(String incomingUrl) async {
    String url = incomingUrl;

    var response = await http.get(url);
    print(response);
    var jsonData = jsonDecode(response.body);
    print("From Data:  $jsonData");

    jsonData['team'].forEach((element) {

          TeamMember teamMember = TeamMember();

          teamMember.title = element['title'];
          teamMember.name = element['name'];
          teamMember.link = element['link'];
          teamMember.profile = element['profile'];
          
          teamMembers.add(teamMember);
        
      });

  }

}