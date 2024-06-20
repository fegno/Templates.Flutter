import 'package:{{name.snakeCase()}}/imports_bindings.dart';

part 'app_errors.freezed.dart';

///
@freezed
class ApiException with _$ApiException implements Exception {
  /// 500 Server Error
  const factory ApiException.server({@Default('Server went wrong ! Please try again later ') String msg}) = _ServerError;

  /// 404 Server Error
  const factory ApiException.notFound({@Default('Something went wrong ! Please try again later ') String msg}) = _NotFoundError;

  /// Internet Error
  const factory ApiException.network({@Default('Please make sure about your connection !') String msg}) = _NetworkError;

  /// Internet Error
  const factory ApiException.unknown({@Default('Something went wrong ! Please try again later ') String msg}) = _UnKnownError;
}
