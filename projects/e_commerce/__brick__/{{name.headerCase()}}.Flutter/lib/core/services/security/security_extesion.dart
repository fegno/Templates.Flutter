part of 'package:{{name.snakeCase()}}/core/services/session/session_services.dart';

///*This extension contains
extension _StringX on String {
  ///*
  String get encrept => SecurityServices.encrept(this);

  ///*
  String get decrypt => SecurityServices.decrypt(this);
}
