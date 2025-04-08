import 'package:flutter/material.dart';
import 'package:newsly_app/shared/widgets/categoryies_listview.dart';
import 'package:newsly_app/shared/widgets/news_listview_builder.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'News',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                'Cloud',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.orange),
              ),
            ],
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 12,
          ),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: CategoryListView()),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 32,
                ),
              ),
              NewsListViewBuilder(category: 'general')
            ],
          ),
        )

        /*    Column(
          children: [


          ],
        )
     */
        );
  }
}
