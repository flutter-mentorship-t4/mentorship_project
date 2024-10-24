import 'package:bloc/bloc.dart';

import '../../../categories/logic/products_cubit/products_state.dart';
import '../../../home/logic/home_cubit.dart';
import 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final HomeCubit homeCubit;

  SearchCubit({required this.homeCubit}) : super(SearchInitial());

  void searchProducts(String query) {
    if (query.isEmpty) {
      emit(SearchInitial());
      return;
    }

    emit(SearchLoading());

    // Get products from HomeCubit
    final currentState = homeCubit.state;
    if (currentState case ProductsLoaded(products: final products)) {
      final searchResults = products.where((product) {
        final name = product.title.toLowerCase();
        final searchLower = query.toLowerCase();
        return name.contains(searchLower);
      }).toList();

      if (searchResults.isEmpty) {
        emit(SearchEmpty());
      } else {
        emit(SearchSuccess(searchResults));
      }
    }
  }
}
