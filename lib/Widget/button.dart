import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final VoidCallback onclicked;

  const Button({Key key, @required this.text, @required this.onclicked})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: StadiumBorder(),
      ),
      onPressed: onclicked,
      child: Text(text),
    );
  }
}
