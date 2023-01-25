import 'package:flutter/material.dart';

class TextInput extends StatefulWidget {
  final visibilityOption;
  final labelText;
  const TextInput({Key? key, required this.visibilityOption, required this.labelText}) : super(key: key);

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
      obscureText: false,
      decoration: InputDecoration(
        labelText: widget.labelText,
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}
