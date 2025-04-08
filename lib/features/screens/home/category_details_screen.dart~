import 'package:flutter/material.dart';
import 'package:newsly_app/models/category_model.dart';
import 'package:newsly_app/widgets/news_listview_builder.dart';

class CategoryDetailsScreen extends StatefulWidget {
  const CategoryDetailsScreen({super.key, required this.catName});
  final String catName;
  @override
  State<CategoryDetailsScreen> createState() => _CategoryDetailsScreenState();
}

class _CategoryDetailsScreenState extends State<CategoryDetailsScreen> {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title:Text(widget.catName,style:TextStyle(fontSize:25,fontWeight:FontWeight.w800),),centerTitle:true,),
      body:CustomScrollView(

        slivers: [
          NewsListViewBuilder(category:widget.catName)
        ],
      ),
    );
  }
}
