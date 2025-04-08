import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:newsly_app/features/screens/home/news_item_details.dart';
import 'package:newsly_app/models/articles_model.dart';
import 'package:shimmer/shimmer.dart';

class NewsItem extends StatefulWidget {
  const NewsItem({super.key, required this.articleModel});
  final ArticleModel articleModel;
  @override
  State<NewsItem> createState() => _NewsItemState();
}

class _NewsItemState extends State<NewsItem> {
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
       // loadingIndicator();
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return NewsDetatilsScreen(articleModel: widget.articleModel,);
        }));
      },
      child: Column(
        //mainAxisSize:MainAxisSize.max,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: widget.articleModel.image != null
                  ? Image.network(widget.articleModel.image.toString())
                  : Shimmer.fromColors(
                  baseColor: Colors.black,
                  highlightColor: Colors.white,
                  child: Container())),
          widget.articleModel.title != null
              ? Text(
            widget.articleModel.title.toString(),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          )
              : Shimmer.fromColors(
              baseColor: Colors.black,
              highlightColor: Colors.white,
              child: Text('')),
          SizedBox(
            height: 5,
          ),
          widget.articleModel.descption != null
              ? Text(
            widget.articleModel.descption.toString(),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Colors.grey),
          )
              : Shimmer.fromColors(
              baseColor: Colors.black,
              highlightColor: Colors.white,
              child: Text('')),
        ],
      ),
    );
  }

}