import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:mentorship_project/features/home/logic/home_state.dart';

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

    final currentState = homeCubit.state;
    debugPrint('Current state type: ${currentState.runtimeType}');
    debugPrint('Current state: $currentState');

    // First let's check if we can access the state normally
    if (currentState is ProductsLoaded) {
      debugPrint('State is ProductsLoaded');
      // Print available properties
      debugPrint('Available properties: ${currentState.toString()}');

      // Try to access products
      final searchResults = currentState.allProducts.where((product) {
        final name = product.title.toLowerCase();
        final searchLower = query.toLowerCase();
        return name.contains(searchLower);
      }).toList();

      if (searchResults.isEmpty) {
        emit(SearchEmpty());
      } else {
        emit(SearchSuccess(searchResults));
      }
    } else {
      debugPrint('State is not ProductsLoaded, it is: ${currentState.runtimeType}');
    }
  }
}
