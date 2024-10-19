sealed class ChackoutState {}

class ChackoutInitialState extends ChackoutState {}

class ChackoutLoadingState extends ChackoutState {}

class ChackoutSuccessState<T> extends ChackoutState {
  final T data;
  ChackoutSuccessState(this.data);
}

class ChackoutErrorState extends ChackoutState {}
