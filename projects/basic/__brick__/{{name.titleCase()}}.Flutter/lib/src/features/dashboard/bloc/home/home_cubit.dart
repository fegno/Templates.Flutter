import 'package:{{name.snakeCase()}}/imports_bindings.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState());

  Future<void> fetchHome() async {
    emit(state.copyWith(isLoading: true));
    try {
      final res = await HomeRepo().fetchHome();
      emit(state.copyWith(homeEntity: res));
    } on Exception catch (e) {
      await Dialogs.showSnack(e.toString());
    }
    emit(state.copyWith(isLoading: false));
  }
}
