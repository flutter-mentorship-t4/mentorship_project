import 'package:mentorship_project/core/helpers/strings/app_icons.dart';

import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../../home/data/models/products_model.dart';
import '../apis/categories_api_service.dart';
import '../models/cateogory_model.dart';

class CategoriesRepo {
  final CategoriesApiService _apiService;

  CategoriesRepo(this._apiService);

  // Static list of categories with their corresponding image URLs
  static final List<CategoryModel> categories = [
    CategoryModel(name: "electronics", imagePath: AppIcons.catElectronics),
    CategoryModel(name: "jewelery", imagePath: AppIcons.catJewelry),
    CategoryModel(name: "men's clothing", imagePath: AppIcons.catMenClothes),
    CategoryModel(name: "women's clothing", imagePath: AppIcons.catWomenClothes),
  ];

  // Future<ApiResult<List<String>>> getCategories() async {
  //   try {
  //     final response = await _apiService.getCategories();
  //     return ApiResult.success(response);
  //   } catch (error) {
  //     return ApiResult.failure(ApiErrorHandler.handle(error));
  //   }
  // }
  // Method to get the static list of categories
  List<CategoryModel> getCategories() {
    return categories;
  }

  Future<ApiResult<List<ProductModel>>> getProductsByCategory(String category) async {
    try {
      final response = await _apiService.getProductsByCategory(category);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
