class ApiUrl {
  static const baseURL = 'https://api.themoviedb.org/3/';
  static const apiKey =
      '?api_key=2b964875b715143a9bcbbed1291a5d26'; // el mafrood a7ot el api_key f .env file bs 3shn yeshta8al ma3ako :D

  static const trendingMovies = 'trending/movie/day$apiKey';
  static const nowPlayingMovies = 'movie/now_playing$apiKey';
  static const popular = 'movie/popular$apiKey';
  static const topRated = 'movie/top_rated$apiKey';
  static const upcoming = 'movie/upcoming$apiKey';

  static const String kImageBase = 'https://image.tmdb.org/t/p/';
  static const String kPosterSize = 'w342';
  static const String kBackdropSize = 'w780';

  static const movie = 'movie/';

  static const trailerBase = 'https://www.youtube.com/watch?v=';

  
}
