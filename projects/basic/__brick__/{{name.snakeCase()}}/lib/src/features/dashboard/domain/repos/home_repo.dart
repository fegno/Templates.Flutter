import 'package:{{name.snakeCase()}}/imports_bindings.dart';

@immutable
final class HomeRepo {
  ///* This constructor body for creating singleton widget
  factory HomeRepo() => _authRepo ??= const HomeRepo._internel();

  //* This named constructor for create object for this class
  const HomeRepo._internel();

  //* This variable for store this class object globally
  static HomeRepo? _authRepo;

  ///* A simple methord for user login
  Future<Either<ApiException, HomeEntity>> fetchHome() async {
    try {
      write(ApiUris.home);
      return await BaseRepository().apiCall(
        call: Dio().get<dynamic>(
          ApiUris.home,
          options: Options(),
        ),
        onSuccess: (res) => right(HomeEntity.fromJson(res.data)),
      );
    } on ApiException catch (e) {
      return left(e);
    }
  }
}
