import 'package:etshflix_aqarmap/core/configs/assets/app_images.dart';
import 'package:etshflix_aqarmap/presentation/home/bloc/trendings_cubit.dart';
import 'package:etshflix_aqarmap/presentation/home/bloc/trendings_state.dart';
import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrendingsMovies extends StatelessWidget {
  const TrendingsMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TrendingsCubit()..getTrendingsMovies(),
      child: BlocBuilder<TrendingsCubit, TrendingsState>(
        builder: (context, state) {
          if (state is TrendingsMoviesLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is TrendingsMoviesLoaded) {
            return FanCarouselImageSlider.sliderType1(
              imagesLink: state.movies
                  .map((item) => AppImages.kImageBase + item.posterPath.toString())
                  .toList(),
              isAssets: false,
              autoPlay: true,
              sliderHeight: 400,
              showIndicator: false,
              
            );
          }
          if (state is TrendingsMoviesFailureLoad) {
            return Text(state.errorMessage);
          }

          return Container();
        },
      ),
    );
  }
}
