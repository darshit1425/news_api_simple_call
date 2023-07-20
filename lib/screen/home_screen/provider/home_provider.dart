import 'package:flutter/widgets.dart';
import 'package:news_api_simple_call/screen/home_screen/model/news_model.dart';

import '../../../utils/api_helper.dart';

class HomeProvider extends ChangeNotifier {

  Future<NewsModel> getCoronaData() async {
    Apihelper apihelper = Apihelper();
    NewsModel newsModel = await apihelper.Get_Api();
    return newsModel;
  }

}