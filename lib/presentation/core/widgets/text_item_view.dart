import 'package:flutter/material.dart';
import 'package:moovi_time/presentation/core/models/text_item.dart';
import 'package:moovi_time/presentation/core/resources/app_paddings.dart';
import 'package:moovi_time/presentation/core/resources/app_shapes.dart';
import 'package:moovi_time/presentation/core/resources/app_text_styles.dart';
import 'package:moovi_time/presentation/core/widgets/tap_view.dart';

class TextItemView extends StatelessWidget {
  final TextItem item;
  final Function(TextItem) onTap;

  const TextItemView({
    required this.item,
    required this.onTap,
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
                child: TapView<TextItem>(
                  onTap: () {
                    onTap(item);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    // color: Colors.green[700],
                    color: Theme.of(context).colorScheme.secondary.withOpacity(0.24),
                    // ColorScheme.fromSwatch(primarySwatch: Colors.blue).secondary.withOpacity(0.24),
                    child: Text(
                      item.text,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.movieViewSubtitle,
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
