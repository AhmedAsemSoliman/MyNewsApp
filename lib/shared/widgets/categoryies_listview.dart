import 'package:flutter/material.dart';
import 'package:newsly_app/models/category_model.dart';
import 'package:newsly_app/shared/widgets/category_card.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<CategoryModel> categories = [
      CategoryModel(
          image: 'assets/images/busniess.png', categoryName: 'Business'),
      CategoryModel(
          image: 'assets/images/entertainment.png',
          categoryName: 'Entertainment'),
      CategoryModel(
          image: 'assets/images/health.png', categoryName: 'Health'),
      CategoryModel(image: 'assets/images/sports.png', categoryName: 'Sports'),
      CategoryModel(
          image: 'assets/images/technology.png', categoryName: 'Technology'),
      CategoryModel(
          image: 'assets/images/science.png', categoryName: 'Science'),
      CategoryModel(image: 'assets/images/general.png', categoryName: 'General')
    ];
    return SizedBox(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: CategoryCard(
                categoryModel: categories[index],
              ));
        },
      ),
    );
  }
}
