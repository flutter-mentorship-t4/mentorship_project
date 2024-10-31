import '../../../../core/helpers/strings/app_icons.dart';
import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_error_model.dart';
import '../../../../core/networking/api_result.dart';
import '../../../home/data/models/products_model.dart';
import '../apis/categories_api_service.dart';
import '../models/cateogory_model.dart';

class CategoriesRepo {
  final CategoriesApiService _apiService;

  CategoriesRepo(this._apiService);

  // Maps category names to SVG paths for icon display.
  static final Map<String, String> categorySvgPaths = {
    "electronics": AppIcons.catElectronics,
    "jewelery": AppIcons.catJewelry,
    "men's clothing": AppIcons.catMenClothes,
    "women's clothing": AppIcons.catWomenClothes,
  };

  Future<ApiResult<List<CategoryModel>>> getCategories() async {
    try {
      final List<String> categoryNames = await _apiService.getCategories();

      final List<CategoryModel> categories = categoryNames
          .map(
            (name) => CategoryModel(
              catName: name,
              svgPath: categorySvgPaths[name] ?? AppIcons.defaultCategoryIcon, // Use default icon if category is missing
              categoryProducts: [],
            ),
          )
          .toList();

      return ApiResult.success(categories);
    } catch (e) {
      return ApiResult.failure(ApiErrorModel(message: e.toString()));
    }
  }

  Future<ApiResult<List<ProductModel>>> getProductsByCategory(String category) async {
    try {
      final response = await _apiService.getProductsByCategory(category);
      await Future.delayed(const Duration(milliseconds: 800));
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
