

class CategoryModel{
  final String? image;
  final String? categoryName;

  CategoryModel({required this.image,required this.categoryName});

  // factory CategoryModel.fromJson(Map<String,dynamic>json){
  //   return CategoryModel(image:json[''] , categoryName:json[''] );
  // }
}