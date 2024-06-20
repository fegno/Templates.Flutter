import 'package:{{name.snakeCase()}}/imports_bindings.dart';

///*This class will handle BaseRepo error
@immutable
abstract class ApiExceptionHandler {
  ///*Handle errors based on each Exception
  static Future<ApiException> handle(
    dynamic e, {
    ApiException? Function(DioException e)? customHandler,
  }) async {
    write(e.toString());
    if (e is DioException) {
      final kE = customHandler?.call(e);
      if (kE != null) {
        return kE;
      }
      if (e.error.toString().contains('SocketException')) {
        ///* Handling header issue
        if (await InternetConnectionChecker().hasConnection) {
          return const ApiException.server();
        } else {
          return const ApiException.network();
        }
      } else if (e.response?.statusCode == 401) {
        App.navKey.currentContext?.read<AuthCubit>().logout();
      } else if (['DEV', 'STG'].contains(whichEnv) || e.response?.data is Map && (e.response?.data as Map?)?['error'] is String) {
        return ApiException.unknown(msg: ((e.response?.data as Map?)?['error'] as String?) ?? 'Something went wrong .Please try again later !');
      } else if (['DEV', 'STG'].contains(whichEnv) || e.response?.data is Map && (e.response?.data as Map?)?['message'] is String) {
        return ApiException.unknown(msg: ((e.response?.data as Map?)?['message'] as String?) ?? 'Something went wrong .Please try again later !');
      } else if ((e.response?.statusCode ?? 0) >= 400 && (e.response?.statusCode ?? 0) <= 499) {
        return const ApiException.notFound();
      } else if ((e.response?.statusCode ?? 0) >= 500 && (e.response?.statusCode ?? 0) <= 599) {
        return const ApiException.server();
      }
      // else if (e.response?.data is Map) {
      //   if ((e.response?.data as Map).containsKey('message')) {
      //     return '${(e.response?.data as Map)['message']}';
      //   }
      // }
    }
    return const ApiException.unknown();
  }
}
