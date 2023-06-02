import 'package:flutter/material.dart';
import 'package:moovi_time/presentation/core/resources/app_paddings.dart';
import 'package:moovi_time/presentation/core/resources/app_text_styles.dart';

class SettingsSection extends StatelessWidget {
  final String title;

  const SettingsSection({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: AppPaddings.p16,
        top: 0,
        right: AppPaddings.p16,
        bottom: 8,
      ),
      child: Text(
        title,
        style: AppTextStyles.settingsSectionText,
      ),
    );
  }
}
