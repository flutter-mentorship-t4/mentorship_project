import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/repos/categories_repo.dart';
import 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  final CategoriesRepo _categoriesRepo;
  CategoriesCubit(this._categoriesRepo) : super(CategoriesInitialState());
}

