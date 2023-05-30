import 'package:flutter/widgets.dart';
import 'package:moovi_time/presentation/core/models/large_item.dart';
import 'package:moovi_time/presentation/core/resources/app_paddings.dart';
import 'package:moovi_time/presentation/core/resources/app_text_styles.dart';
import 'package:moovi_time/presentation/core/widgets/large_item_view.dart';
import 'package:uuid/uuid.dart';

class LargeSectionView extends StatelessWidget {
  final PageStorageKey _pageStorageKey = PageStorageKey(const Uuid().v1().toString());
  final String title;
  final List<LargeItem> items;

  // final Function onTap;

  LargeSectionView({
    required this.title,
    required this.items,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(AppPaddings.p16),
          child: Text(
            title,
            style: AppTextStyles.sectionViewTitle,
          ),
        ),
        SizedBox(
          height: 300,
          child: ListView.builder(
            key: _pageStorageKey,
            padding: const EdgeInsets.all(8),
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: items.length,
            itemBuilder: (BuildContext context, int index) {
              LargeItem item = items[index];
              return LargeItemView(
                item: item,
              );
            },
          ),
        ),
      ],
    );
  }
}
