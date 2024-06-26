import 'package:flutter/material.dart';
import 'package:newsapp/model/newsModel.dart';
import 'package:newsapp/pages/context.dart';

class NewsCard extends StatelessWidget {
  final News news;

  const NewsCard({Key? key, required this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NewsDetailPage(news: news),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            news.imageUrl != '_'
                ? Center(
                  child: Container(
                    height: 300,
                    child: Image.network(
                        news.imageUrl,
                        errorBuilder: (context, error, stackTrace) {
                          return Center(
                            child: Container(
                              height: 300,
                              child: Image.network(
                                  "https://res.cloudinary.com/benjamincrozat-com/image/fetch/c_scale,f_webp,q_auto,w_1200/https://life-long-bunny.fra1.digitaloceanspaces.com/media-library/production/190/DP8uQOKxgSB13dgrgkAeVyUPpoYS1B-metaZXJyb3JzLmpwZw%3D%3D-.jpg"),
                            ),
                          );
                        },
                      ),
                  ),
                )
                : Container(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                news.title,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(news.description),
            ),
          ],
        ),
      ),
    );
  }
}
