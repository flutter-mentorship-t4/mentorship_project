import 'package:bloc/bloc.dart';
import 'package:mentorship_project/features/checkout/logic/cubit/checkout_state.dart';

class CheckoutCubit extends Cubit<ChackoutState> {
  CheckoutCubit() : super(ChackoutInitialState());
}
