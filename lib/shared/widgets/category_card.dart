import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsly_app/features/screens/home/category_details_screen.dart';
import 'package:newsly_app/models/category_model.dart';

class CategoryCard extends StatelessWidget {
 final CategoryModel categoryModel;
  const CategoryCard({
    super.key, required this.categoryModel,
  });

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        GestureDetector(
          onTap:(){
            Navigator.of(context).push(MaterialPageRoute(builder:(context){
              return CategoryDetailsScreen(catName:categoryModel.categoryName!,);
            }));
          },
          child: Container(
            height: 100,
            width: 200,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('${categoryModel.image}'),
                    fit: BoxFit.fill),
                borderRadius: BorderRadius.circular(16)),
            /*
            child: Center(
              child: Text(
                'busniess',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,color:Colors.red),
              ),
            ),
            */
          ),
        ),
        SizedBox(height:10,) ,
        Center(
            child: Text(
          '${categoryModel.categoryName}',
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.red),
        ))
      ],
    );
  }
}
