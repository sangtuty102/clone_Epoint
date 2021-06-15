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

  final bool obscureText;

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
      this.obscureText = false,
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
  bool _isShowButtonClear = false;
  @override
  void initState() {
    widget.controller.addListener(() {
      if (widget.controller.text.isNotEmpty) {
        setState(() {
          _isShowButtonClear = true;
        });
      }
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
        if (_isShowButtonClear || v.isEmpty) {
          setState(() {
            _isShowButtonClear = v.isNotEmpty;
          });
        }
        widget.onChanged(v);
      },
      textInputAction: widget.iconNextTextInputAction,
      controller: widget.controller,
      obscureText: widget.obscureText,
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
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide.none),
          contentPadding: EdgeInsets.all(12),
          suffixIcon: Opacity(
            child: Visibility(
              visible: _isShowButtonClear,
              child: GestureDetector(
                onTap: () {
                  WidgetsBinding.instance
                      .addPostFrameCallback((_) => widget.controller.clear());
                  setState(() {
                    _isShowButtonClear = false;
                  });
                },
                child: Icon(
                  Icons.clear,
                  size: AppDimens.sizeIconSmall,
                  color: Colors.purple.shade900,
                ),
              ),
            ),
            opacity: widget.controller.text.isNotEmpty ? 1.0 : 0,
          )),
    ));
  }

  Widget _buildPrefixIcon() {
    return widget.iconLeading == null
        ? Icon(
            widget.iconLeading,
            color: Colors.purple[900],
          )
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
