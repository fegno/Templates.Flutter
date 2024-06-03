import 'package:{{name.snakeCase()}}/imports_bindings.dart';

@immutable
final class AuthRepo {
  ///* This constructor body for creating singleton widget
  factory AuthRepo() {
    _authRepo == null ? {_authRepo = const AuthRepo._internel()} : null;
    return _authRepo!;
  }

  //* This named constructor for create object for this class
  const AuthRepo._internel();

  //* This variable for store this class object globally
  static AuthRepo? _authRepo;

  ///* A simple methord for user login
  Future<void> login({required String phone}) async {
    try {
      // return await BaseRepository().apiCall(
      //   call: Dio().get(
      //     ApiUris().emailCheck,
      //     queryParameters: {"email": email},
      //     options: Options(headers: {'Content-Type': 'application/json'}),
      //   ),
      //   onSuccess: (res) => res.data,
      // );
      await Future<void>.delayed(const Duration(seconds: 3));
    } catch (e) {
      throw Exception('$e');
    }
  }

  ///* This methord for verify otp for new user
  Future<void> verifyOtp({required String phone, required String otp}) async {
    try {
      // return await BaseRepository().apiCall(
      //   call: Dio().post(
      //     ApiUris().verifyOtp,
      //     options: Options(headers: {'Content-Type': 'application/json'}),
      //     data: {"email": email, "otp": otp},
      //   ),
      //   onSuccess: (res) => res.data,
      // );
      await Future<void>.delayed(const Duration(seconds: 3));
    } catch (e) {
      throw Exception('$e');
    }
  }
}
