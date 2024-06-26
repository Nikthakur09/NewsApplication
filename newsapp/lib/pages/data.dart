import 'package:flutter/material.dart';
import 'package:newsapp/pages/newsCard.dart';
import 'package:newsapp/services/services.dart';
import '../model/newsModel.dart';

class NewsApp extends StatefulWidget {
  const NewsApp({super.key});

  @override
  State<NewsApp> createState() => _NewsAppState();
}

class _NewsAppState extends State<NewsApp> {
  NewsService service = NewsService();
  List<News> news = [];

  @override
  void initState() {
    super.initState();
    service.getProducts().then((List<News> news) {
      setState(() {
        this.news = news;
      });
    }).catchError((err) => print("Error is $err"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "News",
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            Text(
              "Paper",
              style: TextStyle(color: Colors.blue, fontSize: 20),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(),
            ),
            child: const TextField(
              textInputAction: TextInputAction.search,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: "Search here",
              ),
            ),
          ),
          const Divider(height: 5, color: Colors.grey),
          Expanded(
            child: news.isEmpty
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: news.length,
                    itemBuilder: (context, index) {
                      return NewsCard(news: news[index]);
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

