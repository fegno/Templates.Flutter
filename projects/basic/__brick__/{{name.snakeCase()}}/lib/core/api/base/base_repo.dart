import 'package:{{name.snakeCase()}}/imports_bindings.dart';

///*
@immutable
final class BaseRepository {
  ///* This constructor body for creating singleton widget
  factory BaseRepository() {
    _baseRepository ??= const BaseRepository._();
    return _baseRepository!;
  }

  //* This named constructor for create object for this class
  const BaseRepository._();

  ///* This variable for store this class object globally
  static BaseRepository? _baseRepository;

  ///* This  methord for to create api call easly ( just  like middleware for handling api calls )
  Future<T> apiCall<R, T>({
    required Future<R> call,
    required T Function(R data) onSuccess,
    ApiException? Function(DioException e)? customHandler,
  }) async {
    final json = await call.catchError((dynamic e) async {
      final error = await ApiExceptionHandler.handle(e, customHandler: customHandler);
      throw error;
    });
    return onSuccess(json);
  }
}
