import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:newsly_app/models/articles_model.dart';
import 'package:newsly_app/services/news_services.dart';
import 'package:newsly_app/shared/widgets/news_listview.dart';
import 'package:shimmer/shimmer.dart';

class NewsListViewBuilder extends StatefulWidget {
  NewsListViewBuilder({
    super.key, required this.category,
  });
  final String category;
  @override
  State<NewsListViewBuilder> createState() => _NewsListViewBuilderState();
}

class _NewsListViewBuilderState extends State<NewsListViewBuilder> {
  // bool isLoading = true;
  // List<ArticleModel> articlesList = [];
  // void initState() {
  //   super.initState();
  //   getGeneralNews();
  // }
@override
var future;
  void initState() {
  future=NewsServices(Dio()).getGeneralNews(category:widget.category);
  super.initState();
  }
  // Future<void> getGeneralNews() async {
  //   articlesList = await NewsServices(Dio()).getGeneralNews();
  //   isLoading = false;
  //   setState(() {});
  // // }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticleModel>>(
        future:future ,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return NewsListView(articlesList: snapshot.data!);
          } else if ( snapshot.hasError) {
            return  ScaffoldMessenger(child: Text('Oops'));
          } else {
            return SliverToBoxAdapter(
               child:Center(child:CircularProgressIndicator(),));}
        });
    // return isLoading == true
    //     ? SliverToBoxAdapter(
    //         child: Center(
    //           child: CircularProgressIndicator(),
    //         ),
    //       )
    //     : articlesList.isNotEmpty?NewsListView(articlesList:articlesList):ScaffoldMessenger(child:Text('Oops'));
  }
}
