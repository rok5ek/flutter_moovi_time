import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:moovi_time/presentation/core/models/large_item.dart';
import 'package:moovi_time/presentation/core/resources/app_paddings.dart';
import 'package:moovi_time/presentation/core/resources/app_shapes.dart';
import 'package:moovi_time/presentation/core/resources/app_text_styles.dart';

class GridItemView extends StatelessWidget {
  final LargeItem item;
  final Function onTap;

  const GridItemView({
    required this.item,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPaddings.p8),
      child: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(AppShapes.s16)),
                child: Stack(
                  children: [
                    CachedNetworkImage(
                      width: double.infinity,
                      imageUrl: item.imageUrl,
                      fit: BoxFit.cover,
                    ),
                    Positioned.fill(
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {},
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: AppPaddings.p8),
              child: Text(
                item.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.movieViewTitle,
              ),
            ),
            Text(
              item.subtitle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.movieViewSubtitle,
            ),
          ],
        ),
      ),
    );
  }
}
