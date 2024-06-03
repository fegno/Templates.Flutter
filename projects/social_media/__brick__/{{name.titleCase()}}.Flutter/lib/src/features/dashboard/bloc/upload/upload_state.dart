part of 'upload_cubit.dart';

@freezed
class UploadState with _$UploadState {
  const factory UploadState({
    @Default([]) List<XFile> images,
    @Default([]) List<XFile> videos,
    @Default([]) List<File> files,
    @Default([]) List<int> checkBoxValues,
    int? radioButtonValue,
    int? dropDownValue,
    DateTime? dateTime,
    TimeOfDay? timeOfDay,
    String? audioPath,
  }) = _UploadState;
}
