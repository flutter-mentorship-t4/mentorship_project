import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentorship_project/core/networking/api_result.dart';
import 'package:mentorship_project/features/home/data/models/products_response_model.dart';
import 'package:mentorship_project/features/home/data/repos/categories_repo.dart';
import 'package:mentorship_project/features/home/data/repos/products_repo.dart';

import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final ProductsRepo productsRepo;
  final CategoriesRepo categoriesRepo;
  HomeCubit(this.productsRepo, this.categoriesRepo) : super(HomeInitialState());

  Future<void> getProducts() async {
    emit(HomeLoadingState());
    var response = await productsRepo.getProducts();
    if (response is Success<List<ProductModel>>) {
      emit(ProductsLoaded(products: response.data));
    } else if (response is Failure<List<ProductModel>>) {
      emit(ProductFailure(errorMessage: response.apiErrorModel.message ?? ''));
    }
  }

  Future<void> getCategories() async {
    emit(HomeLoadingState());
    ApiResult<List<String>> response = await categoriesRepo.getCategories();
    if (response is Success<List<String>>) {
      emit(CategoriesLoaded(categories: response.data));
    } else if (response is Failure<List<String>>) {
      emit(CategoriesFailure(errorMessage: response.apiErrorModel.message ?? ''));
    }
  }
}
