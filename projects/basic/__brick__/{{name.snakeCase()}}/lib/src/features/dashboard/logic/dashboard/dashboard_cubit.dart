import 'package:bloc/bloc.dart';
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
  }
}
