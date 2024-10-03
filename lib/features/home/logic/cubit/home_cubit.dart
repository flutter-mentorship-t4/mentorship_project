import 'package:bloc/bloc.dart';
import 'package:mentorship_project/features/home/logic/cubit/home_state.dart';


class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitialState());
}
