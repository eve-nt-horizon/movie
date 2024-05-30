
class HttpsUriBuilder extends Builder {
  String authority = '';
  String path = '';
  Map<String, dynamic> queryParams = {};
  HttpsUriBuilder._();
  factory HttpsUriBuilder.create() {
    return HttpsUriBuilder._();
  }
  void setAuthority(String authority) {
    this.authority = authority;
  }

  void setPath(String path) {
    this.path = path;
  }

  void setQueryParams(Map<String, dynamic> queryParams) {
    this.queryParams = queryParams;
  }

  @override
  Uri build() {
    Uri uri = Uri.https(authority, path, queryParams);
    reset();
    return uri;
  }

  @override
  void reset() {
    authority = '';
    path = '';
    queryParams = {};
  }
}

abstract class Builder {
  void build();
  void reset();
}
