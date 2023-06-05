import 'package:moovi_time/presentation/screens/discover/discover_type.dart';

class DiscoverPayload {
  final String title;
  final DiscoverType type;
  final int genreId;

  DiscoverPayload({
    required this.title,
    required this.type,
    required this.genreId,
  });
}
