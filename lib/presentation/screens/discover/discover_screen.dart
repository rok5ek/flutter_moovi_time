import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moovi_time/presentation/core/resources/app_text_styles.dart';
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
        title: const Text(
          "Discover",
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
        return ListView(
          key: const PageStorageKey("sections_key"),
          children: const [
            // LargeSectionView(
            //     title: "Top Rated",
            //     bottomPadding: AppPaddings.p36,
            //     items: state.topRatedMovies.map((e) {
            //       return LargeItem(title: e.title, subtitle: e.overview, imageUrl: e.image);
            //     }).toList())
          ],
        );
      },
    );
  }
}
