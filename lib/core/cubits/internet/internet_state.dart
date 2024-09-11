import 'package:freezed_annotation/freezed_annotation.dart';

part 'internet_state.freezed.dart';

@freezed
class InternetState with _$InternetState {
  const factory InternetState.loading() = _Loading;
  const factory InternetState.connected(ConnectionType connectionType) = _Connected;
  const factory InternetState.disconnected() = _Disconnected;
}

enum ConnectionType { wifi, mobile }