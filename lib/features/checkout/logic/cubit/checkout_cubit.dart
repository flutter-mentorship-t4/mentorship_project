import 'package:bloc/bloc.dart';

import 'checkout_state.dart';

class CheckoutCubit extends Cubit<ChackoutState> {
  CheckoutCubit() : super(ChackoutInitialState());
}
