import 'package:{{name.snakeCase()}}/imports_bindings.dart';

///*
@immutable
final class Sizer {
  static late double _scaleWidth;
  static late double _scaleHeight;
  // final double _scaleFactor = 0;

  static const designSize = Size(360, 805);

  static Widget init({required Widget child}) {
    return LayoutBuilder(
      builder: (context, constraints) {
        _scaleWidth = (constraints.maxWidth / designSize.width);
        _scaleHeight = (constraints.maxHeight / designSize.height);
        // _scaleFactor = _scaleWidth / _scaleHeight;
        return child;
      },
    );
  }

  static double setWidth(num width) => width * _scaleWidth;

  static double setHeight(num height) => height * _scaleHeight;

  // double setSp(num sp) => sp * _scaleFactor;

  static double radius(num r) => r * min(_scaleWidth, _scaleHeight);

  static Widget setVerticalSpacing(num height) => SizedBox(height: setHeight(height));

  static Widget setVerticalSpacingRadius(num height) => SizedBox(height: radius(height));

  static Widget setHorizontalSpacing(num width) => SizedBox(width: setWidth(width));

  static Widget setHorizontalSpacingRadius(num width) => SizedBox(width: radius(width));
}
