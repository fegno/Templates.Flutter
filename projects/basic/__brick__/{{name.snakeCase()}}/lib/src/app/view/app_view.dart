import 'package:{{name.snakeCase()}}/imports_bindings.dart';
import 'package:{{name.snakeCase()}}/src/app/view/splash_view.dart';

///* First widget integrating
class App extends StatelessWidget {
  ///*
  const App({super.key});

  ///* For getting navigation status globally
  ///* eg:context,current state...
  static GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Sizer.init(
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => SplashCubit()),
          BlocProvider(create: (_) => AuthCubit()),
          BlocProvider(create: (_) => AppCubit()),
          BlocProvider(create: (_) => DashboardCubit()),
          BlocProvider(create: (_) => UploadCubit()),
          BlocProvider(create: (_) => HomeCubit()),
        ],
        child: BlocBuilder<AppCubit, AppState>(
          builder: (context, state) {
            return MaterialApp(
              navigatorKey: navKey,
              debugShowCheckedModeBanner: false,
              themeMode: state.themeMode,
              theme: AppThemes.light,
              darkTheme: AppThemes.dark,
              locale: state.locale,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              home: const SplashView(),
            );
          },
        ),
      ),
    );
  }
}
