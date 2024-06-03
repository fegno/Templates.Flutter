// ignore_for_file: public_member_api_docs

import 'package:{{name.snakeCase()}}/imports_bindings.dart';
import 'package:flutter/material.dart';

///
class Button extends StatefulWidget {
  ///
  factory Button.filled({
    required String title,
    required void Function() ontap,
    TextStyle? style,
    double raduis = 8,
    bool isLoading = false,
    bool isDisabled = false,
    Size? size,
  }) {
    return Button._(
      title: title,
      ontap: ontap,
      raduis: raduis,
      isLoading: isLoading,
      style: style,
      isDisabled: isDisabled,
      size: size,
      color: switch (isDisabled) {
        true => AppColors.primaryColor.withOpacity(0.5),
        false => AppColors.primaryColor,
      },
      side: BorderSide.none,
    );
  }

  ///
  factory Button.outlined({
    required String title,
    required void Function() ontap,
    required double raduis,
    TextStyle? style,
  }) {
    return Button._(
      title: title,
      ontap: ontap,
      raduis: raduis,
      isLoading: false,
      style: style,
      isDisabled: false,
      color: Colors.white,
      side: const BorderSide(
        color: AppColors.primaryColor,
      ),
    );
  }

  ///
  const Button._({
    required this.title,
    required this.ontap,
    required this.raduis,
    required this.isLoading,
    required this.isDisabled,
    required this.color,
    required this.side,
    this.style,
    this.size,
  });

  final String title;
  final void Function() ontap;
  final TextStyle? style;
  final double raduis;
  final bool isLoading;
  final bool isDisabled;
  final Size? size;
  final Color color;
  final BorderSide side;

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: ElevatedButton(
        onPressed: () {
          if (!widget.isLoading && !widget.isDisabled) {
            widget.ontap();
          }
        },
        child: widget.isLoading
            ? SizedBox.square(
                dimension: 20,
                child: CircularProgressIndicator(strokeWidth: 2, color: Theme.of(context).scaffoldBackgroundColor),
              )
            : Text(
                widget.title,
                style: widget.style ?? Theme.of(context).elevatedButtonTheme.style?.textStyle?.resolve({}),
              ),
      ),
    );
  }
}
