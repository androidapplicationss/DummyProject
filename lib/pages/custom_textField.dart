import 'package:flutter/material.dart';
import 'package:netzero/util/color_constants.dart';


class CustomTextField extends StatefulWidget {
  const CustomTextField(
      {Key? key,
      required this.hintTextString,
      this.textEditController,
      required this.inputType,
      this.enableBorder = true,
      this.themeColor = Colors.black,
      this.cornerRadius = 5,
      this.maxLength = 50,
      this.textColor = Colors.black,
      this.errorMessage = "",
      this.labelText = "",
      this.maxLines = 5,
      this.enableCornerRadius = true})
      : super(key: key);

  final hintTextString;
  final TextEditingController? textEditController;
  final InputType inputType;
  final bool enableBorder;
  final Color themeColor;
  final double cornerRadius;
  final int maxLength;
  final Color textColor;
  final String errorMessage;
  final String labelText;
  final bool enableCornerRadius;
  final int maxLines;

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

// input text state
class _CustomTextFieldState extends State<CustomTextField> {
  bool _isValidate = true;
  String validationMessage = '';
  bool visibility = false;
  int oldTextSize = 0;

  // build method for UI rendering
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.textEditController,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: widget.hintTextString as String,
        hintStyle: TextStyle(color: favIconBack),
        errorText: _isValidate
            ? null
            : checkValidation(widget.textEditController!.text),
        counterText: '',
        border: getBorder(),
        enabledBorder:
            widget.enableBorder ? getBorder() : getDefaultCornerRadius(),
        //focusedBorder: widget.enableBorder ? getBorder() : InputBorder.none,
        focusedBorder:
            widget.enableBorder ? getBorderfocused() : getDefaultCornerRadius(),
        labelText: widget.labelText,
        labelStyle: getTextStyle(),
        suffixIcon: getSuffixIcon(),
        //  prefixIcon: getPrefixIcon()
      ),
      onChanged: checkValidation,
      keyboardType: getInputType(),
      maxLength: widget.maxLength,
      obscureText: widget.inputType == InputType.passwordtype && !visibility,
      style: TextStyle(
        color: widget.textColor,
      ),
    );
  }

  //get border of textinput filed
  OutlineInputBorder getBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(widget.cornerRadius)),
      borderSide: BorderSide(width: 1, color: buttonColor),
      gapPadding: 2,
    );
  }

  OutlineInputBorder getBorderfocused() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(widget.cornerRadius)),
      borderSide: BorderSide(width: 2, color: buttonColor),
      gapPadding: 2,
    );
  }

  OutlineInputBorder getDefaultCornerRadius() {
    return OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(0.0)),
      borderSide: BorderSide(width: 1, color: bottomAppColor),
      gapPadding: 2,
    );
  }

  // text style for textinput
  TextStyle getTextStyle() {
    return TextStyle(
        color: favIconBack, fontSize: 16, fontWeight: FontWeight.w400);
  }

  // input validations

  String checkValidation(String textFieldValue) {
    if (widget.inputType == InputType.nameType) {
      _isValidate = textFieldValue.isNotEmpty;
      validationMessage = widget.errorMessage;
    }
    return validationMessage;
  }

  // return input type for setting keyboard
  TextInputType getInputType() {
    switch (widget.inputType) {
      case InputType.defaulttype:
        return TextInputType.text;
      case InputType.passwordtype:
        return TextInputType.text;

      case InputType.emailtype:
        return TextInputType.emailAddress;

      case InputType.numbertype:
        return TextInputType.number;

      default:
        return TextInputType.text;
    }
  }

  // get suffix icon
  Widget getSuffixIcon() {
    if (widget.inputType == InputType.passwordtype) {
      return IconButton(
        onPressed: () {
          visibility = !visibility;
          setState(() {});
        },
        icon: Icon(
          visibility ? Icons.visibility : Icons.visibility_off,
          color: widget.themeColor,
        ),
      );
    } else {
      return const Icon(null);
    }
  }

  // if Value is null
  int getMaxLength() {
    switch (widget.inputType) {
      case InputType.defaulttype:
        return 3;
      case InputType.defaulttype:
        return 3;

      case InputType.emailtype:
        return 3;

      case InputType.numbertype:
        return 10;

      case InputType.passwordtype:
        return 24;

      default:
        return 36;
    }
  }

  // get prefix Icon
  Icon getPrefixIcon() {
    switch (widget.inputType) {
      case InputType.emailtype:
        return Icon(
          Icons.email,
          color: widget.themeColor,
        );

      case InputType.numbertype:
        return Icon(
          Icons.phone,
          color: widget.themeColor,
        );

      case InputType.passwordtype:
        return Icon(
          Icons.lock,
          color: widget.themeColor,
        );

      default:
        return const Icon(null);
    }
  }
}

//input types
enum InputType { defaulttype, emailtype, numbertype, passwordtype, nameType }
