import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:encrypt/encrypt.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_state.dart';
part 'dashboard_cubit.freezed.dart';

///
class DashboardCubit extends Cubit<DashboardState> {
  ///
  DashboardCubit() : super(const DashboardState());

  ///
  void changeNav({required int index}) {
    emit(state.copyWith(navIndex: index));
    final plainText = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit';
    final key = Key.fromUtf8('my32lengthsupersecretnooneknows1');

    final b64key = Key.fromUtf8(base64Url.encode(key.bytes).substring(0, 32));
    // if you need to use the ttl feature, you'll need to use APIs in the algorithm itself
    final fernet = Fernet(b64key);
    final encrypter = Encrypter(fernet);

    final encrypted = encrypter.encrypt(plainText);
    final decrypted = encrypter.decrypt64(encrypted.base64);

    print(decrypted); // Lorem ipsum dolor sit amet, consectetur adipiscing elit
    print(encrypted.base64); // random cipher text
    print(fernet.extractTimestamp(encrypted.bytes));
  }
}
