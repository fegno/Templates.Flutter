// import 'package:{{name.snakeCase()}}/firebase_options.dart';
import 'package:{{name.snakeCase()}}/imports_bindings.dart';
import 'package:dev_preview/dev_preview.dart';

/// bootstraping
Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  //* ⚙️ widget binding
  WidgetsFlutterBinding.ensureInitialized();

  //*for log flutter global error 🐞
  FlutterError.onError = (details) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(details);
    write(details.exceptionAsString(), stackTrace: details.stack);
  };
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

  //* firebase configuration
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  //* notification management
  // await NotificationServices.initialize();

  //* 🧪 bloc observer for manageing bloc lyfecyles
  Bloc.observer = const AppBlocObserver();

  //* 🍪📦  session configuration
  await SessionService().init();

  //* 🏃 for integrate initial widget
  runApp(
    DevPreview(
      isEnabled: Platform.isLinux || Platform.isWindows,
      child: await builder(),
    ),
  );
}
