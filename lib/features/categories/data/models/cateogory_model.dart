// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:mentorship_project/features/home/data/models/products_model.dart';

class CategoryModel {
  final String catName;
  final String svgPath;
  final List<ProductModel> categoryProducts;

  CategoryModel({required this.catName, required this.svgPath, required this.categoryProducts});

  @override
  String toString() => 'CategoryModel(catName: $catName, svgPath: $svgPath, categoryProducts: $categoryProducts)';
}
