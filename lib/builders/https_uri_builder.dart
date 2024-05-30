import 'package:movie/builders/builder.dart';

class HttpsUriBuilder extends Builder {
  String _authority = '';
  String _path = '';
  Map<String, dynamic> _queryParams = {};
  HttpsUriBuilder._();
  factory HttpsUriBuilder.create() {
    return HttpsUriBuilder._();
  }
  HttpsUriBuilder setAuthority(String authority) {
    this._authority = authority;
    return this;
  }

  HttpsUriBuilder setPath(String path) {
    this._path = path;
    return this;
  }

  HttpsUriBuilder setQueryParams(Map<String, dynamic> queryParams) {
    this._queryParams = queryParams;
    return this;
  }

  @override
  Uri build() {
    Uri uri = Uri.https(_authority, _path, _queryParams);
    reset();
    return uri;
  }

  @override
  void reset() {
    _authority = '';
    _path = '';
    _queryParams = {};
  }
}

void main() {
  var httpsBuilder = HttpsUriBuilder.create();
  httpsBuilder.setAuthority('api.themoviedb.org');
  httpsBuilder.setPath('/3/discover/movie');
  Map<String, dynamic> queryParams = {'with_genres': '28'};
  httpsBuilder.setQueryParams(queryParams);
  Uri uri = httpsBuilder.build();
  print(uri);
}
