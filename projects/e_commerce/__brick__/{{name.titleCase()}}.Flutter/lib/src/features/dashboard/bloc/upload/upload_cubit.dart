import 'package:{{name.snakeCase()}}/imports_bindings.dart';

part 'upload_state.dart';
part 'upload_cubit.freezed.dart';

class UploadCubit extends Cubit<UploadState> {
  UploadCubit() : super(const UploadState());

  ///*
  Future<void> pickImage() async {
    final image = await FileServices().pickImage(ImageSource.gallery);
    emit(state.copyWith(images: [...state.images, image]));
  }

  ///*
  void removeImage(int index) {
    emit(state.copyWith(images: [...state.images]..removeAt(index)));
  }

  ///*
  Future<void> pickVideo() async {
    final video = await FileServices().pickVideo(ImageSource.gallery);
    emit(state.copyWith(videos: [...state.videos, video]));
  }

  ///*
  void removeVideo(int index) {
    emit(state.copyWith(videos: [...state.videos]..removeAt(index)));
  }

  ///*
  Future<void> pickFile() async {
    final file = await FileServices().pickFile();
    emit(state.copyWith(files: [...state.files, file]));
  }

  ///*
  void removeFile(int index) {
    emit(state.copyWith(files: [...state.files]..removeAt(index)));
  }

  ///*
  void updateRadio(int? index) => emit(state.copyWith(radioButtonValue: index));

  ///*
  void updateCheckBox({required int index, required bool isAdd}) {
    emit(
      state.copyWith(
        checkBoxValues: switch (isAdd) {
          true => [...state.checkBoxValues, index],
          false => [...state.checkBoxValues]..remove(index),
        },
      ),
    );
  }

  ///*
  void selectDropDown(int? index) => emit(state.copyWith(dropDownValue: index));

  ///*
  void selectDate(DateTime? date) => emit(state.copyWith(dateTime: date));

  ///*
  void selectTime(TimeOfDay? time) => emit(state.copyWith(timeOfDay: time));

  ///*
  void audioPath(String? path) => emit(state.copyWith(audioPath: path));
}
