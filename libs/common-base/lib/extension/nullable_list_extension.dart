extension NullableListExtension on List? {
  bool get isNullOrEmpty => this == null || this!.isEmpty;

  bool get isNull => this == null;

  bool get isNotNull => this != null;

  bool get isNotNullOrEmpty => this != null || this!.isEmpty;
}
