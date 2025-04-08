import 'package:flutter/material.dart';
import 'package:newsly_app/models/articles_model.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsDetatilsScreen extends StatefulWidget {
  NewsDetatilsScreen({Key? key, required this.articleModel, this.controller})
      : super(key: key);
  final ArticleModel articleModel;
  WebViewController? controller;

  @override
  State<NewsDetatilsScreen> createState() => _NewsDetatilsScreenState();
}

class _NewsDetatilsScreenState extends State<NewsDetatilsScreen> {
  @override
  void initState() {
    super.initState();
    widget.controller = WebViewController()
      ..loadRequest(
        Uri.parse(widget.articleModel.url!),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebViewWidget(
        controller: widget.controller!,
      ),
    );
  }
}
