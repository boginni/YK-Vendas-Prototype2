import 'package:flutter/material.dart';

class FormText extends StatelessWidget {

  FormText({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 16),
        ),
        TextFormField(
          autocorrect: false,
        ),
      ],
    );
  }
}
