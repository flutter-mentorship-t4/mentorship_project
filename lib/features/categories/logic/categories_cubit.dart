import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/networking/api_result.dart';
import '../../home/data/models/products_model.dart';
import '../data/repos/categories_repo.dart';
import 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  final CategoriesRepo _categoriesRepo;
  CategoriesCubit(this._categoriesRepo) : super(CategoriesInitialState());

  // Future<void> getCategories() async {
  //   emit(CategoriesLoadingState());
  //   ApiResult<List<String>> response = await _categoriesRepo.getCategories();
  //   if (response is Success<List<String>>) {
  //     emit(CategoriesLoaded(categories: response.data));
  //   } else if (response is Failure<List<String>>) {
  //     emit(CategoriesErrorState(response.apiErrorModel.message ?? ''));
  //   }
  // }

  void getCategories() {
    final categories = _categoriesRepo.getCategories();
    emit(CategoriesLoaded(categories: categories));
  }

  Future<void> selectCategory(String category) async {
    if (state is CategoriesLoaded) {
      final currentState = state as CategoriesLoaded;
      emit(CategorySelected(
        categories: currentState.categories,
        selectedCategory: category,
      ));
      await getProductsByCategory(category);
    }
  }

  Future<void> getProductsByCategory(String category) async {
    emit(ProductsLoadingState());
    ApiResult<List<ProductModel>> response = await _categoriesRepo.getProductsByCategory(category);
    if (response is Success<List<ProductModel>>) {
      emit(ProductsLoaded(products: response.data));
    } else if (response is Failure<List<ProductModel>>) {
      emit(ProductsErrorState(response.apiErrorModel.message ?? ''));
    }
  }
}
