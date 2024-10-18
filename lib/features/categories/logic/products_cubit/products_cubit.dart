import 'package:bloc/bloc.dart';

import '../../../../core/networking/api_result.dart';
import '../../../home/data/models/products_model.dart';
import '../../data/repos/categories_repo.dart';
import 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final CategoriesRepo _categoriesRepo;

  ProductsCubit(this._categoriesRepo) : super(ProductsInitial());

  Future<void> loadProductsByCategory(String categoryName) async {
    emit(ProductsLoading());

    final result = await _categoriesRepo.getProductsByCategory(categoryName);
    if (result is Success<List<ProductModel>>) {
      emit(ProductsLoaded(products: result.data));
    } else if (result is Failure<List<ProductModel>>) {
      emit(ProductsError(result.apiErrorModel.message ?? ''));
    }
  }
}
