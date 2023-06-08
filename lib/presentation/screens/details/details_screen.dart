import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moovi_time/presentation/screens/details/details_bloc.dart';
import 'package:moovi_time/presentation/screens/details/details_payload.dart';
import 'package:moovi_time/presentation/screens/details/details_state.dart';

class DetailsScreen extends StatefulWidget {
  final DetailsPayload payload;

  const DetailsScreen({
    required this.payload,
    Key? key,
  }) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // disables keyboard overflow issue
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        top: false,
        bottom: false,
        child: BlocBuilder<DetailsBloc, DetailsState>(builder: (context, state) {
          return CustomScrollView(
            slivers: [...buildBody(context)],
          );
        }),
      ),
    );
  }

  List<Widget> buildBody(BuildContext context) {
    return [
      SliverAppBar(
        pinned: true,
        expandedHeight: 350.0,
        flexibleSpace: CachedNetworkImage(
          fit: BoxFit.cover,
          imageUrl: "https://static.wikia.nocookie.net/pussinbootsnetflix/images/7/73/91xEo8OLIML._SL1500_.jpg",
        ),
      ),
    ];
    // return List.generate(3, (index) {
    //   return SizedBox.shrink();
    // });
  }
}
