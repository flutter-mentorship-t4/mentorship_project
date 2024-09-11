import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AppLocalization {
  static const Locale englishLocale = Locale('en');
  static const Locale arabicLocale = Locale('ar');

  static Future<void> changeLanguage(BuildContext context) async {
    final easyLocalization = EasyLocalization.of(context)!;
    final isEnglish = easyLocalization.currentLocale == englishLocale;

    final newLocale = isEnglish ? arabicLocale : englishLocale;
    await easyLocalization.setLocale(newLocale);
  }
}
