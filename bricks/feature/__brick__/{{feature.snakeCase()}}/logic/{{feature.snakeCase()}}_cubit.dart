import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part '{{feature.snakeCase()}}_state.dart';
part '{{feature.snakeCase()}}_cubit.freezed.dart';

class {{feature.pascalCase()}}Cubit extends Cubit<{{feature.pascalCase()}}State> {
  {{feature.pascalCase()}}Cubit() : super({{feature.pascalCase()}}State.initial());
}
