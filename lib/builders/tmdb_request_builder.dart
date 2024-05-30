import 'package:dio/dio.dart';
import 'package:movie/builders/builder.dart';
import 'package:movie/builders/https_uri_builder.dart';

final _API_ACCESS_TOKEN =
    'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzNTMxOTk1MmRkZmY1OTMyYjk3MGM4NWVkYTYwYmNiNiIsInN1YiI6IjY2NTQwYWNkZTA5OTk4NjM2YjRjZDI1MSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.lJtYvX_j1nAGaebMv9XQwQIQFU5T3jDRqCYSlAcFS-o';
BaseOptions options = BaseOptions(
  headers: {
    'Accept': 'Application/Json',
    'Authorization': 'Bearer $_API_ACCESS_TOKEN',
    'Host': 'api.themoviedb.org'
  },
);

class TMDBRequestBuilder {
  static HttpsUriBuilder uriBuilder = HttpsUriBuilder.create();

  final _dio = Dio(options);
  static const String _baseUrl = 'api.themoviedb.org';

  static Uri buildWithGenres(List<int> genres) {
    String genreString = genres.join('&');
    return uriBuilder
        .setAuthority(_baseUrl)
        .setPath('/3/discover/movie')
        .setQueryParams({'with_genres': genreString}).build();
  }

  static Uri buildWithSearchQuery(String query) {
    return uriBuilder
        .setAuthority(_baseUrl)
        .setPath('/3/search/movie')
        .setQueryParams({'query': query}).build();
  }

  static Uri popularMovies() {
    return uriBuilder
        .setAuthority(_baseUrl)
        .setPath('/3/movie/popular')
        .build();
  }

  static Uri buildWithIdQuery(int id) {
    return uriBuilder.setAuthority(_baseUrl).setPath('/3/movie/$id').build();
  }
}
