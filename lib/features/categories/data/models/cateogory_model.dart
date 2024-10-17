import 'package:mentorship_project/features/home/data/models/products_model.dart';

class CategoryModel {
  final String name;
  final String svgPath;
  final List<ProductModel> categoryProducts;

  CategoryModel(this.categoryProducts, {required this.name, required this.svgPath});
}
