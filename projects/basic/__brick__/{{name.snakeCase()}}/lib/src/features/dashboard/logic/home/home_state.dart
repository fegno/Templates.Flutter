part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(None()) Option<Either<ApiException, HomeEntity>> data,
  }) = _HomeState;
}
