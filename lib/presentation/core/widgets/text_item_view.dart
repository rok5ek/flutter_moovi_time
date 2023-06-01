import 'package:flutter/material.dart';
import 'package:moovi_time/presentation/core/models/text_item.dart';
import 'package:moovi_time/presentation/core/resources/app_paddings.dart';
import 'package:moovi_time/presentation/core/resources/app_shapes.dart';
import 'package:moovi_time/presentation/core/resources/app_text_styles.dart';

class TextItemView extends StatelessWidget {
  final TextItem item;

  const TextItemView({
    required this.item,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPaddings.p8),
      child: SizedBox(
        width: 120,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(AppShapes.s16)),
                child: Container(
                  alignment: Alignment.center,
                  // color: Colors.green[700],
                  color: ColorScheme.fromSwatch(primarySwatch: Colors.amber).secondary.withOpacity(0.24),
                  child: Text(
                    item.text,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.movieViewSubtitle.copyWith(
                      color: ColorScheme.fromSwatch(primarySwatch: Colors.green).onSurface,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
