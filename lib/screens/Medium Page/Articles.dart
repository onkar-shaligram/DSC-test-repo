import 'dart:convert';

import 'package:dsc_local/screens/Medium%20Page/articleClass.dart';
import 'package:http/http.dart' as http;

class Articles {

  List<Article> articles = <Article>[];

  Future <void> getArticles() async {
    String url = "https://api.rss2json.com/v1/api.json?rss_url=https://medium.com/feed/dsc-vit-bhopal";

    var response = await http.get(url);
    print(response);

    var jsonData = jsonDecode(response.body);
    print(jsonData);

    if(jsonData['status'] == 'ok') {
      jsonData['items'].forEach((element) {
        Article article = Article();

        article.title = element['title'];
        article.author = element['author'];
        article.url = element['link'];
        article.urlToImage = element['thumbnail'];

        articles.add(article);
      });
    }
  }

    Future <void> getArticlesFromSearch(String search) async {
    String url = "https://api.rss2json.com/v1/api.json?rss_url=https://medium.com/feed/dsc-vit-bhopal";

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if(jsonData['status'] == 'ok') {
      jsonData['items'].forEach((element) {
        Article article = Article();

        article.title = element['title'];
        article.author = element['author'];
        article.url = element['link'];
        article.urlToImage = element['thumbnail'];

        if(article.title == search || article.author == search) {
          articles.add(article);
        }
        
      });
    }
  }
}