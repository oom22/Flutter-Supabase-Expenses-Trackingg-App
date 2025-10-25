import 'package:flutter/material.dart';

class CustomField extends StatefulWidget {
  const CustomField({
    super.key,
    required this.hint,
    required this.label,
    this.borderColor = Colors.black,
    this.controller,
    this.hintStyle,
    this.labelStyle,
    this.prefixIcon,
    this.isPassword = false,
    this.maxLines = 1,
    this.errorMessage,
    this.validator,
    this.maxLength,
    this.keyboardType = TextInputType.text,
    this.enable = true,
  });
  final String label;
  final String hint;
  final Color? borderColor;
  final TextEditingController? controller;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final IconData? prefixIcon;
  final bool? isPassword;
  final bool? enable;
  final int? maxLines;
  final int? maxLength;
  final String? errorMessage;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;

  @override
  State<CustomField> createState() => _CustomFieldState();
}

class _CustomFieldState extends State<CustomField> {
  bool isShowPassword = true;
  IconData suffixIcon = Icons.visibility_off_outlined;
  final key = GlobalKey<FormState>();
  String? error;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: key,
      child: TextFormField(
        controller: widget.controller,
        maxLines: widget.maxLines,
        validator: widget.validator,
        style: widget.enable != true ? TextStyle(color: Colors.black) : null,
        onChanged: (value) {
          if (widget.validator != null) {
            if (key.currentState!.validate()) {
              setState(() {});
            }
          }
        },
        minLines: 1,

        keyboardType: widget.keyboardType,
        maxLength: widget.maxLength,
        obscureText: widget.maxLines! > 1
            ? false
            : widget.isPassword!
            ? isShowPassword
            : false,

        decoration: InputDecoration(
          constraints: BoxConstraints(maxWidth: 360),
          prefix: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Icon(widget.prefixIcon),
          ),
          suffix: widget.maxLines! > 1 || !widget.isPassword!
              ? null
              : IconButton(
                  onPressed: widget.isPassword!
                      ? () {
                          isShowPassword = !isShowPassword;
                          if (isShowPassword) {
                            suffixIcon = Icons.visibility_off_outlined;
                          } else {
                            suffixIcon = Icons.remove_red_eye_outlined;
                          }
                          setState(() {});
                        }
                      : null,
                  icon: Icon(suffixIcon),
                ),
          hintText: widget.hint,
          hintStyle: widget.hintStyle ?? TextStyle(color: Colors.black),
          labelStyle: widget.labelStyle ?? TextStyle(color: Colors.black),
          labelText: widget.label,
          errorText: widget.errorMessage,
          enabled: widget.enable ?? true,
          border: _customBorderEnable(),
          enabledBorder: _customBorderEnable(),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: widget.enable == true ? Colors.green : widget.borderColor!,
              width: widget.enable == true ? 2 : 0.050,
            ),
          ),
          disabledBorder: _customBorderDisabled(),
        ),
      ),
    );
  }

  InputBorder _customBorderEnable() {
    InputBorder border = (widget.maxLines ?? 1) > 1
        ? OutlineInputBorder(
            borderSide: BorderSide(
              color: widget.enable == true ? Colors.green : widget.borderColor!,
              width: 1,
            ),
          )
        : UnderlineInputBorder(
            borderSide: BorderSide(
              color: widget.enable == true ? Colors.green : widget.borderColor!,
              width: widget.enable == true ? 1 : 2,
            ),
          );

    return border;
  }

  InputBorder _customBorderDisabled() {
    InputBorder border = (widget.maxLines ?? 1) > 1
        ? OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 0.050),
          )
        : UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 0.050),
          );

    return border;
  }
}
