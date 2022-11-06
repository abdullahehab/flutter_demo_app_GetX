import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo_app/core/extensions/extension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CustomTextField extends StatelessWidget {
  final Widget? suffixIcon;
  final String? hint;
  final String? outLineText;
  final bool? obscureText;
  final bool? withShadow;
  final ValueChanged<String>? onChangedText;
  final TextEditingController? controller;
  final EdgeInsetsGeometry? contentPadding;
  final bool? enabled;
  final Color? backGroundColor;
  final TextInputType? textInputType;
  final ValueChanged<String>? onFieldSubmitted;
  final String? iconPath;
  final double? iconPathWidth;
  final double? borderRadius;
  final double? height;
  final Color? borderColor;
  final double? textFieldWidth;
  final TextStyle? hintTextStyle;
  final TextStyle? outLineTextStyle;
  final int? maxLines;
  final int? maxLength;
  final FocusNode? focusNode;
  final ValueNotifier<bool>? obscurePasswordNotifier;
  final VoidCallback? obscureChanged;
  final TextInputAction? textInputAction;
  final Widget? prefixIcon;
  final FormFieldValidator<String>? validator;
  final String? initialValue;
  final GestureTapCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (outLineText != null)
          Text(
            outLineText!,
            style: outLineTextStyle,
          ),
        const SizedBox(height: 5),
        ValueListenableBuilder(
            valueListenable:
                obscurePasswordNotifier ?? ValueNotifier<bool>(false),
            builder: (BuildContext context, bool obSecure, _) =>
                FormField<String>(
                  validator: (String? value) {
                    if (validator != null) {
                      final String? valid = validator!(value ?? '');

                      return valid;
                    }

                    return null;
                  },
                  builder: (field) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: textFieldWidth ?? context.width,
                        height: height ?? 45.h,
                        decoration: BoxDecoration(
                          color: backGroundColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: TextFormField(
                          textInputAction: textInputAction,
                          onChanged: (String value) {
                            field.setValue(value);
                            field.validate();

                            if (onChangedText != null) {
                              onChangedText!(value);
                            }
                          },
                          onFieldSubmitted: onFieldSubmitted,
                          obscureText: obSecure,
                          initialValue: initialValue,
                          onTap: onTap,
                          controller: controller,
                          keyboardType: textInputType,
                          enabled: enabled,
                          maxLines: maxLines ?? 1,
                          maxLength: maxLength,
                          focusNode: focusNode,
                          // cursorColor: AppColors.greenColor,
                          decoration: InputDecoration(
                            counterText: "",
                            contentPadding: contentPadding,
                            fillColor: Colors.red,
                            suffixIcon: obscurePasswordNotifier != null
                                ? Container(
                                    decoration: BoxDecoration(
                                      //color: AppColors.greyColor.withOpacity(.5),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ).addPaddingAll(1)
                                : suffixIcon,
                            border: InputBorder.none,
                            hintText: hint,
                            hintStyle: hintTextStyle,
                            prefixIcon: prefixIcon,
                            focusedBorder: inputBorder(
                                borderColor:
                                    field.hasError ? Colors.red : borderColor),
                            enabledBorder: inputBorder(
                                borderColor:
                                    field.hasError ? Colors.red : borderColor),
                            errorBorder: inputBorder(
                                borderColor:
                                    field.hasError ? Colors.red : borderColor),
                            disabledBorder: inputBorder(
                                borderColor:
                                    field.hasError ? Colors.red : borderColor),
                            focusedErrorBorder: inputBorder(
                                borderColor:
                                    field.hasError ? Colors.red : borderColor),
                          ),
                        ),
                      ),
                      if (validator != null)
                        (field.hasError)
                            ? Text(
                                '${field.errorText}',
                                style: TextStyle(
                                  fontSize: 10.h,
                                  height: 0.6,
                                  color: Colors.red.shade800,
                                ),
                              ).addPaddingOnly(right: 0, top: 10)
                            : const SizedBox(
                                height: 0,
                              ),
                    ],
                  ),
                )),
      ],
    );
  }

  InputBorder? inputBorder({Color? borderColor}) => OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(color: borderColor ?? Colors.red),
      );

  const CustomTextField(
      {Key? key,
      @required this.hint,
      @required this.textInputType,
      this.controller,
      this.iconPathWidth,
      this.suffixIcon,
      this.iconPath,
      this.height,
      this.hintTextStyle,
      this.outLineText,
      this.maxLines,
      this.maxLength,
      this.borderColor,
      this.onFieldSubmitted,
      this.textFieldWidth,
      this.contentPadding,
      this.obscureChanged,
      this.prefixIcon,
      this.obscurePasswordNotifier,
      this.backGroundColor,
      this.outLineTextStyle,
      this.borderRadius,
      this.textInputAction,
      this.validator,
      this.focusNode,
      this.initialValue,
      this.obscureText = false,
      this.withShadow = false,
      this.onChangedText,
      this.onTap,
      this.enabled})
      : super(key: key);
}
