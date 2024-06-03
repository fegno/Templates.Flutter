import 'package:{{name.snakeCase()}}/imports_bindings.dart';

class UploadView extends StatefulWidget {
  const UploadView({super.key});

  @override
  State<UploadView> createState() => _UploadViewState();
}

class _UploadViewState extends State<UploadView> {
  late final TextEditingController _phoneCtrl;
  late final TextEditingController _emailCtrl;
  late final TextEditingController _pwdCtrl;

  @override
  void initState() {
    _phoneCtrl = TextEditingController();
    _emailCtrl = TextEditingController();
    _pwdCtrl = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(16.r),
        children: [
          Text(
            context.lang.phoneNumber,
            style: AppStyles.text14Px.interMedium,
          ).pOnly(bottom: 8.r),
          KField(
            controller: _phoneCtrl,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(10),
              // PhoneNumberFormatter(),
            ],
            keyboardType: TextInputType.number,
            validator: (text) {
              if (text?.length != 10) {
                return 'Please enter valid phone!';
              }
              return null;
            },
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: const InputDecoration(
              hintText: 'Please enter phone number',
            ),
          ).pOnly(bottom: 16.r),
          Text(
            'Email',
            style: AppStyles.text14Px.interMedium,
          ).pOnly(bottom: 8.r),
          KField(
            controller: _emailCtrl,
            keyboardType: TextInputType.number,
            validator: (text) {
              if (!(text?.isEmail ?? false)) {
                return 'Please enter valid email!';
              }
              return null;
            },
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: const InputDecoration(
              hintText: 'Please enter phone number',
            ),
          ).pOnly(bottom: 16.r),
          Text(
            'Password',
            style: AppStyles.text14Px.interMedium,
          ).pOnly(bottom: 8.r),
          KField(
            controller: _pwdCtrl,
            keyboardType: TextInputType.number,
            validator: (text) {
              if ((text?.length ?? 0) < 8) {
                return 'Please enter valid password!';
              }
              return null;
            },
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: const InputDecoration(
              hintText: 'Please enter phone number',
            ),
          ).pOnly(bottom: 16.r),
          Text(
            'Images',
            style: AppStyles.text14Px.interMedium,
          ).pOnly(bottom: 8.r),
          DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: context.color),
            ),
            child: SizedBox(
              height: 54,
              width: double.maxFinite,
              child: Row(
                children: [
                  Flexible(
                    child: SizedBox(
                      height: 54,
                      width: double.maxFinite,
                      child: BlocBuilder<UploadCubit, UploadState>(
                        buildWhen: (p, c) => p.images != c.images,
                        builder: (context, state) {
                          return ListView.separated(
                            itemCount: state.images.length,
                            scrollDirection: Axis.horizontal,
                            separatorBuilder: (context, i) => const SizedBox(width: 8),
                            itemBuilder: (BuildContext context, int index) {
                              return DecoratedBox(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(color: context.color),
                                ),
                                child: Image.file(
                                  File(state.images[index].path),
                                  fit: BoxFit.cover,
                                  height: 42,
                                  width: 42,
                                ).pad(4),
                              ).pxy(y: 8);
                            },
                          );
                        },
                      ),
                    ),
                  ),
                  IconButton.outlined(
                    onPressed: context.read<UploadCubit>().pickImage,
                    icon: const Icon(Icons.add),
                  ),
                ],
              ).pxy(x: 8),
            ),
          ).pOnly(bottom: 16.r),
          Text(
            'Videos',
            style: AppStyles.text14Px.interMedium,
          ).pOnly(bottom: 8.r),
          DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: context.color),
            ),
            child: SizedBox(
              height: 54,
              width: double.maxFinite,
              child: Row(
                children: [
                  Flexible(
                    child: SizedBox(
                      height: 54,
                      width: double.maxFinite,
                      child: BlocBuilder<UploadCubit, UploadState>(
                        buildWhen: (p, c) => p.videos != c.videos,
                        builder: (context, state) {
                          return ListView.separated(
                            itemCount: state.videos.length,
                            scrollDirection: Axis.horizontal,
                            separatorBuilder: (context, i) => const SizedBox(width: 8),
                            itemBuilder: (BuildContext context, int index) {
                              return DecoratedBox(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(color: context.color),
                                ),
                                child: VideoPreview(path: state.videos[index].path).pad(4),
                              ).pxy(y: 8);
                            },
                          );
                        },
                      ),
                    ),
                  ),
                  IconButton.outlined(
                    onPressed: context.read<UploadCubit>().pickVideo,
                    icon: const Icon(Icons.add),
                  ),
                ],
              ).pxy(x: 8),
            ),
          ).pOnly(bottom: 16.r),
          Text(
            'Files',
            style: AppStyles.text14Px.interMedium,
          ).pOnly(bottom: 8.r),
          DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: context.color),
            ),
            child: SizedBox(
              height: 54,
              width: double.maxFinite,
              child: Row(
                children: [
                  Flexible(
                    child: SizedBox(
                      height: 54,
                      width: double.maxFinite,
                      child: BlocBuilder<UploadCubit, UploadState>(
                        buildWhen: (p, c) => p.files != c.files,
                        builder: (context, state) {
                          return ListView.separated(
                            itemCount: state.files.length,
                            scrollDirection: Axis.horizontal,
                            separatorBuilder: (context, i) => const SizedBox(width: 8),
                            itemBuilder: (BuildContext context, int index) {
                              return DecoratedBox(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(color: context.color),
                                ),
                                child: Builder(
                                  builder: (context) {
                                    final isImage = ['png', 'jpg'].contains(state.files[index].path.split('.').last);
                                    if (!isImage) {
                                      return const Icon(Icons.file_present_rounded).pxy(x: 8);
                                    }
                                    return Image.file(
                                      File(state.files[index].path),
                                      fit: BoxFit.cover,
                                      height: 42,
                                      width: 42,
                                    ).pad(4);
                                  },
                                ),
                              ).pxy(y: 8);
                            },
                          );
                        },
                      ),
                    ),
                  ),
                  IconButton.outlined(
                    onPressed: context.read<UploadCubit>().pickFile,
                    icon: const Icon(Icons.add),
                  ),
                ],
              ).pxy(x: 8),
            ),
          ).pOnly(bottom: 16),
          Text(
            'Audio Record',
            style: AppStyles.text14Px.interMedium,
          ).pOnly(bottom: 8.r),
          DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: context.color),
            ),
            child: SizedBox(
              height: 54,
              width: double.maxFinite,
              child: BlocBuilder<UploadCubit, UploadState>(
                buildWhen: (p, c) => p.audioPath != c.audioPath,
                builder: (context, state) {
                  if (state.audioPath != null) {
                    return AudioPlayer(
                      source: state.audioPath!,
                      onDelete: () => context.read<UploadCubit>().audioPath(null),
                    );
                  }
                  return Recorder(
                    onStop: context.read<UploadCubit>().audioPath,
                  );
                },
              ).pxy(x: 8),
            ),
          ).pOnly(bottom: 16.r),
          Text(
            'Check Box',
            style: AppStyles.text14Px.interMedium,
          ).pOnly(bottom: 8.r),
          BlocBuilder<UploadCubit, UploadState>(
            buildWhen: (p, c) => p.checkBoxValues != c.checkBoxValues,
            builder: (context, state) {
              return GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 4),
                itemCount: 4,
                itemBuilder: (BuildContext context, int i) {
                  return Row(
                    children: [
                      Checkbox(
                        value: state.checkBoxValues.contains(i),
                        onChanged: (value) => context.read<UploadCubit>().updateCheckBox(index: i, isAdd: value!),
                      ),
                      Text('Value $i'),
                    ],
                  );
                },
              );
            },
          ).pOnly(bottom: 16.r),
          Text(
            'Radio Button',
            style: AppStyles.text14Px.interMedium,
          ).pOnly(bottom: 8.r),
          BlocBuilder<UploadCubit, UploadState>(
            buildWhen: (p, c) => p.radioButtonValue != c.radioButtonValue,
            builder: (context, state) {
              return Row(
                children: List.generate(
                  2,
                  (i) {
                    return Flexible(
                      child: Row(
                        children: [
                          Radio(
                            value: i,
                            groupValue: state.radioButtonValue,
                            onChanged: context.read<UploadCubit>().updateRadio,
                          ),
                          Text('Value $i'),
                        ],
                      ),
                    );
                  },
                ),
              );
            },
          ).pOnly(bottom: 16.r),
          Text(
            'DropDown Button',
            style: AppStyles.text14Px.interMedium,
          ).pOnly(bottom: 8.r),
          Row(
            children: [
              Flexible(
                child: BlocBuilder<UploadCubit, UploadState>(
                  buildWhen: (p, c) => p.dropDownValue != c.dropDownValue,
                  builder: (context, state) {
                    return SizedBox(
                      width: double.maxFinite,
                      child: DropdownButton(
                        value: state.dropDownValue,
                        underline: const SizedBox.shrink(),
                        hint: const Text('Please select a value'),
                        items: List.generate(4, (i) => DropdownMenuItem(value: i, child: Text('Value $i'))),
                        onChanged: context.read<UploadCubit>().selectDropDown,
                      ),
                    );
                  },
                ),
              ),
              IconButton.outlined(
                onPressed: () => context.read<UploadCubit>().selectDropDown(null),
                icon: const Icon(Icons.clear),
              ),
            ],
          ).pOnly(bottom: 16.r),
          Text(
            'Date Picker',
            style: AppStyles.text14Px.interMedium,
          ).pOnly(bottom: 8.r),
          DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: context.color),
            ),
            child: SizedBox(
              height: 54,
              width: double.maxFinite,
              child: Row(
                children: [
                  Flexible(
                    child: SizedBox(
                      height: 54,
                      width: double.maxFinite,
                      child: BlocBuilder<UploadCubit, UploadState>(
                        buildWhen: (p, c) => p.dateTime != c.dateTime,
                        builder: (context, state) {
                          return Text('${state.dateTime ?? 'Please select date'}').align(Alignment.centerLeft);
                        },
                      ),
                    ),
                  ),
                  IconButton.filled(
                    onPressed: () {
                      showDatePicker(
                        context: context,
                        firstDate: DateTime.now(),
                        lastDate: DateTime.now().add(
                          const Duration(days: 364),
                        ),
                      ).then(context.read<UploadCubit>().selectDate);
                    },
                    icon: const Icon(Icons.date_range),
                  ),
                ],
              ).pxy(x: 8),
            ),
          ).pOnly(bottom: 16.r),
          Text(
            'Time Picker',
            style: AppStyles.text14Px.interMedium,
          ).pOnly(bottom: 8.r),
          DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: context.color),
            ),
            child: SizedBox(
              height: 54,
              width: double.maxFinite,
              child: Row(
                children: [
                  Flexible(
                    child: SizedBox(
                      height: 54,
                      width: double.maxFinite,
                      child: BlocBuilder<UploadCubit, UploadState>(
                        buildWhen: (p, c) => p.timeOfDay != c.timeOfDay,
                        builder: (context, state) {
                          return Text(state.timeOfDay?.format(context) ?? 'Please select time').align(Alignment.centerLeft);
                        },
                      ),
                    ),
                  ),
                  IconButton.filled(
                    onPressed: () {
                      showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      ).then(context.read<UploadCubit>().selectTime);
                    },
                    icon: const Icon(Icons.alarm),
                  ),
                ],
              ).pxy(x: 8),
            ),
          ).pOnly(bottom: 16.r),
        ],
      ),
    );
  }
}
