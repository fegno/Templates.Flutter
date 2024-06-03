import 'package:{{name.snakeCase()}}/imports_bindings.dart';

///*This class will handle BaseRepo error
@immutable
abstract class ApiException {
  ///*Handle errors based on each Exception
  Future<String> handle(dynamic e) async {
    write(e.toString());
    if (e is DioException) {
      if (e.error.toString().contains('SocketException')) {
        if (await InternetConnectionChecker().hasConnection) {
          return 'Server went wrong ! Please try again later ';
        } else {
          return 'Please make sure about your connection !';
        }
      } else if (e.response?.data is Map) {
        return '${(e.response?.data as Map)['message']}';
      }
    }
    return 'Something went wrong ! Please try again later ';
  }
}
