import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  final Connectivity _connectivity;
  StreamSubscription? _connectivitySubscription;

  InternetCubit({required Connectivity connectivity})
      : _connectivity = connectivity,
        super(const InternetState.loading()) {
    monitorInternetConnection();
  }

  void monitorInternetConnection() {
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen((connectivityResult) {
      if (connectivityResult == ConnectivityResult.wifi) {
        emit(const InternetState.connected(ConnectionType.wifi));
      } else if (connectivityResult == ConnectivityResult.mobile) {
        emit(const InternetState.connected(ConnectionType.mobile));
      } else {
        emit(const InternetState.disconnected());
      }
    });
  }

  @override
  Future<void> close() {
    _connectivitySubscription?.cancel();
    return super.close();
  }
}
