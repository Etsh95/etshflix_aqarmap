import 'package:etshflix_aqarmap/common/widgets/appbar/app_bar.dart';
import 'package:etshflix_aqarmap/core/configs/assets/app_vectors.dart';
import 'package:etshflix_aqarmap/presentation/home/widgets/category_text.dart';
import 'package:etshflix_aqarmap/presentation/home/widgets/now_playing_movies.dart';
import 'package:etshflix_aqarmap/presentation/home/widgets/popular.dart';
import 'package:etshflix_aqarmap/presentation/home/widgets/toprated_movies.dart';
import 'package:etshflix_aqarmap/presentation/home/widgets/trendings_movies.dart';
import 'package:etshflix_aqarmap/presentation/home/widgets/upcoming_movies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(hideBack: true, title: SvgPicture.asset(AppVectors.logo, height: 28)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CategoryText(title: 'Trendings 🔥'),
            TrendingsMovies(),
            SizedBox(height: 16),
            CategoryText(title: 'Now Playing'),
            SizedBox(height: 16),
            NowPlayingMovies(),
            SizedBox(height: 16),
            CategoryText(title: 'Popular'),
            SizedBox(height: 16),
            PopularMovies(),
            SizedBox(height: 16),
            CategoryText(title: 'Top Rated'),
            SizedBox(height: 16),
            TopRatedMovies(),
            SizedBox(height: 16),
            CategoryText(title: 'Upcoming'),
            SizedBox(height: 16),
            UpcomingMovies(),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
