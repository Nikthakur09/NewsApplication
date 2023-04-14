import 'package:flutter/material.dart';
import 'package:newsapp/services/services.dart';
import 'package:newsapp/widgets/item.dart';

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
    // TODO: implement initState
    super.initState();
    
    Future<List<News>> future = service.getProducts();
    future.then((List<News> news) {
      this.news= news;
      setState(() {
        // setState will call build,
        // build will print the things
      });
    }).catchError((err) => print("Error is $err"));
    //  future.then().catchError();
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
            )
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body:SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 5,right: 5,top: 5),
              decoration: BoxDecoration(
        
                borderRadius: BorderRadius.circular(10),
                border: Border.all(),
                
              ),
            child: 
            const TextField(
              textInputAction: TextInputAction.search,
              decoration: InputDecoration(
                
                prefixIcon: Icon(Icons.search),
                hintText: "Search here"
              ),
            ),
            ),
          const Divider(
            height: 5,color:Colors.grey ,
          ),
        //   Container(
        // child: Image.network("https://thumbs.dreamstime.com/b/news-9994192.jpg")
        //   ),
           Wrap(
             children: news.map((e) => Item(title: e.title, imageUrl: e.imageUrl, description: e.description)).toList(),
             ),
          
          ],
           ),
          ), 
      
    );
  }
}
