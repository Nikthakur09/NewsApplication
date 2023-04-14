import 'package:dio/dio.dart';
import 'package:newsapp/infra/apiclient.dart';

import '../model/newsModel.dart';

class NewsService {
   ApiClient apiClient = ApiClient();
  Future<List<News>> getProducts() async {
    // 1. Make a Network call
    // 2. It hit the API
    // 3. Grab the JSON
    // 4. Convert JSON into Object
    Response response =
        await apiClient.get('https://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=b278c3b03b0b444289c966ca03b9d457');
   // print("Response is ");
    //print(response.data);
   // print(response.data.runtimeType);
    List<dynamic> list = response.data['articles'];
    List<News> news = list.map((m) => News.fromJSON(m)).toList();
   // print(news);
    return news;

  }

}
