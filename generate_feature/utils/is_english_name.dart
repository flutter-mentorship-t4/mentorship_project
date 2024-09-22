bool isEnglishName(String name) {
  final englishRegex = RegExp(r'^[a-zA-Z0-9_]+$');
  return englishRegex.hasMatch(name);
}
