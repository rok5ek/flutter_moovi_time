import 'package:flutter/material.dart';
import 'package:moovi_time/presentation/navigation/app_screens.dart';
import 'package:moovi_time/presentation/screens/discover/discover_payload.dart';

class AppNavigator {
  static void openDiscoverScreen({
    required BuildContext context,
    required DiscoverPayload payload,
  }) {
    Navigator.pushNamed(
      context,
      AppScreens.discover,
      arguments: payload,
    );
  }
}
