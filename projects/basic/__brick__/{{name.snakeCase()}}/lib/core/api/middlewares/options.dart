import 'package:{{name.snakeCase()}}/imports_bindings.dart';

///
extension OptionsX on Options {
  /// Add token
  Options get token {
    final headers = {
      'Content-Type': 'application/json',
    };
    final token = App.navKey.currentContext?.read<AuthCubit>().state.token ?? '';

    if (token.isNotEmpty) {
      headers['Authorization'] = 'Token $token';
    }
    return copyWith(
      headers: headers,
    );
  }
}
