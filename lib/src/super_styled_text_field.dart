import 'package:flutter/material.dart';
import 'package:styled_text_field/src/styled_text_field.dart';

/// built on top of styled text field, this widget shows error messages and adds a button at the end of the text field
class SuperStyledTextField extends StatelessWidget {
  /// hint text to show when no input has been provided
  final String hintText;

  /// on user changed text input
  final Function onChanged;

  /// set to null to hide error message
  final ValueNotifier<String?>? errorMessage;

  /// text editing controller
  final TextEditingController? controller;

  /// set to null to hide
  final Widget? icon;

  /// padding for text field
  final EdgeInsets? padding;

  /// padding for text field
  final EdgeInsets? errTextPadding;

  /// text style for hint text / text field
  final TextStyle? textStyle;

  /// text style for err text
  final TextStyle? errTextStyle;

  /// card colour
  final Color? cardColour;

  /// cursor colour
  final Color? cursorColour;

  /// shape of card
  final ShapeBorder? cardBorder;

  /// elevation of card
  final double? cardElevation;

  /// error height
  final double? errorHeight;

  const SuperStyledTextField({
    Key? key,
    required this.hintText,
    required this.onChanged,
    this.errorMessage,
    this.controller,
    this.icon,
    this.padding,
    this.errTextPadding,
    this.textStyle,
    this.errTextStyle,
    this.cardColour,
    this.cursorColour,
    this.cardBorder,
    this.cardElevation,
    this.errorHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StyledTextField(
              hintText: hintText,
              onChanged: onChanged,
              controller: controller,
              textStyle: textStyle,
              padding: padding,
              cardColour: cardColour,
              cardBorder: cardBorder,
              cardElevation: cardElevation,
              cursorColour: cursorColour,
            ),
            ValueListenableBuilder<String?>(
              valueListenable: errorMessage ?? ValueNotifier(null),
              builder: (context, errorMessage, child) => AnimatedContainer(
                duration: const Duration(milliseconds: 150),
                height: errorMessage == null ? 0 : errorHeight ?? 15,
                child: Padding(
                  padding: errTextPadding ??
                      const EdgeInsets.only(left: 30, right: 30),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      errorMessage ?? '',
                      style: errTextStyle,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
        icon == null
            ? const SizedBox()
            : Align(
                alignment: Alignment.centerRight,
                child: icon!,
              ),
      ],
    );
  }
}
