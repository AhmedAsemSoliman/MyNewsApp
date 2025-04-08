import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:newsly_app/models/articles_model.dart';
import 'package:newsly_app/services/news_services.dart';
import 'package:newsly_app/shared/widgets/news_item.dart';

class NewsListView extends StatefulWidget {
   NewsListView({
    super.key,required this.articlesList});
final  List<ArticleModel> articlesList;

  @override
  State<NewsListView> createState() => _NewsListViewState();
}

class _NewsListViewState extends State<NewsListView> {
 // bool isLoading = true;
  @override
  // void initState() {
  //   super.initState();
  //    getGeneralNews();
  // }

  // Future<void> getGeneralNews() async {
  //   articlesList = await NewsServices(Dio()).getGeneralNews();
  //   isLoading=false;
  //   setState(() {
  //
  //   });
  // }

  Widget build(BuildContext context) {
  //  isLoading=false;
    return SliverList(
            delegate: SliverChildBuilderDelegate(
            childCount: widget.articlesList.length,
            (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal:12,vertical:8),
                child: NewsItem(articleModel:widget.articlesList[index]),
              );
            },
          ));
  }
}
