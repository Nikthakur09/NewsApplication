// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Item extends StatelessWidget {
  late String title;
  late String imageUrl;
  late String description;

  // ignore: use_key_in_widget_constructors
  Item({required this.title, required this.imageUrl, required this.description});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      
        child: Column(
      children: [
        Container(
          padding: EdgeInsets.all(5),
         
          child: Image.network(imageUrl),
        ),
        
        Padding(
          padding: EdgeInsets.all(5),
          child: Text(title),
          ),
        Padding(
          padding: EdgeInsets.all(5),
          child: Text(description)),
      ],)
      );
  }
}
