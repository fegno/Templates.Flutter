import 'package:{{name.snakeCase()}}/imports_bindings.dart';

part 'splash_state.dart';
part 'splash_cubit.freezed.dart';

///
class SplashCubit extends Cubit<SplashState> {
  ///
  SplashCubit() : super(const SplashState());

  ///*
  Future<void> init() async {
    final packageInfo = await PackageInfo.fromPlatform();
    emit(state.copyWith(packageInfo: packageInfo));

    // Checking update available or not
    // if (Platform.isAndroid || Platform.isIOS) {
    //   await UpdateServices.checkForUpdates(packageInfo: packageInfo, appleId: '');
    // }

    final token = App.navKey.currentContext?.read<AuthCubit>().state.token;
    App.navKey.currentContext?.pushAndRemoveUntil(
      switch (token) {
        null => const OnBoardingScreen(),
        _ => const DashBoardScreen(),
      },
    );
  }
}
