import 'package:{{name.snakeCase()}}/core/core.dart';
import 'package:{{name.snakeCase()}}/imports_bindings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class UpdateProfileSheet extends StatefulWidget {
  const UpdateProfileSheet({super.key});

  @override
  State<UpdateProfileSheet> createState() => _UpdateProfileSheetState();
}

class _UpdateProfileSheetState extends State<UpdateProfileSheet> {
  late final List<String> _lables;
  late final List<TextEditingController> _ctrls;
  late final List<Validator> _validators;
  @override
  void initState() {
    _lables = ['Name *', 'Phone *', 'Company', 'Bio'];
    _ctrls = List.generate(_lables.length, (i) => TextEditingController(text: ['Fegnite', '+91 8590811546', 'Fegno', 'Busy!'][i]));
    _validators = [
      (name) {
        if (name?.isEmpty ?? false) {
          return 'Name is required';
        } else if ((name?.length ?? 0) < 3) {
          return 'should provide minimum 3 letters';
        }
        return null;
      },
      (phone) {
        if (phone?.isEmpty ?? false) {
          return 'Phone is required';
        } else if ((phone?.length ?? 0) < 10) {
          return 'should provide minimum 10 numbers';
        }
        return null;
      },
      null,
      (bio) {
        if ((bio?.length ?? 0) > 70) {
          return 'should provide minimum 70 charecters';
        }
        return null;
      },
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Update Profile ',
          style: AppStyles.text16Px.interSemiBold,
        ),
        centerTitle: true,
        actions: [
          SizedBox.square(
            dimension: kToolbarHeight,
            child: IconButton(
              onPressed: context.pop,
              icon: const Icon(Icons.done),
            ),
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(16.r),
        children: [
          Center(
            child: Stack(
              children: [
                CircleAvatar(
                  backgroundColor: IconTheme.of(context).color,
                  radius: 46.r,
                  child: Text(
                    'F',
                    style: AppStyles.text32Px.interBold.copyWith(color: Theme.of(context).scaffoldBackgroundColor),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: CircleAvatar(
                    backgroundColor: context.theme.scaffoldBackgroundColor.withOpacity(0.8),
                    radius: 46.r,
                    child: Icon(Icons.edit, color: context.color),
                  ),
                ),
              ],
            ),
          ).pOnly(bottom: 48.r),
          ListView.separated(
            primary: false,
            shrinkWrap: true,
            itemCount: _lables.length,
            separatorBuilder: (__, _) {
              return SizedBox(height: 48.r);
            },
            itemBuilder: (BuildContext context, int i) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _lables[i],
                    style: AppStyles.text16Px.interRegular,
                  ),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: _ctrls[i],
                    validator: _validators[i] ?? (v) => null,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(bottom: 16.r, top: 8.r),
                      border: UnderlineInputBorder(
                        borderRadius: BorderRadius.zero,
                        borderSide: BorderSide(
                          color: context.color,
                        ),
                      ),
                      errorBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.zero,
                        borderSide: BorderSide(
                          color: context.color,
                        ),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.zero,
                        borderSide: BorderSide(
                          color: context.color,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.zero,
                        borderSide: BorderSide(
                          color: context.color,
                        ),
                      ),
                      disabledBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.zero,
                        borderSide: BorderSide(
                          color: context.color,
                        ),
                      ),
                      focusedErrorBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.zero,
                        borderSide: BorderSide(
                          color: context.color,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
