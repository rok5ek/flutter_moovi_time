import 'package:flutter/material.dart';
import 'package:moovi_time/presentation/core/resources/app_colors.dart';

abstract class AppTextStyles {
  static const sectionViewTitle = TextStyle(color: AppColors.black, fontSize: 18, fontWeight: FontWeight.w700);
  static const movieViewTitle = TextStyle(color: AppColors.black, fontSize: 14, fontWeight: FontWeight.w600);
  static const movieViewSubtitle = TextStyle(color: AppColors.gray, fontSize: 12, fontWeight: FontWeight.w400);
}
