import 'package:arrk_1/constants/constant_colors.dart';
import 'package:arrk_1/views/pages/home_page.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final int maxLength;
  final int maxLines;
  final TextInputType inputType;

  const TextFieldWidget({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.maxLength,
    required this.maxLines,
    this.inputType = TextInputType.name,

  }) : super(key: key);

  @override
  _TextFieldWidgetState createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  final FocusNode _focusNode = FocusNode();
  bool _hasFocus = false;
  bool _isChecked = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _hasFocus = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _hasFocus || widget.controller.text.isNotEmpty
            ? GestureDetector(
          onTap: () {
            setState(() {
              _isChecked = !_isChecked;
            });
          },
          child: Icon(
            _isChecked ? Icons.check_box : Icons.check_box_outline_blank,
            color: ConstantsColors.primary,
          ),
        )
            : Checkbox(
          value: _isChecked,
          onChanged: (value) {
            setState(() {
              _isChecked = value ?? false;
            });
          },
        ),
        const SizedBox(width: 8),
        Expanded(
          child: TextFormField(
            focusNode: _focusNode,
            controller: widget.controller,
            maxLines: widget.maxLines,
            maxLength: widget.maxLength,
            keyboardType: widget.inputType,
            style: const TextStyle(
              color: ConstantsColors.primary,
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
            decoration: InputDecoration(
              errorText: _getErrorText(),
              hintText: widget.hintText,
              hintStyle: TextStyle(color: ConstantsColors.textColor.withAlpha(80)),

            ),
            onChanged: (text) {
              setState(() {
                if (!_hasFocus) {
                  HomePage.isPriceValid = _validateInput(text);
                }
              });
            },
            onEditingComplete: () {
              FocusScope.of(context).unfocus();
            },
          ),
        ),
      ],
    );
  }

  String? _getErrorText() {
    final text = widget.controller.value.text;
    if (!_hasFocus && text.isEmpty) {
      return 'Field can\'t be empty';
    } else if (!_hasFocus && !_validateInput(text)) {
      return 'Please enter a valid number';
    }
    return null;
  }

  bool _validateInput(String text) {
    final double? number = double.tryParse(text);
    if (number == null) {
      return false;
    }
    return true;
  }
}
