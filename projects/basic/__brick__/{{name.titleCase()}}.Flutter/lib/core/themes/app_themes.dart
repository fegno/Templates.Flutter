import 'package:{{name.snakeCase()}}/imports_bindings.dart';

///*
@immutable
sealed class AppThemes {
  ///*
  static final light = ThemeData(
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: AppStyles.text16Px.interMedium.light,
        padding: EdgeInsets.all(20.r),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            8,
          ),
        ),
        backgroundColor: AppColors.dark,
        disabledBackgroundColor: AppColors.dark.withOpacity(0.5),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      prefixStyle: const TextStyle(fontSize: 14),
      focusColor: AppColors.dark,
      // floatingLabelStyle: AppStyles.text18Px.interRegular,
      labelStyle: AppStyles.text16Px.interRegular,
      isDense: true,
      isCollapsed: true,
      hintStyle: AppStyles.text16Px.interRegular,
      errorStyle: AppStyles.text14Px.interRegular.error,
      focusedErrorBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        borderSide: BorderSide(
          color: AppColors.error,
        ),
      ),
      errorBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        borderSide: BorderSide(
          color: AppColors.error,
        ),
      ),
      enabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: AppColors.dark,
    ),
    textTheme: TextTheme(
      displaySmall: AppStyles.text13Px.interMedium.dark,
    ),
  );

  ///*
  static final dark = ThemeData.dark().copyWith(
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: AppStyles.text16Px.interMedium.dark,
        padding: EdgeInsets.all(20.r),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            8,
          ),
        ),
        backgroundColor: AppColors.light,
        disabledBackgroundColor: AppColors.light.withOpacity(0.5),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      isDense: true,
      isCollapsed: true,
      prefixStyle: const TextStyle(fontSize: 14),
      focusColor: AppColors.primaryColor,

      //    floatingLabelStyle: AppStyles.text18Px.interRegular,
      labelStyle: AppStyles.text16Px.interRegular,
      hintStyle: AppStyles.text16Px.interRegular,
      errorStyle: AppStyles.text14Px.interRegular.error,
      focusedErrorBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        borderSide: BorderSide(
          color: AppColors.error,
        ),
      ),
      errorBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        borderSide: BorderSide(
          color: AppColors.error,
        ),
      ),
      enabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        borderSide: BorderSide(
          color: AppColors.light,
        ),
      ),
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        borderSide: BorderSide(
          color: AppColors.light,
        ),
      ),
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: AppColors.dark,
    ),
    textTheme: TextTheme(
      displaySmall: AppStyles.text13Px.interMedium.light,
    ),
  );
}
