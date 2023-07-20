import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_api_simple_call/screen/home_screen/model/news_model.dart';

class Apihelper {
  Future<NewsModel> Get_Api() async {
    String link =
        "https://newsapi.org/v2/everything?q=tesla&from=2023-06-20&sortBy=publishedAt&apiKey=ad77504c4ebc4845902fe7103719999b";
    var response = await http.get(Uri.parse(link));
    var json = jsonDecode(response.body);

    NewsModel newsModel = NewsModel.fromJson(json);

    return newsModel;
  }
}
