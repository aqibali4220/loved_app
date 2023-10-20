import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/colors.dart';
import '../utils/size_config.dart';
import '../utils/text_styles.dart';



class CustomPasswordTextField extends StatefulWidget {
  final double? height;
  final double? width;
  final String text;
  final int length;
  final TextInputType keyboardType;
  final TextInputFormatter inputFormatters;
  bool? Readonly = false;
  final Icon? icon;
  final InputBorder? border;
  final String? errorText;
  final FocusNode? focusNode;
  final String? suffixtext;
  final int? sufficon;
  final Color? hintColor;
  final Color? backgroundColor;
  final Color? textColor;
  final int? maxlines;
  final TextInputAction? textInputAction;
  final AutovalidateMode? autovalidateMode;
  final Function()? onEditingComplete;

  final Function()? onTap;
  final Function(String)? onFieldSubmitted;
  bool? obscureText;
  TextEditingController? controller;
  FormFieldValidator<String>? validator;
  ValueChanged<String>? onChanged;

  CustomPasswordTextField(
      {Key? key,
        this.height,
        this.width,
        this.controller,
        this.border,
        this.maxlines,
        required this.text,
        this.validator,
        this.sufficon,
        this.onChanged,
        this.errorText,
        this.Readonly,
        this.focusNode,
        this.backgroundColor,
        this.textColor,
        this.hintColor,
        this.icon,
        this.obscureText,
        this.suffixtext,
        this.onTap,
        required this.length,
        required this.keyboardType,
        required this.inputFormatters,
        this.autovalidateMode,
        this.onEditingComplete,
        this.onFieldSubmitted,
        this.textInputAction})
      : super(key: key);

  @override
  State<CustomPasswordTextField> createState() => _CustomPasswordTextFieldState();
}

class _CustomPasswordTextFieldState extends State<CustomPasswordTextField> {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    SizeConfig().init(context);

    return Container(
      height: widget.height ?? getHeight(40),
      width: widget.width ?? mediaQuery.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: widget.backgroundColor ?? textFieldClr),
      child: TextFormField(
        onTap: widget.onTap,
        autovalidateMode:
        widget.autovalidateMode ?? AutovalidateMode.onUserInteraction,
        maxLength: widget.length,
        autofocus: false,
        cursorHeight: 25,
        maxLines: widget.maxlines ?? 1,
        focusNode: widget.focusNode,
        onFieldSubmitted: widget.onFieldSubmitted,
        validator: widget.validator ??
                (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
        style: kSize16W400ColorBlack,
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        onEditingComplete: widget.onEditingComplete,
        onChanged: widget.onChanged,
        inputFormatters: <TextInputFormatter>[widget.inputFormatters],
        textInputAction: widget.textInputAction ?? TextInputAction.next,
        readOnly: widget.Readonly == true ? true : false,
        obscureText: widget.obscureText == true ? true : false,
        decoration: InputDecoration(
          suffixIcon: (widget.sufficon != null)
              ? GestureDetector(
              onTap: () {
                setState(() {
                  widget.obscureText = !widget.obscureText!;
                });
              },
              child: Icon(
                widget.obscureText!
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
                size: 20,
              ))
              : null,
          errorText: widget.errorText,
          errorStyle: const TextStyle(fontSize: 0),
          counterText: "",
          border: InputBorder.none,

          // border: const OutlineInputBorder(
          //   borderRadius: BorderRadius.all(
          //     Radius.circular(5),
          //   ),
          //   borderSide: BorderSide(
          //     color: white,
          //     width: 1.0,
          //   ),
          // ),

          hintText: widget.text,
          hintStyle: kSize14ColorBlack.copyWith(color: widget.hintColor ?? greyFont),
          contentPadding: const EdgeInsets.only(left: 8, top:12,right: 8),
          prefixIcon: widget.icon,
          suffixText: widget.suffixtext,
          focusColor: widget.textColor ?? walkThrough2,
        ),
      ),
    );
  }
}
