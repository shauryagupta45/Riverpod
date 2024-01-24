// ignore_for_file: unused_import, avoid_web_libraries_in_flutter, avoid_print

import 'dart:html';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoggerRiverpod extends ProviderObserver {
  @override
  void didUpdateProvider(ProviderBase provider, Object? previousValue,
      Object? newValue, ProviderContainer container) {
    print('$provider $previousValue $newValue $container');
  }

  @override
  void didAddProvider(
      ProviderBase provider, Object? value, ProviderContainer container) {}

  @override
  void didDisposeProvider(ProviderBase provider, ProviderContainer container) {}
}
