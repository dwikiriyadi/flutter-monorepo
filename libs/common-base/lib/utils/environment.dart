class Environment {
  static bool isProduction() => const bool.fromEnvironment('dart.vm.product');

  static bool isDevelopment() => !const bool.fromEnvironment('dart.vm.product');
}
