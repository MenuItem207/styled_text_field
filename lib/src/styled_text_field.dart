import 'package:flutter/material.dart';

/// text field
class StyledTextField extends StatelessWidget {
  final String hintText;
  final Function onChanged;
  final TextEditingController? controller;
  final EdgeInsets? padding;
  final Color? cardColour;
  final Color? cursorColour;
  final TextStyle? textStyle;
  final ShapeBorder? cardBorder;
  final double? cardElevation;
  const StyledTextField({
    Key? key,
    required this.hintText,
    required this.onChanged,
    this.controller,
    this.padding,
    this.cardColour,
    this.cursorColour,
    this.textStyle,
    this.cardBorder,
    this.cardElevation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: cardElevation ?? 10,
      shape: cardBorder ??
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: cardColour ?? Colors.blue,
      child: Padding(
        padding: padding ??
            const EdgeInsets.only(
              top: 10,
              bottom: 10,
              left: 20,
            ),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
            border: InputBorder.none,
            hintStyle: textStyle,
          ),
          style: textStyle,
          onChanged: (value) => onChanged(value),
          cursorColor: cursorColour,
        ),
      ),
    );
  }
}
