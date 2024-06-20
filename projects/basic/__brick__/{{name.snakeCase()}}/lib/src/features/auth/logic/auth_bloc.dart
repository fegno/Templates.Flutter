import 'package:{{name.snakeCase()}}/imports_bindings.dart';

part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

///*
class AuthCubit extends HydratedCubit<AuthState> {
  ///*
  AuthCubit() : super(const AuthState());

  ///*
  Future<void> login({required String phone}) async {
    emit(state.copyWith(isLoading: true));
    await AuthRepo().login(phone: phone);
    App.navKey.currentContext?.push(VerifyOtpView(phoneNumber: phone));
    emit(state.copyWith(isLoading: false));
  }

  ///*
  Future<void> verifyOtp({required String phone, required String otp}) async {
    emit(state.copyWith(isLoading: true));
    await AuthRepo().verifyOtp(phone: phone, otp: otp);
    emit(state.copyWith(isLoading: false, token: 'Token 224f948e7dead17e07484afc3ccf2ac3028f19b2'));
    App.navKey.currentContext?.pushAndRemoveUntil(const DashBoardScreen());
  }

  ///*
  void logout() {
    emit(state.copyWith(token: null));
    App.navKey.currentContext?.pushAndRemoveUntil(const OnBoardingScreen());
  }

  @override
  AuthState? fromJson(Map<String, dynamic> json) {
    return AuthState(
      token: json['tkoen'] as String?,
    );
  }

  @override
  Map<String, dynamic>? toJson(AuthState state) {
    return {
      'token': state.token,
    };
  }
}
