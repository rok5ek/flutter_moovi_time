import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_widgets/infinite_widgets.dart';
import 'package:moovi_time/presentation/core/resources/app_paddings.dart';
import 'package:moovi_time/presentation/core/resources/app_text_styles.dart';
import 'package:moovi_time/presentation/core/widgets/grid_item_view.dart';
import 'package:moovi_time/presentation/screens/discover/discover_bloc.dart';
import 'package:moovi_time/presentation/screens/discover/discover_payload.dart';
import 'package:moovi_time/presentation/screens/discover/discover_state.dart';

class DiscoverScreen extends StatefulWidget {
  final DiscoverPayload payload;

  const DiscoverScreen({
    required this.payload,
    Key? key,
  }) : super(key: key);

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // disables keyboard overflow issue
      resizeToAvoidBottomInset: false,
      // backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          widget.payload.title,
          style: AppTextStyles.toolbarTitle,
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: Container(
          child: buildBody(context),
        ),
      ),
    );
  }

  Widget buildBody(BuildContext context) {
    return BlocBuilder<DiscoverBloc, DiscoverState>(
      builder: (context, state) {
        return InfiniteGridView(
          padding: const EdgeInsets.all(AppPaddings.p8),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: AppPaddings.p16,
            crossAxisSpacing: AppPaddings.p8,
            crossAxisCount: 2,
          ),
          itemBuilder: (context, index) {
            return GridItemView(
              item: state.items[index],
              onTap: () {},
            );
          },
          itemCount: state.items.length,
          hasNext: state.items.length < state.items.length,
          // let the widget know if you have more data to show or not
          nextData: () {},
          // callback called when end to the list is reach and hasNext is true
          loadingWidget: const SizedBox.shrink(),
        );
      },
    );
  }
}
