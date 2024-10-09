import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/repos/cart_repo.dart';
import 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final CartRepo _cartRepo;
  CartCubit(this._cartRepo) : super(CartInitialState());
}

