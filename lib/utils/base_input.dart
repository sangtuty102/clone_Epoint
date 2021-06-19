import 'package:clone_epoint/const/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BuildInputText extends StatefulWidget {
  // final FilledColor fillColor;

  final IconData iconLeading;

  final String imageLeading;

  final String hintText;

  final TextEditingController controller;

  final FocusNode currentNode;

  final FocusNode nextNode;

  final bool isPassword;

  final String isStringEmpty;

  final TextInputAction iconNextTextInputAction;

  final Function submitFunc;

  final Function onNext;

  final TextInputType textInputType;

  final String Function(String) validator;

  final bool onlyNumber;

  final int maxLengthInputForm;

  final Function(String) onChanged;

  BuildInputText(
      {this.iconLeading,
      this.imageLeading,
      @required this.hintText,
      @required this.controller,
      @required this.currentNode,
      this.submitFunc,
      this.onNext,
      this.nextNode,
      this.isPassword = false,
      this.isStringEmpty,
      this.iconNextTextInputAction = TextInputAction.next,
      this.textInputType = TextInputType.text,
      this.validator,
      this.onlyNumber = false,
      this.onChanged,
      this.maxLengthInputForm = 100});

  @override
  _BuildInputTextState createState() => _BuildInputTextState();
}

class _BuildInputTextState extends State<BuildInputText> {
  bool _isShowSuffixIcon = false;
  bool _isShowPassword = false;
  @override
  void initState() {
    _isShowPassword = widget.isPassword;
    widget.controller.addListener(() {
      setState(() {
        _isShowSuffixIcon = widget.controller.text.isNotEmpty;
      });
    });
    super.initState();
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    widget.controller.addListener(() => setState(() {}));

    return Container(
      child: TextFormField(
        inputFormatters: widget.onlyNumber
            ? [
                // WhitelistingTextInputFormatter.digitsOnly,
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(widget.maxLengthInputForm)
              ]
            : [LengthLimitingTextInputFormatter(widget.maxLengthInputForm)],
        style: TextStyle(fontSize: AppDimens.textMedium, color: Colors.black),
        onChanged: (v) {
          if (_isShowSuffixIcon || v.isEmpty) {
            setState(() {
              _isShowSuffixIcon = v.isNotEmpty;
            });
          }
          widget.onChanged != null ? widget.onChanged(v) : null;
        },
        textInputAction: widget.iconNextTextInputAction,
        controller: widget.controller,
        obscureText: _isShowPassword,
        focusNode: widget.currentNode,
        keyboardType: widget.textInputType,
        onFieldSubmitted: (v) {
          if (widget.iconNextTextInputAction.toString() ==
              TextInputAction.next.toString()) {
            FocusScope.of(context).requestFocus(widget.nextNode);
            widget.onNext();
          } else {
            widget.submitFunc();
          }
        },
        validator: widget.validator,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.blue.shade900.withOpacity(0.1),
          hintStyle:
              TextStyle(fontSize: AppDimens.textMedium, color: Colors.grey),
          hintText: widget.hintText,
          errorText: widget.isStringEmpty,
          errorStyle: TextStyle(color: Colors.amber[300]),
          prefixIcon: _buildPrefixIcon(),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(100.0),
              borderSide: BorderSide.none),
          contentPadding: EdgeInsets.symmetric(
              vertical: AppDimens.paddingMedium,
              horizontal: AppDimens.paddingHuge),
          suffixIcon: _buildSuffixIcon(),
        ),
      ),
    );
  }

  Widget _buildSuffixIcon() {
    return _isShowSuffixIcon
        ? GestureDetector(
            onTap: () {
              if (widget.isPassword) {
                setState(() {
                  _isShowPassword = !_isShowPassword;
                });
              } else {
                WidgetsBinding.instance
                    .addPostFrameCallback((_) => widget.controller.clear());
              }
            },
            child: Icon(
              widget.isPassword ? Icons.remove_red_eye_outlined : Icons.clear,
              size: AppDimens.sizeIcon,
              color: Colors.purple.shade900,
            ),
          )
        : null;
  }

  Widget _buildPrefixIcon() {
    return widget.iconLeading != null
        ? Icon(
            widget.iconLeading,
            color: Colors.purple[900],
          )
        : widget.imageLeading == null
            ? null
            : Padding(
                padding: EdgeInsets.all(15),
                child: Image.asset(
                  widget.imageLeading ?? '',
                  height: 3,
                  width: 3,
                  fit: BoxFit.fill,
                  color: Colors.white,
                ),
              );
  }
}
