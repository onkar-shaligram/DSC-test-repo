import 'package:flutter/material.dart';

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
          elevation: 1,
          margin: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
          child: Container(
            margin: EdgeInsets.only(bottom: 18),
            //padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          name,
                          style: TextStyle(fontSize: 13),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10, right: 20),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            profile,
                            height: 180,
                            width: MediaQuery.of(context).size.width,
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
