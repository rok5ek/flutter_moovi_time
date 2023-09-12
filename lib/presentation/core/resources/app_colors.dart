import 'dart:ui';

abstract class AppColors {
  static const transparent = Color(0x00000000);
  static const black = const Color(0xFF000000);
  static const primary = const Color(0xFF1F4AFF);
  static const secondary = const Color(0xFF5273FF);

  // accent light with 25% opacity
  static const accentLight25 = const Color(0x40B9C6FF);
  static const accent = primary;
  static const accentMedium = secondary;
  static const accentLight = const Color(0xFFB9C6FF);
  static const border = secondary;
  static const background = white;
  static const white = const Color(0xFFFFFFFF);
  static const greenLight = const Color(0xFFE7F7F3);
  static const green = const Color(0xFF28bd9a);
  static const orangeLight = const Color(0xFFFCF5EF);
  static const orange = const Color(0xFFFAB87F);
  static const grayLight = const Color(0xFFf0f0f0);
  static const grayMedium = const Color(0xFFEAEAEA);
  static const gray = const Color(0xFFb9b9b9);
  static const red = const Color(0xFFCE5F5F);
  static const shadow = const Color(0x0D000000);
}
