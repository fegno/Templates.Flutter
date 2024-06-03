import 'package:{{name.snakeCase()}}/imports_bindings.dart';

///* Store this application using styles
@immutable
abstract class AppStyles {
  ///* Text 12px
  static TextStyle get text12Px => const TextStyle(
        fontSize: 11,
        //height: 1.1,
        leadingDistribution: TextLeadingDistribution.even,
        //height: calculateHeight(14, 12),
      );

  ///* Text 13px
  static TextStyle get text13Px => const TextStyle(
        fontSize: 12,
        //height: calculateHeight(15, 13),
      );

  ///* Text 14px
  static TextStyle get text14Px => const TextStyle(
        fontSize: 14,
        //height: calculateHeight(15, 13),
      );

  ///* Text 16px
  static TextStyle get text16Px => const TextStyle(
        fontSize: 16,
        //height: calculateHeight(15, 13),
      );

  ///* Text 24px
  static TextStyle get text24Px => const TextStyle(
        fontSize: 24,
        //height: calculateHeight(15, 13),
      );

  ///* Text 32px
  static TextStyle get text32Px => const TextStyle(
        fontSize: 32,
        //height: calculateHeight(15, 13),
      );

  ///* Calculate line height of text
  static double calculateHeight(double height, double fontSize) {
    return height / fontSize;
  }

  ///* Calculate letter spacing of text
  static double calculateSpacing(double em) {
    return 16 * em;
  }
}
