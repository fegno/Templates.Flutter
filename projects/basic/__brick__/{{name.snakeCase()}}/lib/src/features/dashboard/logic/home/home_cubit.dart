import 'package:{{name.snakeCase()}}/imports_bindings.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState());

  Future<void> fetchHome() async {
    emit(state.copyWith(data: none()));
    final res = await HomeRepo().fetchHome();
    emit(state.copyWith(data: some(res)));
  }
}
