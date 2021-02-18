import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleTile extends StatelessWidget {
  final String title, url, urlToImage, author;
  ArticleTile({this.title, this.url, this.urlToImage, this.author});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        String link = url.toString();
        if (await canLaunch(link)) {
          await launch(link);
        } else {
          throw 'Could not launch $link';
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Container(
            child: Stack(
              children: [
                CachedNetworkImage(
                  imageUrl: urlToImage,
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                              Colors.black54, BlendMode.darken)),
                    ),
                  ),
                ),
                Container(
                  color: Colors.transparent,
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        author,
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
