import 'package:flutter/material.dart';

class TextInput extends StatefulWidget {
  final visibilityOption;
  final labelText;
  final controller;
  const TextInput({Key? key, required this.visibilityOption, required this.labelText, required this.controller}) : super(key: key);

  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  var _passwordVisible;

  @override
  void initState() {
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return widget.visibilityOption ? TextField(
      controller: widget.controller,
      obscureText: !_passwordVisible,
      decoration: InputDecoration(
          labelText: widget.labelText,
          filled: true,
          fillColor: Colors.white,
          suffixIcon: IconButton(
            icon: Icon(
              _passwordVisible ? Icons.visibility : Icons.visibility_off,
              color: Theme.of(context).primaryColorDark,
            ),
            onPressed: () {
              setState(() {
                _passwordVisible = !_passwordVisible;
              });
            },
          )
      ),
      enableSuggestions: false,
      autocorrect: false,
    ) : TextField(
      controller: widget.controller,
      obscureText: false,
      decoration: InputDecoration(
        labelText: widget.labelText,
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}
