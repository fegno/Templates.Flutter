import 'package:{{name.snakeCase()}}/imports_bindings.dart';

part 'app_cubit.freezed.dart';
part 'app_state.dart';

///
class AppCubit extends Cubit<AppState> {
  ///
  AppCubit() : super(const AppState());

  ///*
  Future<void> changeThemeMode(ThemeMode theme) async {
    await SessionService().storeTheme(theme);
    emit(state.copyWith(themeMode: theme));
    await NotificationServices.createNotification(
      title: 'Theme Changed',
      body: 'Current theme mode is ${theme.name}',
    );
  }

  ///
  void init() {
    final deviceLanguage = Platform.localeName.split('_')[0];

    final locale = switch (SessionService().language) {
      != null => Locale(SessionService().language!),
      _ => AppLocalizations.supportedLocales.singleWhere(
          (e) => e.languageCode == deviceLanguage,
          orElse: () => const Locale('en'),
        ),
    };
    emit(state.copyWith(themeMode: SessionService().theme, locale: locale));
  }

  ///
  Future<void> changeLocale(Locale locale) async {
    await SessionService().storeLanguage(locale);
    emit(state.copyWith(locale: locale));
  }
}
