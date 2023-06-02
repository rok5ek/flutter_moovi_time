import 'package:flutter/material.dart';

extension SystemThemeMode on WidgetsBinding {
  ThemeMode get systemThemeMode {
    return WidgetsBinding.instance.platformDispatcher.platformBrightness == Brightness.dark
        ? ThemeMode.dark
        : ThemeMode.light;
  }
}
