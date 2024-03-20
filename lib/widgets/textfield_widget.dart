import 'package:flutter/material.dart';
import 'package:muslimpocket/commons/global.dart';

class FormContainerWidget extends StatefulWidget {
  final TextEditingController? controller;
  final Key? fieldKey;
  final bool? isPasswordField;
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onFieldSubmitted;
  final TextInputType? inputType;
  final Widget? prefixIcon;
  final bool autoFocus;
  final TextInputAction? textInputAction;

  const FormContainerWidget({
    this.controller,
    this.isPasswordField,
    this.fieldKey,
    this.hintText,
    this.labelText,
    this.helperText,
    this.onSaved,
    this.validator,
    this.onFieldSubmitted,
    this.inputType,
    this.prefixIcon,
    required this.autoFocus,
    this.textInputAction,
  });

  @override
  _FormContainerWidgetState createState() => _FormContainerWidgetState();
}

class _FormContainerWidgetState extends State<FormContainerWidget> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: Global().bgLogin,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        style: TextStyle(
          color: Global().white,
          fontWeight: Global().light,
          fontSize: 14,
        ),
        controller: widget.controller,
        keyboardType: widget.inputType,
        key: widget.fieldKey,
        obscureText: widget.isPasswordField == true ? _obscureText : false,
        onSaved: widget.onSaved,
        autofocus: widget.autoFocus,
        textInputAction: widget.textInputAction,
        validator: widget.isPasswordField == true
            ? (value) {
                if (value == null || value.isEmpty) {
                  return 'Masukkan password';
                }
                return null;
              }
            : (value) {
                if (value == null || value.isEmpty) {
                  return 'Masukkan email';
                }
                return null;
              },
        onFieldSubmitted: widget.onFieldSubmitted,
        decoration: InputDecoration(
          prefixIcon: widget.prefixIcon,
          prefixIconColor: Global().white,
          border: InputBorder.none,
          filled: true,
          fillColor: Global().graySecondary,
          hintText: widget.hintText,
          hintStyle: TextStyle(
            color: Global().white,
            fontWeight: Global().light,
            fontSize: 14,
          ),
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
            child: widget.isPasswordField == true
                ? Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                    color: _obscureText == false ? Colors.blue : Global().white,
                  )
                : const Text(""),
          ),
        ),
      ),
    );
  }
}
