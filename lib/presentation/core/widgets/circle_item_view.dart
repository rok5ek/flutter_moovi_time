import 'package:flutter/material.dart';
import 'package:moovi_time/presentation/core/models/large_item.dart';
import 'package:moovi_time/presentation/core/resources/app_paddings.dart';
import 'package:moovi_time/presentation/core/resources/app_text_styles.dart';
import 'package:moovi_time/presentation/core/widgets/circle_image_view.dart';

class CircleItemView extends StatelessWidget {
  final LargeItem item;

  const CircleItemView({
    required this.item,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPaddings.p8),
      child: SizedBox(
        width: 64,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              children: [
                CircleImageView(
                  image: item.imageUrl,
                ),
                Positioned.fill(
                  child: ClipOval(
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {},
                      ),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: AppPaddings.p8),
              child: Text(
                item.title,
                maxLines: 2,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.movieViewTitleSmall,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
