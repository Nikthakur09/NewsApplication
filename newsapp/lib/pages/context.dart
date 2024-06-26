import 'package:flutter/material.dart';
import 'package:newsapp/model/newsModel.dart';

class NewsDetailPage extends StatelessWidget {
  final News news;

  const NewsDetailPage({Key? key, required this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(news.title),
      ),
      body: 
      SingleChildScrollView(child: Container(child: Text(news.content),),),
    );
  }
}
