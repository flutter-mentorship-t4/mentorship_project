import 'package:freezed_annotation/freezed_annotation.dart';

part 'theme_state.freezed.dart';

@freezed
class ThemeState with _$ThemeState {
  const factory ThemeState.light() = _Light;
  const factory ThemeState.dark() = _Dark;
}
