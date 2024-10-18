import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/networking/api_result.dart';
import '../../data/models/cateogory_model.dart';
import '../../data/repos/categories_repo.dart';
import 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  final CategoriesRepo _categoriesRepo;

  CategoriesCubit(this._categoriesRepo) : super(CategoriesInitial()) {
    getCategories();
  }
  Future<void> getCategories() async {
    emit(CategoriesLoading());
    final result = await _categoriesRepo.getCategories();
    if (result is Success<List<CategoryModel>>) {
      emit(CategoriesLoaded(categories: result.data));
    } else if (result is Failure<List<CategoryModel>>) {
      emit(CategoriesError(result.apiErrorModel.message ?? ''));
    }
  }
}
