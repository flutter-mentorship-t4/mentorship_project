// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, avoid_renaming_method_parameters

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> ar = {
  "Authentication": {
    "name": "الاسم",
    "email": "البريد الالكتروني"
  },
  "ProductDetailsScreen": {
    "ProductDetailsScreen": "شاشة تفاصيل المنتج",
    "ProductColor": ":اللون",
    "Best": "الأفضل",
    "ProductSize": "الحجم"
  },
  "hello": "مرحبًا بك"
};
static const Map<String,dynamic> en = {
  "Authentication": {
    "name": "Name",
    "email": "Email"
  },
  "ProductDetailsScreen": {
    "ProductDetailsScreen": "Product Details Screen",
    "ProductColor": "Color:",
    "Best": "Best:",
    "ProductSize": "Product Size"
  },
  "hello": "Hello"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"ar": ar, "en": en};
}
