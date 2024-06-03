// ignore_for_file: public_member_api_docs

import 'package:{{name.snakeCase()}}/imports_bindings.dart';
import 'package:flutter/scheduler.dart';

class KField extends StatefulWidget {
  const KField({
    super.key,
    this.fieldKey,
    this.controller,
    this.initialValue,
    this.focusNode,
    this.decoration,
    this.keyboardType,
    this.textCapitalization = TextCapitalization.none,
    this.textInputAction,
    this.style,
    this.strutStyle,
    this.textDirection,
    this.textAlign = TextAlign.start,
    this.textAlignVertical,
    this.autofocus = false,
    this.readOnly = false,
    this.maxLengthEnforcement,
    this.maxLines,
    this.minLines,
    this.expands,
    this.maxLength,
    this.onChanged,
    this.onTap,
    this.onTapAlwaysCalled = false,
    this.onTapOutside,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.onSaved,
    this.validator,
    this.inputFormatters,
    this.enabled,
    this.cursorWidth = 2.0,
    this.cursorHeight,
    this.cursorRadius,
    this.cursorColor,
    this.cursorErrorColor,
    this.keyboardAppearance,
    this.autovalidateMode,
    this.obscureText = false,
  });

  final Key? fieldKey;
  final TextEditingController? controller;
  final String? initialValue;
  final FocusNode? focusNode;
  final InputDecoration? decoration;
  final TextInputType? keyboardType;
  final TextCapitalization textCapitalization;
  final TextInputAction? textInputAction;
  final TextStyle? style;
  final StrutStyle? strutStyle;
  final TextDirection? textDirection;
  final TextAlign textAlign;
  final TextAlignVertical? textAlignVertical;
  final bool autofocus;
  final bool readOnly;
  final MaxLengthEnforcement? maxLengthEnforcement;
  final int? maxLines;
  final int? minLines;
  final bool? expands;
  final int? maxLength;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final bool onTapAlwaysCalled;
  final void Function(PointerDownEvent)? onTapOutside;
  final void Function()? onEditingComplete;
  final void Function(String)? onFieldSubmitted;
  final void Function(String?)? onSaved;
  final String? Function(String? text)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final bool? enabled;
  final double cursorWidth;
  final double? cursorHeight;
  final Radius? cursorRadius;
  final Color? cursorColor;
  final Color? cursorErrorColor;
  final Brightness? keyboardAppearance;
  final AutovalidateMode? autovalidateMode;
  final bool obscureText;

  @override
  State<KField> createState() => _KFieldState();
}

class _KFieldState extends State<KField> {
  late final MaterialStatesController _stateController;

  @override
  void initState() {
    _stateController = MaterialStatesController();
    _stateController.addListener(() {
      SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
        setState(() {
          write('current state is : ${_stateController.value}');
        });
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final text = widget.controller?.text;
    final errorText = widget.validator!.call(text);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 52,
          width: context.width,
          child: TextFormField(
            key: widget.fieldKey,
            controller: widget.controller,
            initialValue: widget.initialValue,
            focusNode: widget.focusNode,
            decoration: (widget.decoration ?? const InputDecoration()).copyWith(
              contentPadding: const EdgeInsets.only(top: 16, right: 16, left: 16, bottom: 16),
              errorMaxLines: 1,
              errorStyle: const TextStyle(
                color: Colors.transparent,
                fontSize: 0,
              ),
            ),
            validator: widget.validator,
            keyboardType: widget.keyboardType,
            textCapitalization: widget.textCapitalization,
            textInputAction: widget.textInputAction,
            style: widget.style ?? AppStyles.text16Px.interRegular,
            strutStyle: widget.strutStyle,
            textDirection: widget.textDirection,
            textAlign: widget.textAlign,
            textAlignVertical: widget.textAlignVertical,
            autofocus: widget.autofocus,
            readOnly: widget.readOnly,
            maxLengthEnforcement: widget.maxLengthEnforcement,
            maxLines: widget.maxLines,
            minLines: widget.minLines,
            expands: widget.expands ?? true,
            maxLength: widget.maxLength,
            onChanged: widget.onChanged,
            onTap: widget.onTap,
            onTapAlwaysCalled: widget.onTapAlwaysCalled,
            onTapOutside: widget.onTapOutside,
            onEditingComplete: widget.onEditingComplete,
            onFieldSubmitted: widget.onFieldSubmitted,
            onSaved: widget.onSaved,
            inputFormatters: widget.inputFormatters,
            enabled: widget.enabled,
            cursorWidth: widget.cursorWidth,
            cursorHeight: widget.cursorHeight ?? 28,
            cursorRadius: widget.cursorRadius,
            cursorColor: widget.cursorColor ?? IconTheme.of(context).color,
            cursorErrorColor: widget.cursorErrorColor ?? IconTheme.of(context).color,
            keyboardAppearance: widget.keyboardAppearance,
            autovalidateMode: widget.autovalidateMode,
            obscureText: widget.obscureText,
            statesController: _stateController,
          ),
        ),

        //*
        if (widget.controller != null && widget.validator != null)
          switch ((errorText?.isEmpty ?? true) || !_stateController.value.contains(MaterialState.error)) {
            true => const SizedBox.shrink(),
            false => Text(
                errorText!,
                textAlign: TextAlign.start,
                style: Theme.of(context).inputDecorationTheme.errorStyle,
              ).pxy(y: 8.r),
          },
      ],
    );
  }

  @override
  void dispose() {
    _stateController.dispose();
    super.dispose();
  }
}
