import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:moovi_time/presentation/core/resources/app_colors.dart';
import 'package:moovi_time/presentation/core/resources/app_paddings.dart';
import 'package:moovi_time/presentation/core/resources/app_text_styles.dart';

enum SettingsItemType {
  NORMAL,
  VALUE,
  SWITCH,
  CUSTOM,
}

class SettingsItem extends StatelessWidget {
  final String title;
  final String? value;
  final Function? onTap;
  final bool isVisible;
  final Widget? customWidget;
  final bool? switchValue;
  final Function(bool value)? onSwitchTap;
  final SettingsItemType type;

  const SettingsItem({
    Key? key,
    required this.title,
    this.value,
    this.onTap,
    this.isVisible = true,
    this.customWidget,
    this.switchValue,
    this.onSwitchTap,
    this.type = SettingsItemType.NORMAL,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isVisible,
      replacement: const SizedBox.shrink(),
      child: SizedBox(
        height: 60,
        child: Material(
          color: AppColors.transparent,
          child: InkWell(
            onTap: onTap == null
                ? null
                : () {
                    onTap?.call();
                  },
            child: Padding(
              padding: const EdgeInsets.only(
                left: AppPaddings.p16,
                top: 0,
                right: AppPaddings.p16,
                bottom: 0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: AppTextStyles.settingsViewText,
                  ),
                  Builder(builder: (context) {
                    switch (type) {
                      case SettingsItemType.NORMAL:
                        return const SizedBox.shrink();
                      case SettingsItemType.VALUE:
                        return Text(
                          value ?? "",
                          style: AppTextStyles.settingsViewText.copyWith(
                            color: AppColors.gray,
                            fontWeight: FontWeight.w400,
                          ),
                        );
                      case SettingsItemType.SWITCH:
                        return PlatformSwitch(
                          activeColor: AppColors.accent,
                          value: switchValue ?? false,
                          onChanged: (bool value) {
                            onSwitchTap?.call(value);
                          },
                        );
                      case SettingsItemType.CUSTOM:
                        return customWidget ?? const SizedBox.shrink();
                    }
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SettingsDivider extends StatelessWidget {
  const SettingsDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        height: 1,
        color: AppColors.grayLight,
      ),
    );
  }
}
