import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/widgets.dart';
import 'package:moovi_time/domain/models/movie_entity.dart';
import 'package:moovi_time/presentation/core/resources/app_colors.dart';
import 'package:moovi_time/presentation/core/resources/app_paddings.dart';
import 'package:moovi_time/presentation/core/resources/app_shapes.dart';
import 'package:moovi_time/presentation/core/resources/app_text_styles.dart';

class MovieView extends StatelessWidget {
  final MovieEntity movie;

  const MovieView({required this.movie, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPaddings.p8),
      child: SizedBox(
        width: 140,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            ClipRRect(
              borderRadius:const BorderRadius.all(Radius.circular(AppShapes.s16)),
              child: CachedNetworkImage(
                imageUrl: movie.image,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: AppPaddings.p8, bottom: AppPaddings.p8),
              child: Text(
                movie.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.movieViewTitle,
              ),
            ),
            Text(
              movie.overview,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.movieViewSubtitle,
            ),
          ],
        ),
      ),
    );

    // return SizedBox(
    //   width: 140,
    //   child: Padding(
    //     padding: const EdgeInsets.symmetric(horizontal: AppPaddings.p8),
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         CachedNetworkImage(
    //           imageUrl: movie.image,
    //           height:100,
    //           imageBuilder: (context, imageProvider) => Container(
    //             decoration: BoxDecoration(
    //               color: AppColors.transparent,
    //               image: DecorationImage(
    //                 image: imageProvider,
    //                   fit: BoxFit.fill,
    //               ),
    //               borderRadius: const BorderRadius.all(Radius.circular(AppShapes.s16)),
    //             ),
    //           ),
    //         ),
    //         Padding(
    //           padding: const EdgeInsets.only(top: AppPaddings.p8, bottom: AppPaddings.p8),
    //           child: Text(
    //             movie.title,
    //             maxLines: 1,
    //             overflow: TextOverflow.ellipsis,
    //             style: AppTextStyles.movieViewTitle,
    //           ),
    //         ),
    //         Text(
    //           movie.overview,
    //           maxLines: 1,
    //           overflow: TextOverflow.ellipsis,
    //           style: AppTextStyles.movieViewSubtitle,
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
