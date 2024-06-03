import 'package:{{name.snakeCase()}}/imports_bindings.dart';

///* This class contains Api uris
@immutable
final class ApiUris {
  ///* BASE URL
  static const _baseUrl = String.fromEnvironment('baseUrl');

  ///* Login
  static const home = '$_baseUrl/api/v1/user/index/';
}
