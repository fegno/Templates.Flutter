import 'package:{{name.snakeCase()}}/imports_bindings.dart';

@immutable

///
abstract class Dialogs {
  ///Show snackbar withoud context
  static Future<void> showSnack([String? msg]) async {
    ScaffoldMessenger.of(App.navKey.currentContext!).showSnackBar(
      SnackBar(
        content: Text(msg ?? 'Something went wrong! Please try again later.'),
      ),
    );
  }
}
