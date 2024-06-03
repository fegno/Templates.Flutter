// ignore_for_file: public_member_api_docs
part of '../../update_service.dart';

extension _ListExtensions<T> on List<T> {
  T getOrDefault(int index, T defaultValue) {
    if (index < 0 || index >= length) {
      return defaultValue;
    }
    return this[index];
  }
}
