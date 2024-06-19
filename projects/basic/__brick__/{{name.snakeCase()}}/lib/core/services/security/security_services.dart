import 'package:{{name.snakeCase()}}/imports_bindings.dart' show base64Url, immutable;
import 'package:encrypt/encrypt.dart' show Encrypter, Fernet, Key;

@immutable
abstract class SecurityServices {
  static Encrypter? _encrypter;

  static Encrypter get _createdKey {
    if (_encrypter != null) {
      return _encrypter!;
    }
    final key = Key.fromUtf8('my32lengthsupersecretnooneknows1');
    final b64key = Key.fromUtf8(base64Url.encode(key.bytes).substring(0, 32));
    Key.fromUtf8(base64Url.encode(key.bytes).substring(0, 32));
    final fernet = Fernet(b64key);
    return _encrypter ??= Encrypter(fernet);
  }

  static String encrept(String text) {
    _createdKey;
    return _encrypter!.encrypt(text).base64;
  }

  static String decrypt(String encode) {
    _createdKey;
    return _encrypter!.decrypt64(encode);
  }
}
