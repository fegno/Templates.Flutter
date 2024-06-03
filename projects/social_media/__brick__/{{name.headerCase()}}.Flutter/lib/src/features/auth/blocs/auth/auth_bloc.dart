import 'package:{{name.snakeCase()}}/imports_bindings.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

///*
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  ///*
  AuthBloc() : super(const AuthState()) {
    ///*
    on<_Login>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      await AuthRepo().login(phone: event.phone);
      App.navKey.currentContext?.push(VerifyOtpView(phoneNumber: event.phone));
      emit(state.copyWith(isLoading: false));
    });

    ///*
    on<_VerifyOtp>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      await AuthRepo().verifyOtp(phone: event.phone, otp: event.otp);
      await SessionService().storeToken('Token 224f948e7dead17e07484afc3ccf2ac3028f19b2').then((_) {
        App.navKey.currentContext?.pushAndRemoveUntil(const DashBoardView());
      });
      emit(state.copyWith(isLoading: false));
    });
  }
}
