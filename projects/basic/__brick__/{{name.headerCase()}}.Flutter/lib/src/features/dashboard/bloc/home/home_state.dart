part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    HomeEntity? homeEntity,
    @Default(false) bool isLoading,
  }) = _HomeState;
}
