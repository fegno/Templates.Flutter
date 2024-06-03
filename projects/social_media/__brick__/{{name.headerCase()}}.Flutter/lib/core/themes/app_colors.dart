// ignore_for_file: public_member_api_docs

import 'package:{{name.snakeCase()}}/imports_bindings.dart';

///* Store colors using this application
@immutable
abstract class AppColors {
  //*Theme primary color
  static const Color primaryColor = Color.fromRGBO(165, 214, 167, 1);
  static const Color light = Colors.white;
  static const Color dark = Colors.black;
  static const Color error = Colors.red;
}
