import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:mentorship_project/core/helpers/strings/shared_pref_keys.dart';
import 'package:mentorship_project/core/helpers/shared_pref_helper.dart';
import 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(const ThemeState.light()) {
    _loadThemeFromPreferences();
  }

  Future<void> _loadThemeFromPreferences() async {
    final isDarkTheme =
        await SharedPrefHelper.getBool(SharedPrefKeys.themeKey) ?? false;
    emit(isDarkTheme ? const ThemeState.dark() : const ThemeState.light());
  }

  Future<void> toggleTheme() async {
    state.when(
      light: () async => await _setDarkTheme(),
      dark: () async => await _setLightTheme(),
    );
  }

  Future<void> _setDarkTheme() async {
    await SharedPrefHelper.setData(SharedPrefKeys.themeKey, true);
    emit(const ThemeState.dark());
  }

  Future<void> _setLightTheme() async {
    await SharedPrefHelper.setData(SharedPrefKeys.themeKey, false);
    emit(const ThemeState.light());
  }

  ThemeData get themeData {
    return state.map(
      light: (_) => ThemeData.light(),
      dark: (_) => ThemeData.dark(),
    );
  }
}
