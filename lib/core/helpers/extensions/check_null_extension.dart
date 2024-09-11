extension StringExtension on String? {
  bool isNullOrEmpty() => this == null || this == "";
}

extension ListExtension<T> on List<T>? {
  bool isNullOrEmpty() => this == null || this!.isEmpty;
}

extension MapExtension<K, V> on Map<K, V>? {
  bool isNullOrEmpty() => this == null || this!.isEmpty;
}
