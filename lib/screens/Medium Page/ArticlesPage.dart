import 'package:dsc_local/configs/assets.dart';
import 'package:dsc_local/screens/Medium%20Page/ArticleTile.dart';
import 'package:dsc_local/screens/Medium%20Page/Articles.dart';
import 'package:flutter/material.dart';

import 'articleClass.dart';

class ArticlesPage extends StatefulWidget {
  @override
  _ArticlesPageState createState() => _ArticlesPageState();
}

class _ArticlesPageState extends State<ArticlesPage> {

  List<Article> articles = <Article>[];

  Articles art = Articles();


  @override
  void initState() { 
    getArticles();
    super.initState();
  }

  getArticles() async {
    await art.getArticles();
    articles = art.articles;
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
                                  child: Container(
                    child: ListView.builder(
                        itemCount: articles.length,
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return ArticleTile(
                            author: articles[index].author,
                            title: articles[index].title,
                            url: articles[index].url,
                            urlToImage: articles[index].urlToImage,
                          );
                        }),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}