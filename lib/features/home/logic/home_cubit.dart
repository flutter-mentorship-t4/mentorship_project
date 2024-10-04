import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentorship_project/core/networking/api_result.dart';
import 'package:mentorship_project/features/home/data/models/categories_response_model.dart';
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
    ApiResult<ProductsResponseModel> response = await productsRepo.getProducts();
    if (response is Success<ProductsResponseModel>) {
      emit(ProductsLoaded(products: response.data.products));
    } else if (response is Failure<ProductsResponseModel>) {
      emit(ProductFailure(errorMessage: response.apiErrorModel.message ?? ''));
    }
  }

  Future<void> getCategories() async {
    emit(HomeLoadingState());
    ApiResult<CategoriesResponseModel> response = await categoriesRepo.getCategories();
    if (response is Success<CategoriesResponseModel>) {
      emit(CategoriesLoaded(categories: response.data.categories));
    } else if (response is Failure<CategoriesResponseModel>) {
      emit(CategoriesFailure(errorMessage: response.apiErrorModel.message ?? ''));
    }
  }
}
