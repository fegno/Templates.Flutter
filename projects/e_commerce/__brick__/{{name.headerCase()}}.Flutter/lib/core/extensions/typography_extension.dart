// ignore_for_file: public_member_api_docs

import 'package:{{name.snakeCase()}}/imports_bindings.dart';

///* For store global typography properties and methords
extension TextStyleX on TextStyle {
  //*Inter
  TextStyle get interRegular => copyWith(fontFamily: 'Inter-Regular');
  TextStyle get interMedium => copyWith(fontFamily: 'Inter-Medium');
  TextStyle get interSemiBold => copyWith(fontFamily: 'Inter-SemiBold');
  TextStyle get interBold => copyWith(fontFamily: 'Inter-Bold');

  //*Colors
  TextStyle get dark => copyWith(color: AppColors.dark);
  TextStyle get light => copyWith(color: AppColors.light);
  TextStyle get primary => copyWith(color: AppColors.primaryColor);
  TextStyle get error => copyWith(color: AppColors.error);

  //* Custom methords
  TextStyle kcolor(Color _) => copyWith(color: _);
  // Adaptive
  // TextStyle get adaptive => copyWith(fontSize: fontSize);
  //opacity methods
  ///
  TextStyle opacity(double opacity) => copyWith(color: color?.withOpacity(opacity));
}
