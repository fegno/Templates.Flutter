import 'package:{{name.snakeCase()}}/imports_bindings.dart';

part 'package:{{name.snakeCase()}}/core/services/security/security_extesion.dart';

///* For managing local storage data_bases
final class SessionService {
  ///* This constructor body for creating singleton widget
  factory SessionService() {
    return _sessionService ??= SessionService._();
  }

  //* This named constructor for create object for this class
  SessionService._();

  //* This variable for store this class object globally
  static SessionService? _sessionService;

  //*
  late final SharedPreferences _prefs;

  ///* For creating connection b/w app and local databases
  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  //* geters
  ///*Get token from local database
  String? get token => _prefs.getString(SessionKeys.token);

  ///*Get theme from local database
  ThemeMode get theme => switch (_prefs.getString(SessionKeys.theme)?.decrypt) {
        'dark' => ThemeMode.dark,
        _ => ThemeMode.light,
      };

  ///*Get language from local databse
  String? get language => _prefs.getString(SessionKeys.language)?.decrypt;

  //* setters
  ///*Store tokens to local database
  Future<void> storeToken(String token) async => _prefs.setString(SessionKeys.token, token);

  ///*Store theme to local database
  Future<void> storeTheme(ThemeMode theme) async => _prefs.setString(SessionKeys.theme, theme.name.encrept);

  ///*Store language to local database
  Future<void> storeLanguage(Locale locale) async => _prefs.setString(SessionKeys.language, locale.languageCode.encrept);

  //* clear session
  ///*Clear all local database datas
  Future<void> clearAll() async => _prefs.clear();
}
