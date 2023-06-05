import 'package:flutter/material.dart';
import 'package:moovi_time/presentation/core/resources/app_colors.dart';

class TapView<T> extends StatelessWidget {
  final Widget? child;
  final Function onTap;

  const TapView({
    this.child,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.transparent,
      child: InkWell(
        onTap: () {
          onTap();
        },
        child: child,
      ),
    );
  }
}
