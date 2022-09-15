class Environment {
  static isProduction() => const bool.fromEnvironment('dart.vm.product');

  static isDevelopment() => !const bool.fromEnvironment('dart.vm.product');
}
