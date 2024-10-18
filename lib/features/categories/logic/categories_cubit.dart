import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/networking/api_result.dart';
import '../../home/data/models/products_model.dart';
import '../data/models/cateogory_model.dart';
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

  Future<void> getCategories() async {
    emit(CategoriesLoadingState());
    final result = await _categoriesRepo.getCategories();
    if (result is Success<List<CategoryModel>>) {
      // emit(CategoriesLoaded(categories: result.data));
      final categories = result.data;
      if (categories.isNotEmpty) {
        // Automatically select the first category
        await selectCategory(categories.first.name);
      } else {
        emit(CategoriesLoaded(categories: categories));
      }
    } else if (result is Failure<List<CategoryModel>>) {
      emit(CategoriesErrorState(result.apiErrorModel.message ?? ''));
    }
  }

  Future<void> selectCategory(String categoryName) async {
    List<CategoryModel> categories;
    if (state is CategoriesLoaded) {
      categories = (state as CategoriesLoaded).categories;
    } else if (state is CategorySelected) {
      categories = (state as CategorySelected).categories;
    } else if (state is ProductsLoaded) {
      categories = (state as ProductsLoaded).categories;
    } else if (state is ProductsLoadingState) {
      categories = (state as ProductsLoadingState).categories;
    } else if (state is ProductsErrorState) {
      categories = (state as ProductsErrorState).categories;
    } else {
      // If we're in an unexpected state, we can't proceed
      return;
    }

    emit(CategorySelected(categories: categories, selectedCategory: categoryName));
    await getProductsByCategory(categoryName);
  }

  Future<void> getProductsByCategory(String categoryName) async {
    emit(ProductsLoadingState(
      categories: (state as CategorySelected).categories,
      selectedCategory: categoryName,
    ));

    final result = await _categoriesRepo.getProductsByCategory(categoryName);
    if (result is Success<List<ProductModel>>) {
      emit(ProductsLoaded(
        categories: (state as ProductsLoadingState).categories,
        selectedCategory: categoryName,
        products: result.data,
      ));
    } else if (result is Failure<List<ProductModel>>) {
      emit(ProductsErrorState(
        categories: (state as ProductsLoadingState).categories,
        selectedCategory: categoryName,
        errorMessage: result.apiErrorModel.message ?? '',
      ));
    }
  }
}
