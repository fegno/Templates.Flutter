// // ignore_for_file: public_member_api_docs

// import 'dart:ui' as ui show BoxHeightStyle, BoxWidthStyle;
// import 'package:{{name.snakeCase()}}/imports_bindings.dart';
// import 'package:flutter/gestures.dart';

// export 'package:flutter/services.dart' show SmartDashesType, SmartQuotesType;

// class TextFormField extends FormField<String> {
//   TextFormField({
//     super.key,
//     this.controller,
//     String? initialValue,
//     FocusNode? focusNode,
//     InputDecoration? decoration = const InputDecoration(),
//     TextInputType? keyboardType,
//     TextCapitalization textCapitalization = TextCapitalization.none,
//     TextInputAction? textInputAction,
//     TextStyle? style,
//     StrutStyle? strutStyle,
//     TextDirection? textDirection,
//     TextAlign textAlign = TextAlign.start,
//     TextAlignVertical? textAlignVertical,
//     bool autofocus = false,
//     bool readOnly = false,
//     @Deprecated(
//       'Use `contextMe>nuBuilder` instead. '
//       'This feature was deprecated after v3.3.0-0.5.pre.',
//     )
//     ToolbarOptions? toolbarOptions,
//     bool? showCursor,
//     String obscuringCharacter = '•',
//     bool obscureText = false,
//     bool autocorrect = true,
//     SmartDashesType? smartDashesType,
//     SmartQuotesType? smartQuotesType,
//     bool enableSuggestions = true,
//     MaxLengthEnforcement? maxLengthEnforcement,
//     int? maxLines = 1,
//     int? minLines,
//     bool expands = false,
//     int? maxLength,
//     this.onChanged,
//     GestureTapCallback? onTap,
//     bool onTapAlwaysCalled = false,
//     TapRegionCallback? onTapOutside,
//     VoidCallback? onEditingComplete,
//     ValueChanged<String>? onFieldSubmitted,
//     super.onSaved,
//     super.validator,
//     List<TextInputFormatter>? inputFormatters,
//     bool? enabled,
//     double cursorWidth = 2.0,
//     double? cursorHeight,
//     Radius? cursorRadius,
//     Color? cursorColor,
//     Color? cursorErrorColor,
//     Brightness? keyboardAppearance,
//     EdgeInsets scrollPadding = const EdgeInsets.all(20),
//     bool? enableInteractiveSelection,
//     TextSelectionControls? selectionControls,
//     InputCounterWidgetBuilder? buildCounter,
//     ScrollPhysics? scrollPhysics,
//     Iterable<String>? autofillHints,
//     AutovalidateMode? autovalidateMode,
//     ScrollController? scrollController,
//     super.restorationId,
//     bool enableIMEPersonalizedLearning = true,
//     MouseCursor? mouseCursor,
//     EditableTextContextMenuBuilder? contextMenuBuilder = _defaultContextMenuBuilder,
//     SpellCheckConfiguration? spellCheckConfiguration,
//     TextMagnifierConfiguration? magnifierConfiguration,
//     UndoHistoryController? undoController,
//     AppPrivateCommandCallback? onAppPrivateCommand,
//     bool? cursorOpacityAnimates,
//     ui.BoxHeightStyle selectionHeightStyle = ui.BoxHeightStyle.tight,
//     ui.BoxWidthStyle selectionWidthStyle = ui.BoxWidthStyle.tight,
//     DragStartBehavior dragStartBehavior = DragStartBehavior.start,
//     ContentInsertionConfiguration? contentInsertionConfiguration,
//     MaterialStatesController? statesController,
//     Clip clipBehavior = Clip.hardEdge,
//     bool scribbleEnabled = true,
//     bool canRequestFocus = true,
//   })  : assert(initialValue == null || controller == null),
//         assert(obscuringCharacter.length == 1),
//         assert(maxLines == null || maxLines > 0),
//         assert(minLines == null || minLines > 0),
//         assert(
//           (maxLines == null) || (minLines == null) || (maxLines >= minLines),
//           "minLines can't be greater than maxLines",
//         ),
//         assert(
//           !expands || (maxLines == null && minLines == null),
//           'minLines and maxLines must be null when expands is true.',
//         ),
//         assert(!obscureText || maxLines == 1, 'Obscured fields cannot be multiline.'),
//         assert(maxLength == null || maxLength == TextField.noMaxLength || maxLength > 0),
//         super(
//           initialValue: controller != null ? controller.text : (initialValue ?? ''),
//           enabled: enabled ?? decoration?.enabled ?? true,
//           autovalidateMode: autovalidateMode ?? AutovalidateMode.disabled,
//           builder: (FormFieldState<String> field) {
//             final state = field as _TextFormFieldState;
//             final effectiveDecoration = (decoration ?? const InputDecoration()).applyDefaults(Theme.of(field.context).inputDecorationTheme);
//             void onChangedHandler(String value) {
//               field.didChange(value);
//               onChanged?.call(value);
//             }

//             return UnmanagedRestorationScope(
//               bucket: field.bucket,
//               child: TextField(
//                 restorationId: restorationId,
//                 controller: state._effectiveController,
//                 focusNode: focusNode,
//                 decoration: effectiveDecoration.copyWith(errorText: field.errorText),
//                 keyboardType: keyboardType,
//                 textInputAction: textInputAction,
//                 style: style,
//                 strutStyle: strutStyle,
//                 textAlign: textAlign,
//                 textAlignVertical: textAlignVertical,
//                 textDirection: textDirection,
//                 textCapitalization: textCapitalization,
//                 autofocus: autofocus,
//                 statesController: statesController,
//                 readOnly: readOnly,
//                 showCursor: showCursor,
//                 obscuringCharacter: obscuringCharacter,
//                 obscureText: obscureText,
//                 autocorrect: autocorrect,
//                 smartDashesType: smartDashesType ?? (obscureText ? SmartDashesType.disabled : SmartDashesType.enabled),
//                 smartQuotesType: smartQuotesType ?? (obscureText ? SmartQuotesType.disabled : SmartQuotesType.enabled),
//                 enableSuggestions: enableSuggestions,
//                 maxLengthEnforcement: maxLengthEnforcement,
//                 maxLines: maxLines,
//                 minLines: minLines,
//                 expands: expands,
//                 maxLength: maxLength,
//                 onChanged: onChangedHandler,
//                 onTap: onTap,
//                 onTapAlwaysCalled: onTapAlwaysCalled,
//                 onTapOutside: onTapOutside,
//                 onEditingComplete: onEditingComplete,
//                 onSubmitted: onFieldSubmitted,
//                 inputFormatters: inputFormatters,
//                 enabled: enabled ?? decoration?.enabled ?? true,
//                 cursorWidth: cursorWidth,
//                 cursorHeight: cursorHeight,
//                 cursorRadius: cursorRadius,
//                 cursorColor: cursorColor,
//                 cursorErrorColor: cursorErrorColor,
//                 scrollPadding: scrollPadding,
//                 scrollPhysics: scrollPhysics,
//                 keyboardAppearance: keyboardAppearance,
//                 enableInteractiveSelection: enableInteractiveSelection ?? (!obscureText || !readOnly),
//                 selectionControls: selectionControls,
//                 buildCounter: buildCounter,
//                 autofillHints: autofillHints,
//                 scrollController: scrollController,
//                 enableIMEPersonalizedLearning: enableIMEPersonalizedLearning,
//                 mouseCursor: mouseCursor,
//                 contextMenuBuilder: contextMenuBuilder,
//                 spellCheckConfiguration: spellCheckConfiguration,
//                 magnifierConfiguration: magnifierConfiguration,
//                 undoController: undoController,
//                 onAppPrivateCommand: onAppPrivateCommand,
//                 cursorOpacityAnimates: cursorOpacityAnimates,
//                 selectionHeightStyle: selectionHeightStyle,
//                 selectionWidthStyle: selectionWidthStyle,
//                 dragStartBehavior: dragStartBehavior,
//                 contentInsertionConfiguration: contentInsertionConfiguration,
//                 clipBehavior: clipBehavior,
//                 scribbleEnabled: scribbleEnabled,
//                 canRequestFocus: canRequestFocus,
//               ),
//             );
//           },
//         );
//   final TextEditingController? controller;
//   final ValueChanged<String>? onChanged;

//   static Widget _defaultContextMenuBuilder(BuildContext context, EditableTextState editableTextState) {
//     return AdaptiveTextSelectionToolbar.editableText(
//       editableTextState: editableTextState,
//     );
//   }

//   @override
//   FormFieldState<String> createState() => _TextFormFieldState();
// }

// class _TextFormFieldState extends FormFieldState<String> {
//   RestorableTextEditingController? _controller;

//   TextEditingController get _effectiveController => _textFormField.controller ?? _controller!.value;

//   TextFormField get _textFormField => super.widget as TextFormField;

//   @override
//   void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
//     super.restoreState(oldBucket, initialRestore);
//     if (_controller != null) {
//       _registerController();
//     }
//     setValue(_effectiveController.text);
//   }

//   void _registerController() {
//     assert(_controller != null);
//     registerForRestoration(_controller!, 'controller');
//   }

//   void _createLocalController([TextEditingValue? value]) {
//     assert(_controller == null);
//     _controller = value == null ? RestorableTextEditingController() : RestorableTextEditingController.fromValue(value);
//     if (!restorePending) {
//       _registerController();
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     if (_textFormField.controller == null) {
//       _createLocalController(widget.initialValue != null ? TextEditingValue(text: widget.initialValue!) : null);
//     } else {
//       _textFormField.controller!.addListener(_handleControllerChanged);
//     }
//   }

//   @override
//   void didUpdateWidget(TextFormField oldWidget) {
//     super.didUpdateWidget(oldWidget);
//     if (_textFormField.controller != oldWidget.controller) {
//       oldWidget.controller?.removeListener(_handleControllerChanged);
//       _textFormField.controller?.addListener(_handleControllerChanged);

//       if (oldWidget.controller != null && _textFormField.controller == null) {
//         _createLocalController(oldWidget.controller!.value);
//       }

//       if (_textFormField.controller != null) {
//         setValue(_textFormField.controller!.text);
//         if (oldWidget.controller == null) {
//           unregisterFromRestoration(_controller!);
//           _controller!.dispose();
//           _controller = null;
//         }
//       }
//     }
//   }

//   @override
//   void dispose() {
//     _textFormField.controller?.removeListener(_handleControllerChanged);
//     _controller?.dispose();
//     super.dispose();
//   }

//   @override
//   void didChange(String? value) {
//     super.didChange(value);

//     if (_effectiveController.text != value) {
//       _effectiveController.text = value ?? '';
//     }
//   }

//   @override
//   void reset() {
//     _effectiveController.text = widget.initialValue ?? '';
//     super.reset();
//     _textFormField.onChanged?.call(_effectiveController.text);
//   }

//   void _handleControllerChanged() {
//     if (_effectiveController.text != value) {
//       didChange(_effectiveController.text);
//     }
//   }
// }
